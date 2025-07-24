<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="component/navbar.jsp" %>
<html>
<head>
    <title>Add Expense</title>
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
    <img src="images/img2.jpg" alt="Add Expense Banner" class="expense-banner" height="250px">
    <h2 class="mb-4">Add Expense</h2>
    <form action="expense" method="post">
        <input type="hidden" name="action" value="add">
        <div class="mb-3">
            <label class="form-label">Category:</label>
            <select name="category" class="form-control" required>
                <option>Food</option>
                <option>Transport</option>
                <option>Shopping</option>
                <option>Bills</option>
                <option>Other</option>
            </select>
        </div>
        <div class="mb-3">
            <label class="form-label">Date:</label>
            <input type="date" name="expenseDate" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Amount:</label>
            <input type="number" step="0.01" name="amount" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label">Description:</label>
            <input type="text" name="description" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Add Expense</button>
        <a href="expense" class="btn btn-secondary">View Expenses</a>
    </form>
</div>
</body>
</html>