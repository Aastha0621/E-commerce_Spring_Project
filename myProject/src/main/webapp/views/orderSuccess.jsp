<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Success | SANG</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/mainPageCss.css">

    <style>
        .success-container {
            margin-top: 120px;
            max-width: 700px;
            text-align: center;
            background: rgba(255, 255, 255, 0.08);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            color: #fff;
        }
        .success-container h1 {
            color: #00f2fe;
            font-weight: 700;
        }
        .success-container p {
            margin-top: 15px;
            font-size: 1.1rem;
            color: #ddd;
        }
        .btn-home {
            margin-top: 25px;
            background: linear-gradient(45deg, #00f2fe, #4facfe);
            border: none;
            color: #fff;
            font-weight: 600;
            border-radius: 10px;
            padding: 12px 30px;
            transition: 0.3s;
        }
        .btn-home:hover {
            background: linear-gradient(45deg, #4facfe, #00f2fe);
            transform: scale(1.05);
            box-shadow: 0 0 15px #00f2fe, 0 0 25px #4facfe;
        }
        .success-icon {
            font-size: 4rem;
            color: #00f2fe;
            margin-bottom: 20px;
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
            <h5 class="text-light mr-3">${user.fullname}</h5>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/orders">My Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="profileDisplay">Profile</a></li>
                <li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Success Message -->
<div class="container d-flex justify-content-center">
    <div class="success-container">
        <i class="fa fa-check-circle success-icon"></i>
        <h1>Thank You for Your Order!</h1>
        <p>Your order <strong>#${orderId}</strong> has been placed successfully.</p>
        <p>We’ll notify you once it’s shipped to <strong>${user.address}</strong>.</p>
        <a href="/" class="btn-home"><i class="fa fa-home"></i> Back to Home</a>
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
