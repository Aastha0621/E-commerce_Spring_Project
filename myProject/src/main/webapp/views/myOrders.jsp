<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Orders | SANG</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/mainPageCss.css">

    <style>
        .order-card {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.4);
            transition: transform 0.3s ease;
        }
        .order-card:hover {
            transform: scale(1.02);
            box-shadow: 0 12px 25px rgba(0,0,0,0.6);
        }
        .order-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .order-header h5 {
            margin: 0;
            color: #00f2fe;
            font-weight: 600;
        }
        .order-details p {
            margin: 3px 0;
            color: #ddd;
        }
        .status-badge {
            padding: 5px 10px;
            border-radius: 8px;
            font-size: 0.85rem;
            font-weight: 600;
        }
        .status-preparing {
            background: #ffcc00;
            color: #000;
        }
        .status-transit {
            background: #4facfe;
            color: #fff;
        }
        .status-delivered {
            background: #28a745;
            color: #fff;
        }
        .view-btn {
            background: linear-gradient(45deg, #00f2fe, #4facfe);
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 8px;
            padding: 8px 14px;
            transition: 0.3s;
        }
        .view-btn:hover {
            background: linear-gradient(45deg, #4facfe, #00f2fe);
            transform: scale(1.05);
            box-shadow: 0 0 10px #00f2fe, 0 0 20px #4facfe;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">
            <i class="fa fa-store"></i> SANG
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <h5 class="text-light mr-3">${fullName}</h5>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/cart">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="profileDisplay">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- My Orders Section -->
<main class="container" style="margin-top: 90px;">
    <h2 class="text-center text-light mb-4">My Orders</h2>

    <c:if test="${empty orders}">
        <p class="text-center text-light">You have not placed any orders yet 😔</p>
    </c:if>

    <c:forEach var="order" items="${orders}">
        <div class="order-card">
            <div class="order-header">
                <h5>Order #${order.orderNumber}</h5>
                <span class="status-badge 
                    <c:choose>
                        <c:when test="${order.status eq 'Preparing for shipping'}">status-preparing</c:when>
                        <c:when test="${order.status eq 'In Transit'}">status-transit</c:when>
                        <c:when test="${order.status eq 'Delivered'}">status-delivered</c:when>
                    </c:choose>">
                    ${order.status}
                </span>
            </div>
            <div class="order-details">
                <p><strong>Date:</strong> ${order.createdAt}</p>
                <p><strong>Total:</strong> ₹${order.totalAmount}</p>
                <p><strong>Payment ID:</strong> ${order.paymentId}</p>
            </div>
            <div class="text-right">
                <a href="/order/details/${order.id}" class="view-btn">View Details</a>
            </div>
        </div>
    </c:forEach>
</main>

<!-- Footer -->
<footer>
    <p>&copy; 2025 SANG. All Rights Reserved.</p>
</footer>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
