<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="component/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Money Management Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/navbar.css">
    <link rel="stylesheet" href="css/main.css">
</head>
<body>
    <div id="expenseCarousel" class="carousel slide" data-bs-ride="carousel" style="position:relative;">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/img1.jpg" class="d-block w-100" alt="Expense 1">
                <div class="dashboard-caption">
                    <h1>Money Management Tracker</h1>
                    <p>Your go-to solution for managing daily expenses efficiently.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/img2.jpg" class="d-block w-100" alt="Expense 2">
                <div class="dashboard-caption">
                    <h1>Track & Analyze</h1>
                    <p>Visualize your spending habits and stay within your budget.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/img3.jpg" class="d-block w-100" alt="Expense 3">
                <div class="dashboard-caption">
                    <h1>Secure & Simple</h1>
                    <p>Your data is protected. Easy to use, anytime, anywhere.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#expenseCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#expenseCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>