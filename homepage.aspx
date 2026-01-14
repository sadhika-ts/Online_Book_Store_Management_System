<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="finalyearproject.homepage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📚 The Reader's Gateway | Your Ultimate Book Destination</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #4a6fa5;
            --secondary-color: #166088;
            --accent-color: #4fc3f7;
            --dark-color: #2d3142;
            --light-color: #f8f9fa;
            --success-color: #28a745;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* Navbar Styles */
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1rem;
        }

        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 1.5rem;
            color: white !important;
            display: flex;
            align-items: center;
        }

        .navbar-brand i {
            margin-right: 10px;
            font-size: 1.8rem;
        }

        .nav-link {
            color: rgba(255, 255, 255, 0.85) !important;
            font-weight: 500;
            padding: 0.5rem 1rem;
            margin: 0 0.2rem;
            transition: all 0.3s ease;
            border-radius: 4px;
        }

        .nav-link:hover, .nav-link.active {
            color: white !important;
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }

        .nav-link i {
            margin-right: 5px;
        }

        .dropdown-menu {
            background-color: white;
            border: none;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 0.5rem 0;
        }

        .dropdown-item {
            padding: 0.5rem 1.5rem;
            color: var(--dark-color);
            transition: all 0.2s ease;
        }

        .dropdown-item:hover {
            background-color: var(--light-color);
            color: var(--primary-color);
            transform: translateX(5px);
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('img/bg.jpg') center/cover no-repeat;
          

            color: white;
            padding: 6rem 0;
            text-align: center;
            position: relative;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
        }

        .hero-title {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 1.5rem;
            animation: fadeInDown 1s ease;
        }

        .hero-subtitle {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            animation: fadeInUp 1s ease 0.3s forwards;
            opacity: 0;
        }

        .hero-btn {
            padding: 0.8rem 2rem;
            font-size: 1.1rem;
            font-weight: 600;
            border-radius: 50px;
            animation: fadeInUp 1s ease 0.6s forwards;
            opacity: 0;
        }

        /* Featured Books Section */
        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .section-title h2 {
            font-family: 'Playfair Display', serif;
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--dark-color);
            position: relative;
            display: inline-block;
        }

        .section-title h2:after {
            content: '';
            position: absolute;
            width: 60px;
            height: 4px;
            background: var(--accent-color);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        /* Book Card */
        .book-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            margin-bottom: 2rem;
            height: 100%;
        }

        .book-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }

        .book-img-container {
            height: 280px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f1f3f5;
        }

        .book-img {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
            transition: transform 0.5s ease;
        }

        .book-card:hover .book-img {
            transform: scale(1.05);
        }

        .book-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: var(--accent-color);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
        }

        .book-body {
            padding: 1.5rem;
        }

        .book-title {
            font-weight: 700;
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            height: 3.2em;
        }

        .book-author {
            color: #6c757d;
            font-size: 0.95rem;
            margin-bottom: 0.75rem;
        }

        .book-price {
            font-weight: 700;
            font-size: 1.3rem;
            color: var(--success-color);
            margin-bottom: 1rem;
        }
        /* Discount Section */
.discount-section {
    padding: 5rem 0;
    background: linear-gradient(135deg, #f5f7fa 0%, #e4e8eb 100%);
    position: relative;
    overflow: hidden;
}

.discount-content {
    position: relative;
    z-index: 2;
}

.discount-title {
    font-family: 'Playfair Display', serif;
    font-size: 2.8rem;
    font-weight: 700;
    color: var(--dark-color);
    margin-bottom: 1.5rem;
    position: relative;
}

.discount-title:after {
    content: '';
    position: absolute;
    width: 60px;
    height: 4px;
    background: var(--accent-color);
    bottom: -10px;
    left: 0;
    border-radius: 2px;
}

.discount-text {
    font-size: 1.2rem;
    color: #6c757d;
    margin-bottom: 2rem;
    max-width: 600px;
}

.discount-books {
    position: relative;
    height: 300px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.book-stack {
    position: relative;
    width: 100%;
    height: 100%;
}

.discount-book {
    width: 180px;
    border-radius: 8px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
    transition: all 0.5s ease;
    position: absolute;
    border: 3px solid white;
}

.discount-book-1 {
    transform: rotate(-15deg);
    z-index: 1;
    left: 0;
    top: 50%;
    margin-top: -120px;
}

.discount-book-2 {
    transform: rotate(0deg);
    z-index: 2;
    left: 50%;
    top: 50%;
    margin-left: -90px;
    margin-top: -135px;
    width: 200px;
}

.discount-book-3 {
    transform: rotate(15deg);
    z-index: 1;
    right: 0;
    top: 50%;
    margin-top: -120px;
}

/* Add a subtle floating animation */
@keyframes float {
    0% { transform: rotate(-15deg) translateY(0px); }
    50% { transform: rotate(-15deg) translateY(-10px); }
    100% { transform: rotate(-15deg) translateY(0px); }
}

@keyframes float2 {
    0% { transform: rotate(0deg) translateY(0px); }
    50% { transform: rotate(0deg) translateY(-10px); }
    100% { transform: rotate(0deg) translateY(0px); }
}

@keyframes float3 {
    0% { transform: rotate(15deg) translateY(0px); }
    50% { transform: rotate(15deg) translateY(-10px); }
    100% { transform: rotate(15deg) translateY(0px); }
}

.discount-book-1 {
    animation: float 4s ease-in-out infinite;
}

.discount-book-2 {
    animation: float2 4s ease-in-out infinite;
    animation-delay: 0.5s;
}

.discount-book-3 {
    animation: float3 4s ease-in-out infinite;
    animation-delay: 1s;
}

/* Responsive adjustments */
@media (max-width: 992px) {
    .discount-title {
        font-size: 2.2rem;
    }
    
    .discount-book {
        width: 140px;
    }
    
    .discount-book-2 {
        width: 160px;
        margin-left: -80px;
    }
}

@media (max-width: 768px) {
    .discount-title {
        font-size: 1.8rem;
    }
    
    .discount-books {
        margin-top: 3rem;
        height: 200px;
    }
    
    .discount-book {
        position: relative;
        margin: 0 auto 1.5rem;
        width: 150px;
        transform: none !important;
        left: auto !important;
        right: auto !important;
        top: auto !important;
        margin-top: 0 !important;
        margin-left: 0 !important;
        animation: none !important;
        display: inline-block;
        margin-right: 1rem;
    }
    
    .discount-book-2 {
        width: 150px;
        margin-left: 0;
    }
    
    .book-stack {
        text-align: center;
        height: auto;
    }
}
        /* Services Section */
        .services-section {
            padding: 5rem 0;
            background-color: white;
        }

        .service-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height: 100%;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }

        .service-icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }

        .service-title {
            font-weight: 600;
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }

        .service-text {
            color: #6c757d;
            font-size: 1rem;
        }

        /* Footer */
        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 4rem 0 2rem;
        }

        .footer-title {
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
        }

        .footer-links h5 {
            font-weight: 600;
            margin-bottom: 1.5rem;
            font-size: 1.2rem;
        }

        .footer-links ul {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 0.8rem;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .footer-links a:hover {
            color: white;
            padding-left: 5px;
        }

        .social-links a {
            display: inline-block;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 50%;
            text-align: center;
            line-height: 40px;
            margin-right: 10px;
            transition: all 0.3s ease;
        }

        .social-links a:hover {
            background-color: var(--accent-color);
            transform: translateY(-5px);
        }

        .copyright {
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 2rem;
            margin-top: 3rem;
            text-align: center;
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.9rem;
        }

        /* Animations */
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .hero-title {
                font-size: 2.8rem;
            }
            
            .discount-title {
                font-size: 2.2rem;
            }
            
            .discount-book {
                width: 160px;
            }
        }

        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
            
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-subtitle {
                font-size: 1rem;
            }
            
            .section-title h2 {
                font-size: 2rem;
            }
            
            .discount-title {
                font-size: 1.8rem;
            }
            
            .discount-books {
                margin-top: 3rem;
            }
            
            .discount-book {
                position: relative;
                margin-bottom: 1.5rem;
                width: 200px;
                transform: none !important;
                left: auto !important;
                right: auto !important;
            }
        }

        @media (max-width: 576px) {
            .hero-title {
                font-size: 1.8rem;
            }
            
            .navbar-brand {
                font-size: 1.1rem;
            }
            
            .nav-link {
                padding: 0.5rem;
                font-size: 0.9rem;
            }
            
            .book-img-container {
                height: 220px;
            }
        }
        
        .btn-details {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            flex: 1;
            text-align: center;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-details:hover {
            background-color: var(--secondary-color);
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(22, 96, 136, 0.3);
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="homepage.aspx">
                    <i class="fas fa-book-open"></i> The Reader's Gateway
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="homepage.aspx" CssClass="nav-link active">
                                <i class="fas fa-home"></i> Home
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkBooks" runat="server" NavigateUrl="books.aspx" CssClass="nav-link">
                                <i class="fas fa-book"></i> Books
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="Cart.aspx" CssClass="nav-link">
                                <i class="fas fa-shopping-cart"></i> Cart
                                <span id="cartCount" runat="server" class="badge bg-danger ms-1"></span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user"></i> Account
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <asp:HyperLink ID="lnkRatings" runat="server" NavigateUrl="appratings.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-star"></i> App Ratings
                                    </asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="lnkNewPublished" runat="server" NavigateUrl="NewPublished.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-book-medical"></i> New Releases
                                    </asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="lnkAccount" runat="server" NavigateUrl="youraccount.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-user-cog"></i> Your Account
                                    </asp:HyperLink>
                                </li>
                                
                              
                              
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="hero-section">
            <div class="container">
                <div class="hero-content">
                    <h1 class="hero-title">Discover Your Next Favorite Book</h1>
                    <p class="hero-subtitle">Explore our vast collection of books from all genres. Find your perfect read today with our personalized recommendations.</p>
                    <asp:Button ID="btnExplore" runat="server" CssClass="btn btn-primary hero-btn" Text="Explore New Collection" OnClick="btnExplore_Click" />
                </div>
            </div>
        </section>

        <!-- Featured Books Section -->
        <section class="py-5">
            <div class="container">
                <div class="section-title">
                    <h2>Featured Books</h2>
                </div>
                
                <div class="row">
                    <!-- Book 1 -->
                    <div class="col-md-4">
                        <div class="book-card">
                            <div class="book-img-container">
                                <asp:Image ID="imgFeatured1" runat="server" CssClass="book-img" ImageUrl="img/img-8.jpg" AlternateText="Featured Book 1" />
                                <span class="book-badge">Bestseller</span>
                            </div>
                            <div class="book-body">
                                <h3 class="book-title">Believe in Yourself</h3>
                                <p class="book-author">By Joseph Murphy</p>
                                <p class="book-price">₹299</p>
                                <div class="d-grid gap-2">
                                    <asp:Button ID="btnAddCart1" runat="server" CssClass="btn btn-success" Text="Add to Cart" />
                                    <asp:HyperLink ID="lnkDetails1" runat="server" NavigateUrl='<%# "viewdetails.aspx?bookid=" + 2 %>' CssClass="btn-details">View Details</asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Book 2 -->
                    <div class="col-md-4">
                        <div class="book-card">
                            <div class="book-img-container">
                                <asp:Image ID="imgFeatured2" runat="server" CssClass="book-img" ImageUrl="img/img-9.jpg" AlternateText="Featured Book 2" />
                                <span class="book-badge">New Release</span>
                            </div>
                            <div class="book-body">
                                <h3 class="book-title">Pouring Dreams</h3>
                                <p class="book-author">By John Doe</p>
                                <p class="book-price">₹349</p>
                                <div class="d-grid gap-2">
                                    <asp:Button ID="btnAddCart2" runat="server" CssClass="btn btn-success" Text="Add to Cart" />
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "viewdetails.aspx?bookid=" + 2 %>' CssClass="btn-details">View Details</asp:HyperLink>    </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Book 3 -->
                    <div class="col-md-4">
                        <div class="book-card">
                            <div class="book-img-container">
                                <asp:Image ID="imgFeatured3" runat="server" CssClass="book-img" ImageUrl="img/img-10.jpg" AlternateText="Featured Book 3" />
                                <span class="book-badge">Limited Offer</span>
                            </div>
                            <div class="book-body">
                                <h3 class="book-title">One Indian Girl</h3>
                                <p class="book-author">By Chetan Bhagat</p>
                                <p class="book-price">₹249 <small class="text-muted"><del>₹399</del></small></p>
                                <div class="d-grid gap-2">
                                    <asp:Button ID="btnAddCart3" runat="server" CssClass="btn btn-success" Text="Add to Cart" />
                                   <asp:HyperLink ID="lnkDetails3" runat="server" 
    NavigateUrl='<%# "viewdetails.aspx?bookid=" + 1 %>' 
    CssClass="btn-details">
    <i class="fas fa-info-circle"></i> Details
</asp:HyperLink>              </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="text-center mt-4">
                    <asp:HyperLink ID="lnkAllBooks" runat="server" NavigateUrl="books.aspx" CssClass="btn btn-primary btn-lg">
                        View All Books <i class="fas fa-arrow-right ms-2"></i>
                    </asp:HyperLink>
                </div>
            </div>
        </section>

        <!-- Discount Section -->
        <section class="discount-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="discount-content">
                            <h2 class="discount-title">Up To 50% Discount</h2>
                            <p class="discount-text">
                                Take advantage of our special discount offers. Buy books from your favorite authors 
                                and get amazing discounts. The more you buy, the more you save!
                            </p>
                            <asp:HyperLink ID="lnkDiscount" runat="server" NavigateUrl="discount.aspx" CssClass="btn btn-primary btn-lg">
                                Shop Now <i class="fas fa-arrow-right ms-2"></i>
                            </asp:HyperLink>
                        </div>
                    </div>
                    <div class="col-lg-6 d-none d-lg-block">
                        <div class="discount-books text-center position-relative" style="height: 300px;">
                            <asp:Image ID="imgDiscount1" runat="server" CssClass="discount-book discount-book-1" ImageUrl="img/img-5.jpg" AlternateText="Discounted Book 1" />
                            <asp:Image ID="imgDiscount2" runat="server" CssClass="discount-book discount-book-2" ImageUrl="img/img-6.jpg" AlternateText="Discounted Book 2" />
                            <asp:Image ID="imgDiscount3" runat="server" CssClass="discount-book discount-book-3" ImageUrl="img/img-7.jpg" AlternateText="Discounted Book 3" />
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Services Section -->
 

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <h3 class="footer-title">The Reader's Gateway</h3>
                        <p>Your one-stop destination for all your reading needs. We offer a wide selection of books across all genres.</p>
                       
                    </div>
                    <div class="col-lg-2 col-md-6 mb-4">
                        <div class="footer-links">
                            <h5>Quick Links</h5>
                            <ul>
                                <li><a href="homepage.aspx">Home</a></li>
                                <li><a href="books.aspx">Books</a></li>
                                <li><a href="new_books.aspx">New Releases</a></li>
                                <li><a href="discount.aspx">Discounts</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="col-lg-4 mb-4">
                        <div class="footer-links">
                            <h5>Contact Us</h5>
                         
                            <p><i class="fas fa-phone me-2"></i> +91 8098148017</p>
                           <p><i class="fas fa-phone me-2"></i> +91 8072065833</p>
                            <p><i class="fas fa-phone me-2"></i> +91 9360112863</p>
                            <p><i class="fas fa-phone me-2"></i> +91 9360273817</p>
                            <p><i class="fas fa-phone me-2"></i> +91 9789778971</p>
                            <p><i class="fas fa-phone me-2"></i> +91 8072037818</p>
                        </div>
                    </div>
                </div>
                <div class="copyright">
                    <p>&copy; 2025 The Reader's Gateway. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Custom JS -->
        <script>
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });

            // Animate books in discount section on scroll
            window.addEventListener('scroll', function () {
                const discountBooks = document.querySelectorAll('.discount-book');
                const scrollPosition = window.scrollY;

                discountBooks.forEach((book, index) => {
                    const delay = index * 0.1;
                    book.style.transform = `rotate(${(index - 1) * 15}deg) translateY(${-scrollPosition * 0.1}px)`;
                });
            });
        </script>
    </form>
</body>
</html>