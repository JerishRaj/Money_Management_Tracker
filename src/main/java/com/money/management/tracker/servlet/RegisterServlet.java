package com.money.management.tracker.servlet;

import java.io.IOException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.money.management.tracker.model.User;
import com.money.management.tracker.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashed = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashed) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = req.getParameter("userType");
        String monthlyIncomeStr = req.getParameter("monthlyIncome");

        if (password == null || password.trim().isEmpty()) {
            req.setAttribute("error", "Password cannot be empty!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        double monthlyIncome = 0.0;
        try {
            monthlyIncome = Double.parseDouble(monthlyIncomeStr);
        } catch (Exception e) {
            req.setAttribute("error", "Invalid monthly income!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        password = hashPassword(password);

        Transaction tx = null;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            User existing = session.createQuery("FROM User WHERE email = :email", User.class)
                                   .setParameter("email", email)
                                   .uniqueResult();
            if (existing != null) {
                req.setAttribute("error", "Email already registered!");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
                return;
            }

            User user = new User();
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setUserType(userType);
            user.setMonthlyIncome(monthlyIncome);

            session.save(user);
            tx.commit();

            resp.sendRedirect("login.jsp");
        } catch (Exception e) {
            if (tx != null && tx.getStatus().canRollback()) {
                tx.rollback();
            }
            req.setAttribute("error", "Registration failed! Try again.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }
}