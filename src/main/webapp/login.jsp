<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="component/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <title>Login - Money Management Tracker</title>
    <style>
        body {background: #fff;}
        .form-container {
            margin: 60px auto;
            max-width: 400px;
        }
        .form-card {
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 2px 18px rgba(0,0,0,0.07);
            background: #fff;
        }
        .form-card h2 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
    </style>
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
            <p class="mt-3 mb-0 text-center">Don't have an account? <a href="register.jsp">Register here</a></p>
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger mt-3 text-center"><%= request.getAttribute("error") %></div>
            <% } %>
        </div>
    </div>
</body>
</html>