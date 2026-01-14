<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="finalyearadmin.adminhome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard | The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet" />
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
            background-color: #f5f7ff;
            color: var(--dark-color);
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
        
        /* Admin Dashboard Styles */
        .admin-container {
            padding: 3rem 1rem;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .admin-heading {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }
        
        .admin-heading h1 {
            font-size: 2.5rem;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 1rem;
        }
        
        .admin-heading p {
            color: #6c757d;
            font-size: 1.1rem;
        }
        
        /* Dashboard Cards */
        .dashboard-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            height: 100%;
            text-align: center;
            border: none;
            margin-bottom: 1.5rem;
        }
        
        .dashboard-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .card-icon {
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
        }
        
        .card-title {
            font-weight: 600;
            margin-bottom: 1rem;
            color: var(--dark-color);
        }
        
        .card-text {
            color: #6c757d;
            margin-bottom: 1.5rem;
        }
        
        .btn-dashboard {
            border-radius: 8px;
            padding: 0.75rem 1.5rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-dashboard:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .navbar-brand {
                font-size: 1.8rem;
            }
            
            .admin-heading h1 {
                font-size: 2.2rem;
            }
        }
        
        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.5rem;
            }
            
            .admin-heading h1 {
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
            
            .admin-heading h1 {
                font-size: 1.5rem;
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

        <!-- Admin Dashboard -->
        <div class="admin-container">
            <div class="admin-heading">
                <h1><i class="fas fa-user-shield"></i> Administrator Dashboard</h1>
                <p>Manage all aspects of your bookstore from one place</p>
            </div>
            
            <div class="row g-4">
                <!-- User Management Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3 class="card-title">User Management</h3>
                        <p class="card-text">View, edit, and manage all user accounts and permissions</p>
                        <asp:Button ID="btnUserDetails" runat="server" Text="Manage Users" 
                            CssClass="btn btn-primary btn-dashboard" OnClick="btnUserDetails_Click" />
                    </div>
                </div>
                
                <!-- Book Management Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-book"></i>
                        </div>
                        <h3 class="card-title">Book Catalog</h3>
                        <p class="card-text">Manage your book inventory, categories, and listings</p>
                        <asp:Button ID="btnBookDetails" runat="server" Text="Manage Books" 
                            CssClass="btn btn-success btn-dashboard" OnClick="btnBookDetails_Click" />
                    </div>
                </div>
                
                <!-- Order Management Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <h3 class="card-title">Order Management</h3>
                        <p class="card-text">View and process all customer orders</p>
                        <asp:Button ID="btnOrders" runat="server" Text="Manage Orders" 
                            CssClass="btn btn-danger btn-dashboard" OnClick="btnOrders_Click" />
                    </div>
                </div>
                
                <!-- Delivery Management Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-truck"></i>
                        </div>
                        <h3 class="card-title">Delivery Tracking</h3>
                        <p class="card-text">Monitor and update delivery statuses</p>
                        <asp:Button ID="btnDeliveryDetails" runat="server" Text="Track Deliveries" 
                            CssClass="btn btn-warning btn-dashboard" OnClick="btnDeliveryDetails_Click" />
                    </div>
                </div>
                
                <!-- Payment Management Card -->
                <div class="col-md-6 col-lg-4">
                    <div class="dashboard-card">
                        <div class="card-icon">
                            <i class="fas fa-credit-card"></i>
                        </div>
                        <h3 class="card-title">Payment Records</h3>
                        <p class="card-text">View payment history and transactions</p>
                        <asp:Button ID="btnPayments" runat="server" Text="View Payments" 
                            CssClass="btn btn-info btn-dashboard" OnClick="btnPayments_Click" />
                    </div>
                </div>
                 <!-- Reports Card -->
 <div class="col-md-6 col-lg-4">
     <div class="dashboard-card">
         <div class="card-icon">
             <i class="fas fa-chart-line"></i>
         </div>
         <h3 class="card-title">Reports & Analytics</h3>
         <p class="card-text">Generate business reports and view analytics</p>
         <asp:Button ID="btnReports" runat="server" Text="View Reports" 
             CssClass="btn btn-secondary btn-dashboard" OnClick="btnReports_Click" />
     </div>
 </div>
                
            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>