<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="component/navbar.jsp" %>
<%
    com.money.management.tracker.model.User profileUser = (com.money.management.tracker.model.User) session.getAttribute("user");
    if (profileUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/navbar.css">
    <style>
        .profile-card {
            max-width: 400px;
            margin: 40px auto;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 2px 18px rgba(0,0,0,0.07);
            background: #fff;
        }
        .profile-card h2 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 1.2rem;
        }
        .profile-info {
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-card">
        <h2>Profile</h2>
        <div class="profile-info">
            <p><strong>Name:</strong> <%= profileUser.getUsername() %></p>
            <p><strong>Email:</strong> <%= profileUser.getEmail() %></p>
            <p><strong>User Type:</strong> <%= profileUser.getUserType() %></p>
            <p><strong>Monthly Income:</strong> ₹<%= profileUser.getMonthlyIncome() %></p>
        </div>
    </div>
    <div class="text-center mt-4">
        <button class="btn btn-outline-dark" onclick="window.history.back()">Back</button>
    </div>
</div>
</body>
</html>