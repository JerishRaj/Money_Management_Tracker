package com.money.management.tracker.servlet;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.money.management.tracker.model.User;
import com.money.management.tracker.util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

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
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        password = hashPassword(password);

        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            Query<User> query = session.createQuery("FROM User WHERE email = :email AND password = :password", User.class);
            query.setParameter("email", email);
            query.setParameter("password", password);

            User user = query.uniqueResult();

            if (user != null) {
                req.getSession().setAttribute("user", user);
                resp.sendRedirect("index.jsp");
            } else {
                req.setAttribute("error", "Invalid credentials!");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }
}