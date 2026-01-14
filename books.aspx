<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="books.aspx.cs" Inherits="finalyearproject.books" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📚 The Reader's Gateway</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4a6fa5;
            --secondary-color: #166088;
            --accent-color: #4fc3f7;
            --dark-color: #2d3142;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --warning-color: #ffc107;
        }

        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--dark-color);
            line-height: 1.6;
        }

        /* Navbar Styles */
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1rem;
        }

        .navbar-brand {
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

        /* Main Container */
        .main-container {
            padding: 2rem 0;
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .page-header h1 {
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .page-header h1:after {
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

        .page-header p {
            color: #6c757d;
            font-size: 1.1rem;
            max-width: 700px;
            margin: 0 auto;
        }

        /* Book Grid */
        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
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
            border: none;
        }

        .book-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.12);
        }

        .book-image-container {
            height: 220px;
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

        .book-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: var(--warning-color);
            color: var(--dark-color);
            padding: 0.25rem 0.5rem;
            border-radius: 4px;
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

        .book-actions {
            display: flex;
            justify-content: space-between;
            gap: 0.75rem;
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

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
            
            .nav-link {
                padding: 0.5rem;
                font-size: 0.9rem;
            }
            
            .book-grid {
                grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            }
            
            .book-image-container {
                height: 180px;
            }
        }

        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.1rem;
            }
            
            .page-header h1 {
                font-size: 1.8rem;
            }
            
            .book-grid {
                grid-template-columns: 1fr;
            }
            
            .book-actions {
                flex-direction: column;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
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
                            <asp:HyperLink ID="lnkBooks" runat="server" NavigateUrl="books.aspx" CssClass="nav-link active">
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
                                    <asp:HyperLink ID="lnkratings" runat="server" NavigateUrl="appratings.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-star"></i> App Ratings
                                    </asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="lnknewPublished" runat="server" NavigateUrl="NewPublished.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-book-medical"></i> New Releases
                                    </asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="lnkaccount" runat="server" NavigateUrl="youraccount.aspx" CssClass="dropdown-item">
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
        <main class="main-container">
            <div class="container">
                <div class="page-header">
                    <h1>Discover Your Next Favorite Book</h1>
                    <p>Browse our extensive collection of books across all genres. Find your perfect read today!</p>
                </div>

                <!-- Search and Filter Section -->
                <div class="row mb-4">
                    <div class="col-md-6 mb-3 mb-md-0">
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="fas fa-search"></i></span>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search by title, author, or genre" OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-text bg-white"><i class="fas fa-filter"></i></span>
                             <asp:DropDownList ID="ddlGenre" runat="server" CssClass="form-select"  AutoPostBack="true">
                              <asp:ListItem Value="">select genre</asp:ListItem>
                         <asp:ListItem Value="Fantacy">Fantacy</asp:ListItem>
                        <asp:ListItem Value="food">food</asp:ListItem>
                          <asp:ListItem Value="Horror">Horror</asp:ListItem>
                          <asp:ListItem Value="Imaginary">Imaginary</asp:ListItem>
                          <asp:ListItem Value="Biography">Biography</asp:ListItem>                  
                           <asp:ListItem Value="Kids">Kids</asp:ListItem>                  
             <asp:ListItem Value="Motivation">Motivation</asp:ListItem>                  
                 <asp:ListItem Value="Travel">Travel</asp:ListItem>
 </asp:DropDownList>
                            <asp:Button ID="btnFilter" runat="server" Text="Filter" CssClass="btn btn-outline-secondary" OnClick="btnFilter_Click" />
                        </div>
                    </div>
                </div>

               <!-- Books Grid -->
<div class="book-grid">
    <asp:Repeater ID="rptBooks" runat="server" OnItemCommand="rptBooks_ItemCommand">
        <ItemTemplate>
    <div class="book-card">
        <div class="book-image-container">
            <asp:Image ID="imgBook" runat="server" CssClass="book-image" 
                ImageUrl='<%# Eval("bookphoto") is byte[] ? "data:image/jpeg;base64," + Convert.ToBase64String((byte[])Eval("bookphoto")) : Eval("bookphoto") %>' 
                AlternateText='<%# Eval("bookname") %>' />
        </div>
        <div class="book-body">
            <div class="book-title"><%# Eval("bookname") %></div>
            <div class="book-author">by <%# Eval("authorname") %></div>
            <div class="book-price">₹<%# Eval("cost") %></div>
            <div class="book-actions">
                <asp:HyperLink ID="lnkViewDetails" runat="server" 
    NavigateUrl='<%# "viewdetails.aspx?bookid=" + Eval("bookid") %>' 
    CssClass="btn-details">
    <i class="fas fa-info-circle"></i> Details
</asp:HyperLink>
                <asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="btn-cart" CommandName="AddToCart" CommandArgument='<%# Eval("bookid") %>'>
                    <i class="fas fa-cart-plus"></i> Add to Cart
                </asp:LinkButton>
            </div>
        </div>
    </div>
</ItemTemplate>

    </asp:Repeater>
</div>


                <!-- Pagination -->
                <nav aria-label="Page navigation" class="mt-5">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </main>

        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-4 mb-md-0">
                        <h5>About Us</h5>
                        <p>The Reader's Gateway is your one-stop destination for all your reading needs. We offer a wide selection of books across all genres.</p>
                    </div>
                    <div class="col-md-4 mb-4 mb-md-0">
                        <h5>Quick Links</h5>
                        <ul class="list-unstyled">
                             
     <li><a href="homepage.aspx">Home</a></li>
     <li><a href="books.aspx">Books</a></li>
     <li><a href="new_books.aspx">New Releases</a></li>
     <li><a href="discount.aspx">Discounts</a></li>

                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Connect With Us</h5>
                        <div class="social-links">
                           
                        </div>
                       
                         <p><i class="fas fa-phone me-2"></i> +91 8098148017</p>
<p><i class="fas fa-phone me-2"></i> +91 8072065833</p>
 <p><i class="fas fa-phone me-2"></i> +91 9360112863</p>
 <p><i class="fas fa-phone me-2"></i> +91 9360273817</p>
 <p><i class="fas fa-phone me-2"></i> +91 9789778971</p>
 <p><i class="fas fa-phone me-2"></i> +91 8072037818</p>
                    </div>
                </div>
                <hr class="my-4 bg-light">
                <div class="text-center">
                    <p class="mb-0">&copy; 2025 The Reader's Gateway. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    document.querySelector(this.getAttribute('href')).scrollIntoView({
                        behavior: 'smooth'
                    });
                });
            });
        </script>
    </form>
</body>
</html>