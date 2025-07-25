package com.money.management.tracker.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.money.management.tracker.dao.ExpenseDAO;
import com.money.management.tracker.daoimpl.ExpenseDAOImpl;
import com.money.management.tracker.model.Expense;
import com.money.management.tracker.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/expense")
public class ExpenseServlet extends HttpServlet {

    private ExpenseDAO expenseDAO = new ExpenseDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        if ("add".equals(action)) {
            String category = request.getParameter("category");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String description = request.getParameter("description");
            Date expenseDate = null;
            try {
                String expenseDateStr = request.getParameter("expenseDate");
                expenseDate = new SimpleDateFormat("yyyy-MM-dd").parse(expenseDateStr);
            } catch (ParseException e) {
                expenseDate = new Date(); // fallback to today
            }

            Expense expense = new Expense();
            expense.setCategory(category);
            expense.setAmount(amount);
            expense.setDescription(description);
            expense.setExpenseDate(expenseDate);
            expense.setUser(user); // ENSURE THIS IS THE USER FROM SESSION

            expenseDAO.addExpense(expense);
            // Redirect to the servlet (not directly to JSP)
            response.sendRedirect("expense");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Expense> expenses = expenseDAO.getExpensesByUser(user);
        request.setAttribute("expenses", expenses);
        request.getRequestDispatcher("viewExpenses.jsp").forward(request, response);
    }
}