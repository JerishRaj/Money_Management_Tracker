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
    <title>Login - Money Management Tracker</title>
</head>
<body>
    <div class="container form-container">
        <div class="form-card">
            <h2>Login</h2>
            <form action="login" method="post">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control mb-3" required>
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control mb-3" required>
                <input type="submit" value="Login" class="btn btn-primary w-100">
            </form>
            <p class="mt-3 mb-0 text-center">
                Don't have an account?
                <a href="register.jsp" class="no-underline">Register here</a>
            </p>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mt-3 text-center"><%= request.getAttribute("error") %></div>
            <% } %>
        </div>
    </div>
</body>
</html>