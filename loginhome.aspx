<!DOCTYPE aspx>
<aspx lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📚 The Reader's Gateway</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!--=============== REMIXICONS ===============-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css">

    <style>
        body {
            background-color: #f0f4f8;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background-color: #343a40;
            padding: 20px;
            color: #ffffff;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
            letter-spacing: 1px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.4);
        }
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.5)), url('sports-bg.jpg') center/cover;
            color: #fff;
            text-align: center;
            padding: 120px 20px;
            border-bottom: 4px solid #ffc107;
        }
        .hero-section h1 {
            font-size: 52px;
            font-weight: bold;
            margin-bottom: 20px;
            animation: fadeIn 1.2s ease-in-out;
        }
        .hero-section p {
            font-size: 22px;
            animation: fadeIn 1.5s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            transition: transform 0.4s, box-shadow 0.4s;
            overflow: hidden;
            margin: 10px; /* Added margin for spacing */
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 16px 32px rgba(0,0,0,0.3);
        }
        .card img {
            height: 220px;
            object-fit: cover;
            width: 100%; /* Ensure images fill the card width */
        }
        .card-body {
            padding: 20px;
            text-align: center;
        }
        .card-title {
            font-size: 24px;
            font-weight: bold;
            color: #212529;
            margin-bottom: 10px;
        }
        .card-text {
            font-size: 18px;
            color: #6c757d;
            margin-bottom: 20px;
        }
        .btn-primary {
            background-color: #ffc107;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn-primary:hover {
            background-color: #e0a800;
        }
        .section-title {
            font-size: 32px;
            font-weight: bold;
            color: #212529;
            text-align: center;
            margin: 50px 0;
            position: relative;
        }
        .section-title::after {
            content: '';
            width: 100px;
            height: 4px;
            background-color: #ffc107;
            display: block;
            margin: 10px auto;
            border-radius: 4px;
        }
        .list-group-item {
            font-size: 20px;
            color: #212529;
            border: none;
            padding: 15px;
            background-color: #e9ecef;
            transition: background-color 0.3s, color 0.3s;
        }
        .list-group-item:hover {
            background-color: #d3d3d3;
            color: #000;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="navbar">
    📚 The Reader's Gateway
</div>

<div class="hero-section">
    <h1>"Welcome to Our Bookstore – Your Gateway to Endless Stories!"</h1>
    <p>"Where Every Page Sparks a New Adventure – Your Next Chapter Starts Here!" 📚✨</p>
</div>

<div class="container">
    <h2 class="section-title">Overview of our Website</h2>
    <div class="row">
        <div class="col-12">
            <p>📚 The Reader's Gateway is a digital platform where users can browse, purchase,
                and read descriptions of books. It serves as a virtual alternative to traditional
                brick-and-mortar bookstores, offering a wide range of books across genres and languages.</p>
        </div>
    </div>
</div>

<div class="container">
    <h2 class="section-title">Register in our Website</h2>
    <div class="row justify-content-center"> <!-- Center the cards horizontally -->
        <div class="col-md-4">
            <div class="card">
                <img src="img/lhome1.jpg" class="card-img-top" alt="Sign up">
                <div class="card-body">
                    <h5 class="card-title">Sign up</h5>
                    <p class="card-text">Sign in to explore new books and exclusive discounts.</p>
                    <a href="signup.aspx" class="btn btn-primary">Sign up</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card">
                <img src="img/lhome.jpg" class="card-img-top" alt="Log In">
                <div class="card-body">
                    <h5 class="card-title">Log In</h5>
                    <p class="card-text">Log in with your username and password.</p>
                    <a href="login.aspx" class="btn btn-primary">Log In</a>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <h2 class="section-title">Services</h2>
    <ul class="list-group">
        <li class="list-group-item"><i class="ri-truck-line"></i> Free Shipping – For the First Order</li>
        <li class="list-group-item"><i class="ri-lock-2-line"></i> Secure Payment – 100% Secure Payment</li>
        <li class="list-group-item"><i class="ri-customer-service-2-line"></i> 24/7 Support – Call us anytime</li>
    </ul>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</aspx>