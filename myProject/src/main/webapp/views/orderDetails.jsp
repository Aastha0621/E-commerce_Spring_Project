<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details | SANG</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainPageCss.css">


    <style>
        .order-details-card {
            background: rgba(255, 255, 255, 0.08);
            border-radius: 15px;
            padding: 25px;
            margin-top: 90px;
            color: #fff;
            box-shadow: 0 8px 20px rgba(0,0,0,0.4);
        }
        .order-details-card h2 {
            color: #00f2fe;
            font-weight: 700;
        }
        .order-summary p {
            margin: 5px 0;
            color: #ddd;
        }
        .product-card {
            background: rgba(255, 255, 255, 0.05);
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }
        .product-card img {
            width: 90px;
            height: 90px;
            object-fit: contain;
            background: #fff;
            border-radius: 10px;
            margin-right: 15px;
            padding: 8px;
        }
        .product-info h5 {
            color: #00f2fe;
            margin: 0;
            font-weight: 600;
        }
        .product-info p {
            margin: 2px 0;
            color: #ccc;
        }
        .back-btn {
            margin-top: 20px;
            background: linear-gradient(45deg, #00f2fe, #4facfe);
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            padding: 10px 20px;
            transition: 0.3s;
        }
        .back-btn:hover {
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
                <li class="nav-item"><a class="nav-link" href="/myOrders">My Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="profileDisplay">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Order Details -->
<div class="container">
    <div class="order-details-card">
        <h2>Order #${order.orderNumber}</h2>
        <div class="order-summary">
            <p><strong>Status:</strong> ${order.status}</p>
            <p><strong>Payment ID:</strong> ${order.paymentId}</p>
            <p><strong>Total Amount:</strong> ₹${order.totalAmount}</p>
            <p><strong>Placed On:</strong> ${order.createdAt}</p>
        </div>

        <h4 class="mt-4 text-light">Products:</h4>
		<c:forEach var="item" items="${order.orderItems}">
    <div class="product-card">
        <img src="${item.product_image}" alt="${item.product_name}">
        <div class="product-info">
            <h5>${item.product_name}</h5>
            <p>Quantity: ${item.quantity}</p>
            <p>Price: ₹${item.total_price}</p>
        </div>
    </div>
</c:forEach>

        <a href="javascript:history.back()" class="btn back-btn"><i class="fa fa-arrow-left"></i> Back to My Orders</a>
    </div>
</div>

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
