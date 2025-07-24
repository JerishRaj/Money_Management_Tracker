<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List,com.money.management.tracker.model.Expense" %>
<%@ include file="component/navbar.jsp" %>
<%
    // OPTIONAL: Safety redirect if accessed directly
    if (request.getAttribute("expenses") == null) {
        response.sendRedirect("expense");
        return;
    }
%>
<html>
<head>
    <title>Your Expenses</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        .expense-banner {
            width: 100%;
            height: 250px;
            object-fit: cover;
            margin-bottom: 2rem;
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container mt-3">
    <img src="images/img3.jpg" alt="View Expense Banner" class="expense-banner">
    <h2>Your Expenses</h2>
    <%
        List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
        if (expenses != null && !expenses.isEmpty()) {
    %>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Category</th>
                <th>Date</th>
                <th>Amount</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
        <% for (Expense e : expenses) { %>
            <tr>
                <td><%= e.getCategory() %></td>
                <td><%= e.getExpenseDate() %></td>
                <td>₹<%= e.getAmount() %></td>
                <td><%= e.getDescription() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
    <%
        } else {
    %>
        <p>No expenses added yet.</p>
    <%
        }
    %>
    <a href="addExpense.jsp" class="btn btn-success mt-3">Add New Expense</a>
    <a href="logout" class="btn btn-danger mt-3">Logout</a>
</div>
</body>
</html>