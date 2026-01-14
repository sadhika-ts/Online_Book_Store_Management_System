<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="new_books.aspx.cs" Inherits="finalyearproject.new_books" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🌟 New Arrivals | The Reader's Gateway</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&family=Playfair+Display:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <style>
        :root {
            --primary-color: #4a6fa5;
            --secondary-color: #166088;
            --accent-color: #4fc3f7;
            --dark-color: #2d3142;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
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
            transition: all 0.3s ease;
        }

        .navbar-brand:hover {
            transform: scale(1.05);
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
            position: relative;
        }

        .nav-link:hover, .nav-link.active {
            color: white !important;
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }

        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: white;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            transition: width 0.3s ease;
        }

        .nav-link:hover::after {
            width: 70%;
        }

        .nav-link i {
            margin-right: 5px;
        }

        /* Main Content */
        .main-content {
            padding: 3rem 0;
            position: relative;
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .page-header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 2.8rem;
            font-weight: 700;
            color: var(--dark-color);
            position: relative;
            display: inline-block;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text; /* Correct */
            background-clip: text;
             -webkit-text-fill-color: transparent;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        .page-header h1:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 5px;
            background: var(--warning-color);
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 3px;
        }

        .page-header p {
            font-size: 1.2rem;
            color: #6c757d;
            max-width: 700px;
            margin: 1.5rem auto 0;
        }

        /* Floating Books Decoration */
        .floating-books {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            pointer-events: none;
            z-index: -1;
            overflow: hidden;
        }

        .floating-book {
            position: absolute;
            opacity: 0.1;
            font-size: 2rem;
            color: var(--primary-color);
            animation: float 15s infinite linear;
        }

        @keyframes float {
            0% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-50px) rotate(180deg);
            }
            100% {
                transform: translateY(0) rotate(360deg);
            }
        }

        /* New Arrival Badge */
        .new-badge {
            position: absolute;
            top: 15px;
            left: 15px;
            background-color: var(--warning-color);
            color: var(--dark-color);
            padding: 0.5rem 1rem;
            font-size: 1rem;
            font-weight: 700;
            border-radius: 5px;
            box-shadow: 0 3px 10px rgba(255, 193, 7, 0.3);
            z-index: 2;
            transform: rotate(-15deg);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: rotate(-15deg) scale(1); }
            50% { transform: rotate(-15deg) scale(1.1); }
            100% { transform: rotate(-15deg) scale(1); }
        }

        /* Book Cards */
        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            padding: 1rem;
        }

        .book-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            position: relative;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .book-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }

        .book-image-container {
            height: 280px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #f1f3f5, #e9ecef);
            position: relative;
        }

        .book-image {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
            transition: transform 0.5s ease;
            padding: 20px;
        }

        .book-card:hover .book-image {
            transform: scale(1.05);
        }

        .book-body {
            padding: 1.5rem;
        }

        .book-title {
            font-weight: 700;
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
            height: 3.2em;
            transition: color 0.3s ease;
        }

        .book-card:hover .book-title {
            color: var(--primary-color);
        }

        .book-meta {
            color: #6c757d;
            font-size: 0.95rem;
            margin-bottom: 0.5rem;
        }

        .book-meta i {
            margin-right: 5px;
            color: var(--primary-color);
        }

        .book-description {
            font-size: 0.95rem;
            color: #666;
            margin: 1rem 0;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
            height: 4.5em;
        }

        .price-container {
            display: flex;
            align-items: center;
            margin: 1rem 0;
        }

        .book-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--success-color);
        }

        .original-price {
            text-decoration: line-through;
            color: #6c757d;
            margin-left: 10px;
            font-size: 1rem;
        }

        .discount-badge {
            background-color: var(--danger-color);
            color: white;
            padding: 0.2rem 0.5rem;
            border-radius: 4px;
            font-size: 0.8rem;
            margin-left: 10px;
            font-weight: 600;
        }

        .stocks-info {
            font-size: 0.9rem;
            color: #6c757d;
            margin-bottom: 1rem;
        }

        .stocks-info span {
            color: var(--success-color);
            font-weight: 600;
        }

        .book-actions {
            display: flex;
            gap: 10px;
        }

        .btn-add-to-cart {
            background-color: var(--success-color);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-add-to-cart i {
            margin-right: 8px;
        }

        .btn-add-to-cart:hover {
            background-color: #218838;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(40, 167, 69, 0.3);
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

        /* Rating Stars */
        .rating-stars {
            color: var(--warning-color);
            margin: 0.5rem 0;
            font-size: 0.9rem;
        }

        .rating-count {
            color: #6c757d;
            font-size: 0.8rem;
            margin-left: 5px;
        }

        /* Floating Action Button */
        .floating-action-btn {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            z-index: 100;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .floating-action-btn:hover {
            transform: translateY(-5px) scale(1.1);
            box-shadow: 0 6px 25px rgba(0,0,0,0.3);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 3rem;
            grid-column: 1 / -1;
        }

        .empty-state i {
            font-size: 5rem;
            color: #ddd;
            margin-bottom: 1rem;
        }

        .empty-state h3 {
            color: #6c757d;
            margin-bottom: 1rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 1200px) {
            .book-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            }
        }

        @media (max-width: 992px) {
            .page-header h1 {
                font-size: 2.4rem;
            }
            
            .book-image-container {
                height: 250px;
            }
        }

        @media (max-width: 768px) {
            .page-header h1 {
                font-size: 2rem;
            }
            
            .navbar-brand {
                font-size: 1.2rem;
            }
            
            .book-image-container {
                height: 220px;
            }
            
            .book-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
        }

        @media (max-width: 576px) {
            .page-header h1 {
                font-size: 1.8rem;
            }
            
            .navbar-brand {
                font-size: 1.1rem;
            }
            
            .nav-link {
                padding: 0.5rem;
                font-size: 0.9rem;
            }
            
            .book-grid {
                grid-template-columns: 1fr;
            }
            
            .book-actions {
                flex-direction: column;
            }
            
            .floating-action-btn {
                width: 50px;
                height: 50px;
                font-size: 1.2rem;
                bottom: 20px;
                right: 20px;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .book-card {
            animation: fadeIn 0.5s ease forwards;
            opacity: 0;
        }

        .book-card:nth-child(1) { animation-delay: 0.1s; }
        .book-card:nth-child(2) { animation-delay: 0.2s; }
        .book-card:nth-child(3) { animation-delay: 0.3s; }
        .book-card:nth-child(4) { animation-delay: 0.4s; }
        .book-card:nth-child(5) { animation-delay: 0.5s; }
        .book-card:nth-child(6) { animation-delay: 0.6s; }
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
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="homepage.aspx" CssClass="nav-link">
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
                                        <i class="fas fa-book-medical"></i> User Added Books
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

        <!-- Main Content -->
        <main class="main-content">
            <!-- Floating Books Background -->
            <div class="floating-books">
                <i class="fas fa-book floating-book" style="top: 10%; left: 5%; animation-delay: 0s;"></i>
                <i class="fas fa-book floating-book" style="top: 30%; left: 80%; animation-delay: 2s;"></i>
                <i class="fas fa-book floating-book" style="top: 70%; left: 10%; animation-delay: 4s;"></i>
                <i class="fas fa-book floating-book" style="top: 20%; left: 50%; animation-delay: 1s;"></i>
                <i class="fas fa-book floating-book" style="top: 80%; left: 70%; animation-delay: 3s;"></i>
            </div>
            
            <div class="container">
                <div class="page-header animate__animated animate__fadeIn">
                    <h1>New Arrivals 🌟</h1>
                    <p>Discover our latest collection of books fresh off the press!</p>
                </div>

                <div class="book-grid">
                    <asp:Repeater ID="rptBooks" runat="server" OnItemCommand="rptBooks_ItemCommand">
                        <ItemTemplate>
                            <div class="book-card">
                                <div class="new-badge">
                                    NEW
                                </div>
                                <div class="book-image-container">
                                    <asp:Image ID="imgBook" runat="server" CssClass="book-image" 
                                        ImageUrl='<%# "data:image/jpeg;base64," + Convert.ToBase64String((byte[])Eval("bookphoto")) %>' 
                                        AlternateText='<%# Eval("bookname") %>' />
                                </div>
                                <div class="book-body">
                                    <h3 class="book-title"><%# Eval("bookname") %></h3>
                                    <p class="book-meta"><i class="fas fa-user-edit"></i> <%# Eval("authorname") %></p>
                                    <p class="book-meta"><i class="fas fa-building"></i> <%# Eval("publishername") %></p>
                                    <p class="book-meta"><i class="fas fa-calendar-alt"></i> <%# Eval("publishdate", "{0:dd/MM/yyyy}") %></p>
                                    
                                  
                                    
                                    
                                    
                                    <p class="stocks-info"><i class="fas fa-box-open"></i> <span><%# Eval("stocks") %></span> copies available</p>
                                    
                                    <div class="book-actions">
                                        <asp:Button ID="btnAddToCart" runat="server" CssClass="btn-add-to-cart" 
                                            Text="Add to Cart" CommandName="AddToCart" 
                                            CommandArgument='<%# Eval("bookid") %>' />
                                        <asp:HyperLink ID="lnkViewDetails" runat="server" 
                                            NavigateUrl='<%# "viewdetails.aspx?bookid=" + Eval("bookid") %>' 
                                            CssClass="btn-details">
                                            <i class="fas fa-info-circle"></i> Details
                                        </asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <!-- Empty State -->
                    <asp:Panel ID="pnlEmptyState" runat="server" Visible="false" CssClass="empty-state">
                        <i class="fas fa-book-open"></i>
                        <h3>No New Arrivals Yet</h3>
                        <p>Check back soon for our latest collection of books!</p>
                        <asp:HyperLink ID="lnkBrowseBooks" runat="server" NavigateUrl="books.aspx" CssClass="btn btn-primary">
                            Browse All Books
                        </asp:HyperLink>
                    </asp:Panel>
                </div>
            </div>
        </main>

        <!-- Floating Action Button -->
        <div class="floating-action-btn" data-bs-toggle="tooltip" data-bs-placement="left" title="Quick Cart">
            <i class="fas fa-shopping-cart"></i>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Custom JS -->
        <script>
            // Initialize tooltips
            document.addEventListener('DOMContentLoaded', function () {
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
                var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                    return new bootstrap.Tooltip(tooltipTriggerEl);
                });

                // Add floating books dynamically
                var floatingBooks = document.querySelector('.floating-books');
                for (var i = 0; i < 8; i++) {
                    var book = document.createElement('i');
                    book.className = 'fas fa-book floating-book';
                    book.style.top = Math.random() * 90 + '%';
                    book.style.left = Math.random() * 90 + '%';
                    book.style.animationDelay = Math.random() * 5 + 's';
                    book.style.animationDuration = 10 + Math.random() * 10 + 's';
                    floatingBooks.appendChild(book);
                }

                // Floating action button click handler
                document.querySelector('.floating-action-btn').addEventListener('click', function () {
                    window.location.href = 'Cart.aspx';
                });
            });
        </script>
    </form>
</body>
</html>