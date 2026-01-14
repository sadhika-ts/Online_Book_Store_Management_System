<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="finalyearadmin.BookDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Management | The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700&family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --dark-color: #343a40;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --warning-color: #ffc107;
            --danger-color: #dc3545;
            --info-color: #17a2b8;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7));
            background-size: cover;
            background-attachment: fixed;
            background-position: center;
            color: white;
            min-height: 100vh;
        }
        
        .display-font {
            font-family: 'Playfair Display', serif;
        }
        
        /* Navbar Styles */
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1.5rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .navbar::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            transform: rotate(30deg);
            z-index: -1;
        }
        
        .navbar-brand {
            font-size: 2rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        /* Main Content */
        .main-container {
            padding: 3rem 1rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .page-header {
            text-align: center;
            margin-bottom: 3rem;
        }
        
        .page-header h1 {
            font-size: 2.5rem;
            font-weight: 600;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 1rem;
        }
        
        .page-header p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1rem;
        }
        
        /* Dashboard Cards */
        .dashboard-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            height: 100%;
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
            margin-bottom: 1.5rem;
        }
        
        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
            background: rgba(255, 255, 255, 0.15);
        }
        
        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: white;
        }
        
        .card-title {
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .btn-dashboard {
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
        }
        
        .btn-dashboard:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .navbar-brand {
                font-size: 1.8rem;
            }
            
            .page-header h1 {
                font-size: 2.2rem;
            }
        }
        
        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.5rem;
            }
            
            .page-header h1 {
                font-size: 1.8rem;
            }
            
            .dashboard-card {
                padding: 1.5rem;
            }
        }
        
        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.3rem;
            }
            
            .page-header h1 {
                font-size: 1.5rem;
            }
            
            .btn-dashboard {
                padding: 0.5rem 1rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <i class="fas fa-book-open"></i> The Reader's Gateway
                </a>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="main-container">
            <div class="page-header">
                <h1><i class="fas fa-book"></i> Book Management</h1>
                <p>Manage all aspects of your book collection</p>
            </div>
            
            <div class="row g-4">
                <!-- Add New Arrivals -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-book-medical"></i>
                        </div>
                        <h3 class="card-title">New Arrivals</h3>
                        <p>Add the latest books to your collection</p>
                        <asp:Button ID="btnAddNewArrivals" runat="server" Text="Add New Arrivals" 
                            CssClass="btn btn-primary btn-dashboard" OnClick="btnAddNewArrivals_Click" />
                    </div>
                </div>
                
                <!-- Add Discounts -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-tag"></i>
                        </div>
                        <h3 class="card-title">Discounts</h3>
                        <p>Create special offers and promotions</p>
                        <asp:Button ID="btnAddDiscounts" runat="server" Text="Add Discounts" 
                            CssClass="btn btn-success btn-dashboard" OnClick="btnAddDiscounts_Click" />
                    </div>
                </div>
                
                <!-- Add Books -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-plus-circle"></i>
                        </div>
                        <h3 class="card-title">Add Books</h3>
                        <p>Expand your library collection</p>
                        <asp:Button ID="btnAddBooks" runat="server" Text="Add Books" 
                            CssClass="btn btn-danger btn-dashboard" OnClick="btnAddBooks_Click" />
                    </div>
                </div>
                
                <!-- User Added Books -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-user-edit"></i>
                        </div>
                        <h3 class="card-title">User Contributions</h3>
                        <p>Manage books added by users</p>
                        <asp:Button ID="btnUserAddedBooks" runat="server" Text="User Added Books" 
                            CssClass="btn btn-warning btn-dashboard" OnClick="btnUserAddedBooks_Click" />
                    </div>
                </div>
                
                <!-- Remove Books -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-trash-alt"></i>
                        </div>
                        <h3 class="card-title">Remove Books</h3>
                        <p>Manage your book inventory</p>
                        <asp:Button ID="btnRemoveBooks" runat="server" Text="Remove Books" 
                            CssClass="btn btn-info btn-dashboard" OnClick="btnRemoveBooks_Click" />
                    </div>
                </div>
                
                <!-- Stocks -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-boxes"></i>
                        </div>
                        <h3 class="card-title">Inventory</h3>
                        <p>View and manage book stock levels</p>
                        <asp:Button ID="btnStocks" runat="server" Text="View Inventory" 
                            CssClass="btn btn-secondary btn-dashboard" OnClick="btnStocks_Click" />
                    </div>
                </div>
            </div>
            
            <!-- Back Button -->
            <div class="text-center mt-5">
                <asp:Button ID="btnLeave" runat="server" Text="Go Back" 
                    CssClass="btn btn-light px-4" OnClick="btnleave_Click" />
            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>