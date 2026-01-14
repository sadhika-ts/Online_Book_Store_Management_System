<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewdetails.aspx.cs" Inherits="finalyearproject.viewdetails" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📚 The Reader's Gateway - Book Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #5e72e4;
            --secondary-color: #f7fafc;
            --accent-color: #ff6b6b;
            --dark-color: #2d3748;
            --light-color: #f8f9fa;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f7fa;
            color: var(--dark-color);
            line-height: 1.6;
        }
        
        h1, h2, h3, h4 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
        }
        
        .book-header {
            background: linear-gradient(135deg, var(--primary-color) 0%, #825ee4 100%);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-radius: 0 0 20px 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .book-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        
        .book-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
        }
        
        .book-cover {
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            max-height: 400px;
            object-fit: contain;
        }
        
        .book-cover:hover {
            transform: scale(1.03);
        }
        
        .book-meta {
            margin-bottom: 1rem;
        }
        
        .book-meta i {
            color: var(--primary-color);
            width: 24px;
            text-align: center;
            margin-right: 8px;
        }
        
        .price-tag {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--accent-color);
            margin: 1rem 0;
        }
        
        .btn-custom {
            padding: 0.6rem 1.5rem;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            margin-right: 10px;
            margin-bottom: 10px;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .btn-primary:hover {
            background-color: #4a5acf;
            border-color: #4a5acf;
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background-color: var(--dark-color);
            border-color: var(--dark-color);
        }
        
        .btn-secondary:hover {
            background-color: #1a202c;
            border-color: #1a202c;
            transform: translateY(-2px);
        }
        
        .description-box {
            background-color: var(--secondary-color);
            padding: 1.5rem;
            border-radius: 10px;
            border-left: 4px solid var(--primary-color);
        }
        
        .stock-status {
            display: inline-block;
            padding: 0.3rem 0.8rem;
            border-radius: 50px;
            font-weight: 500;
            font-size: 0.9rem;
        }
        
        .in-stock {
            background-color: #e6fffa;
            color: #38b2ac;
        }
        
        .low-stock {
            background-color: #fffaf0;
            color: #dd6b20;
        }
        
        .out-of-stock {
            background-color: #fff5f5;
            color: #f56565;
        }
        
        .rating {
            color: #f6e05e;
            margin-bottom: 1rem;
        }
        
        @media (max-width: 768px) {
            .book-header {
                padding: 1.5rem 0;
            }
            
            .book-cover {
                margin-bottom: 1.5rem;
            }
            
            .price-tag {
                font-size: 1.5rem;
            }
        }
        
        .pulse {
            animation: pulse 1.5s infinite;
        }
        
        @keyframes pulse {
            0% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
            100% {
                transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="book-header text-center">
            <div class="container">
                <h1><i class="fas fa-book-open me-2"></i> The Reader's Gateway</h1>
                <p class="lead">Discover your next favorite book</p>
            </div>
        </div>
        
        <div class="container mb-5">
            <asp:Label ID="lblMessage" runat="server" CssClass="alert alert-danger d-block" Visible="false" />
            
            <div class="book-card p-4">
                <div class="row">
                    <div class="col-lg-4 text-center">
                        <asp:Image ID="imgBook" runat="server" CssClass="book-cover img-fluid mb-3" />
                        <div class="price-tag">
                            <asp:Label ID="lblPrice" runat="server" />
                        </div>
                        <div class="mb-3">
                            <span id="stockBadge" runat="server" class="stock-status">
                                <asp:Label ID="lblStocks" runat="server" />
                            </span>
                        </div>
                        <div class="d-flex flex-wrap justify-content-center">
                            <asp:Button ID="btnReturn" runat="server" Text=" Back to Home" 
                                CssClass="btn btn-secondary btn-custom" OnClick="btnReturn_Click" />
                            
        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btn btn-secondary btn-custom" OnClick="btnRefresh_Click" />
                        </div>
                    </div>
                    
                    <div class="col-lg-8">
                        <h2 class="mb-3"><asp:Label ID="lblBookName" runat="server" /></h2>
                        
                        <div class="rating mb-3">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span class="text-muted ms-2">(24 reviews)</span>
                        </div>
                        
                        <div class="book-meta">
                            <p><i class="fas fa-user-edit"></i> <strong>Author:</strong> <asp:Label ID="lblAuthorName" runat="server" /></p>
                            <p><i class="fas fa-building"></i> <strong>Publisher:</strong> <asp:Label ID="lblPublisherName" runat="server" /></p>
                            <p><i class="fas fa-calendar-alt"></i> <strong>Published Date:</strong> <asp:Label ID="lblPublishDate" runat="server" /></p>
                           
                        </div>
                        
                        <div class="description-box mb-4">
                            <h5 class="mb-3"><i class="fas fa-align-left text-primary me-2"></i>Description</h5>
                            <asp:Label ID="lblDescription" runat="server" />
                        </div>
                        
                        <div class="d-flex flex-wrap d-lg-none">
                            <asp:Button ID="btnReturnMobile" runat="server" Text="Back" 
                                CssClass="btn btn-secondary btn-custom" OnClick="btnReturn_Click" />
                            
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Additional Book Info Section -->
          
                
          
        </div>
    </form>

    <!-- Bootstrap & Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    
    <script>
        // Dynamic stock status styling
        document.addEventListener('DOMContentLoaded', function() {
            const stockText = document.getElementById('<%= lblStocks.ClientID %>').textContent;
            const stockBadge = document.getElementById('stockBadge');
            
            if (stockText) {
                const stockCount = parseInt(stockText.replace(/\D/g, ''));
                
                if (stockCount > 10) {
                    stockBadge.classList.add('in-stock');
                    stockBadge.innerHTML = '<i class="fas fa-check-circle me-1"></i> In Stock (' + stockCount + ' available)';
                } else if (stockCount > 0) {
                    stockBadge.classList.add('low-stock');
                    stockBadge.innerHTML = '<i class="fas fa-exclamation-circle me-1"></i> Low Stock (Only ' + stockCount + ' left)';
                } else {
                    stockBadge.classList.add('out-of-stock');
                    stockBadge.innerHTML = '<i class="fas fa-times-circle me-1"></i> Out of Stock';
                    
                }
            }
        });
    </script>
</body>
</html>