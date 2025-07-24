<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="component/navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Money Management Tracker</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <style>
        html, body {height: 100%; margin: 0; padding: 0;}
        .carousel,
        .carousel-inner,
        .carousel-item,
        .carousel-item img {height: 100vh;}
        .carousel-item img {object-fit: cover; width: 100vw;}
        .dashboard-caption {
            position: absolute;
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: #fff;
            text-align: center;
            width: 100%;
            font-family: 'Segoe UI', sans-serif;
        }
        .dashboard-caption h1 {
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 8px rgba(0,0,0,0.3);
        }
        .dashboard-caption p {
            font-size: 1.3rem;
            font-weight: 400;
            text-shadow: 1px 1px 6px rgba(0,0,0,0.3);
        }
    </style>
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