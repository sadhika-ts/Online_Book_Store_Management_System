<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="discount.aspx.cs" Inherits="finalyearproject.discount" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>% Discounts % | The Reader's Gateway</title>

        <!--=============== REMIXICONS ===============-->
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css">
    
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
            --danger-color: #dc3545;
            --discount-color: #ff6b6b;
        }

        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            color: #333;
            line-height: 1.6;
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

        /* Main Content */
        .main-content {
            padding: 3rem 0;
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .page-header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 2.8rem;
            font-weight: 700;
            color: var(--dark-color);
            position: relative;
            display: inline-block;
        }

        .page-header h1:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 5px;
            background: var(--discount-color);
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

        /* Discount Badge */
        .discount-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background-color: var(--discount-color);
            color: white;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            font-weight: 700;
            border-radius: 5px;
            box-shadow: 0 3px 10px rgba(255, 107, 107, 0.3);
            z-index: 2;
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
        }

        .book-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }

        .book-image-container {
            height: 250px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f1f3f5;
            position: relative;
        }

        .book-image {
            max-height: 100%;
            max-width: 100%;
            object-fit: contain;
            transition: transform 0.5s ease;
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

        .original-price {
            font-size: 1rem;
            color: #6c757d;
            text-decoration: line-through;
            margin-right: 0.5rem;
        }

        .final-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--success-color);
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
     transform: translateY(-2px);
 }

        .discount-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            background: #fff8f8;
            padding: 0.5rem;
            border-radius: 5px;
        }

        .discount-percentage {
            color: var(--discount-color);
            font-weight: 700;
        }

        .discount-amount {
            color: var(--dark-color);
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

        .btn-add-to-cart {
            width: 100%;
            padding: 0.8rem;
            background-color: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-add-to-cart:hover {
            background-color: var(--secondary-color);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(74, 111, 165, 0.3);
        }

        .cart-icon {
            margin-right: 8px;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .page-header h1 {
                font-size: 2.4rem;
            }
            
            .book-grid {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
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
        }
        
        .btn-cart {
            background-color: var(--success-color);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.3s ease;
            flex: 1;
        }

        .btn-cart:hover {
            background-color: #218838;
            transform: translateY(-2px);
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
            <div class="container">
                <div class="page-header">
                    <h1>Limited Time Discounts</h1>
                    <p>Don't miss these amazing deals on your favorite books. Limited stock available at these special prices!</p>
                </div>

                <div class="book-grid">
                    <asp:Repeater ID="rptBooks" runat="server" OnItemCommand="rptBooks_ItemCommand">
                        <ItemTemplate>
                            <div class="book-card">
                                <div class="discount-badge">
                                    Save <%# Eval("discountpercentage") %>%
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
                                    
                                    <p class="book-description"><%# Eval("bookdescription") %></p>
                                    
                                    <div class="discount-info">
                                        <span class="discount-percentage"><i class="fas fa-tag"></i> <%# Eval("discountpercentage") %>% OFF</span>
                                        <span class="discount-amount">Save ₹<%# Eval("discountamount") %></span>
                                    </div>
                                    
                                    <div class="price-container">
                                        <span class="original-price">₹<%# Eval("originalprice") %></span>
                                        <span class="final-price">₹<%# Eval("cost") %></span>
                                    </div>
                                    
                                    <p class="stocks-info"><i class="fas fa-box-open"></i> <span><%# Eval("stocks") %></span> copies available</p>
                                    <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                    <asp:HyperLink ID="lnkViewDetails" runat="server" 
    NavigateUrl='<%# "viewdetails.aspx?bookid=" + Eval("bookid") %>' 
    CssClass="btn-details">
    <i class="fas fa-info-circle"></i> Details
</asp:HyperLink>
                                    <asp:Button ID="btnAddToCart" runat="server" CssClass="btn-cart" 
                                        Text='Add to Cart' 
                                        CommandName="AddToCart" 
                                        CommandArgument='<%# Eval("bookid") %>' />
                                </div>
                            </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </main>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Custom JS -->
        <script>
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });
        </script>
    </form>
</body>
</html>