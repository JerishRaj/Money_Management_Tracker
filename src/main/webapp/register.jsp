<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="component/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/main.css">
    <title>Register - Money Management Tracker</title>
</head>
<body>
    <div class="container form-container">
        <div class="form-card">
            <h2>Register</h2>
            <form action="register" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label for="monthlyIncome" class="form-label">Monthly Income:</label>
                    <input type="number" step="0.01" id="monthlyIncome" name="monthlyIncome" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">User Type:</label>
                    <select name="userType" class="form-control" required>
                        <option value="individual">Individual</option>
                        <option value="bachelor">Bachelor/Group</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary w-100">Register</button>
            </form>
            <p class="mt-3 mb-0 text-center">
                Already have an account?
                <a href="login.jsp" class="no-underline">Login here</a>
            </p>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mt-3 text-center"><%= request.getAttribute("error") %></div>
            <% } %>
        </div>
    </div>
</body>
</html>