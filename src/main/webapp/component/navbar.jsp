<%
    Object user = session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg custom-navbar">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="index.jsp">MONEY MANAGEMENT TRACKER</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <% if (user == null) { %>
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp">Register</a></li>
                <% } else { %>
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="addExpense.jsp">Add Expense</a></li>
                    <li class="nav-item"><a class="nav-link" href="expense">View Expenses</a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                    <li class="nav-item"><a class="nav-link logout-link" href="logout">Logout</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>