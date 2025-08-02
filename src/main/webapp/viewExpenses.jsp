<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*,com.money.management.tracker.model.Expense" %>
<%@ include file="component/navbar.jsp" %>
<html>
<head>
    <title>View Expenses</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/navbar.css">
</head>
<body>
<div class="container mt-4">
    <h2>Expenses for <%= request.getAttribute("month") %>/<%= request.getAttribute("year") %></h2>
    <div class="row mb-3">
        <div class="col">
            <strong>Monthly Income:</strong> ₹<%= request.getAttribute("monthlyIncome") %>
        </div>
        <div class="col">
            <strong>Total Expenses:</strong> ₹<%= request.getAttribute("totalExpense") %>
        </div>
        <div class="col">
            <strong>Balance:</strong> ₹<%= request.getAttribute("balance") %>
        </div>
    </div>
    <form class="row mb-4" method="get" action="expense">
        <div class="col-auto">
            <input type="number" name="month" min="1" max="12" class="form-control" value="<%= request.getAttribute("month") %>" required>
        </div>
        <div class="col-auto">
            <input type="number" name="year" min="2000" max="2100" class="form-control" value="<%= request.getAttribute("year") %>" required>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-secondary">Change Month</button>
        </div>
    </form>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Date</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Description</th>
                <th>Split Persons</th>
                <th>Share/Person</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
                if (expenses != null && !expenses.isEmpty()) {
                    for (Expense expense : expenses) {
            %>
            <tr>
                <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(expense.getExpenseDate()) %></td>
                <td><%= expense.getCategory() %></td>
                <td>₹<%= expense.getAmount() %></td>
                <td><%= expense.getDescription() %></td>
                <td><%= expense.getSplitPersons() %></td>
                <td>₹<%= String.format("%.2f", expense.getAmount() / expense.getSplitPersons()) %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="6" class="text-center">No expenses found for this month.</td></tr>
            <% } %>
        </tbody>
    </table>
    <a href="addExpense.jsp" class="btn btn-primary">Add Expense</a>
    <div class="text-center mt-4">
        <button class="btn btn-outline-dark" onclick="window.history.back()">Back</button>
    </div>
</div>
</body>
</html>