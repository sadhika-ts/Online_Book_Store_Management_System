<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="youraccount.aspx.cs" Inherits="finalyearproject.youraccount" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Account | The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4bb543;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7ff;
            color: var(--dark-color);
        }
        
        header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }
        
        header::before {
            content: "";
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, rgba(255,255,255,0) 70%);
            transform: rotate(30deg);
        }
        
        .profile-section {
            background: white;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s ease;
        }
        
        .profile-section:hover {
            transform: translateY(-5px);
        }
        
        .profile-picture-container {
            position: relative;
            margin: -75px auto 20px;
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            background: linear-gradient(45deg, #f3f4f6, #e5e7eb);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .profile-picture {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        
        .profile-picture-container:hover .profile-picture {
            transform: scale(1.05);
        }
        
        .form-label {
            font-weight: 500;
            color: var(--dark-color);
            margin-bottom: 8px;
        }
        
        .form-control, .form-select {
            border-radius: 8px;
            padding: 12px 15px;
            border: 1px solid #e0e0e0;
            transition: all 0.3s ease;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.25);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            transform: translateY(-2px);
        }
        
        .badge {
            font-size: 1rem;
            padding: 8px 12px;
            border-radius: 50px;
            font-weight: 500;
        }
        
        .order-card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
            margin-bottom: 20px;
        }
        
        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        
        .order-card .card-header {
            background: linear-gradient(to right, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
        }
        
        .order-status {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }
        
        .status-delivered {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-pending {
            background-color: #fff3cd;
            color: #856404;
        }
        
        .status-cancelled {
            background-color: #f8d7da;
            color: #721c24;
        }
        
        .nav-tabs {
            border-bottom: 2px solid #e0e0e0;
        }
        
        .nav-tabs .nav-link {
            color: var(--dark-color);
            font-weight: 500;
            border: none;
            padding: 12px 20px;
            border-radius: 8px 8px 0 0;
        }
        
        .nav-tabs .nav-link.active {
            color: var(--primary-color);
            background-color: transparent;
            border-bottom: 3px solid var(--primary-color);
        }
        
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: all 0.3s ease;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }
        
        .stat-card i {
            font-size: 2rem;
            color: var(--primary-color);
            margin-bottom: 15px;
        }
        
        .stat-card h3 {
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .footer {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 30px 0;
            margin-top: 50px;
        }
        
        @media (max-width: 768px) {
            .profile-picture-container {
                width: 120px;
                height: 120px;
                margin: -60px auto 15px;
            }
            
            .display-4 {
                font-size: 2.2rem;
            }
        }
        
        /* Animation classes */
        .fade-in {
            animation: fadeIn 0.8s ease-in;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .pulse {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.03); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header class="py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 text-center text-md-start">
                        <h1 class="display-4 mb-0 animate__animated animate__fadeInDown">📚 The Reader's Gateway</h1>
                    </div>
                    <div class="col-md-6 text-center text-md-end mt-3 mt-md-0">
                        <asp:Button ID="btnBack" runat="server" Text="Back to Home" CssClass="btn btn-outline-light btn-sm" OnClick="btnBack_Click" />
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <div class="container py-5">
            <!-- Profile Section -->
            <div class="profile-section p-4 mb-5 fade-in">
                <div class="text-center">
                    <div class="profile-picture-container pulse">
                        <i class="fas fa-user fa-4x text-muted" id="defaultProfileIcon" runat="server"></i>
                        <asp:Image ID="imgProfile" runat="server" CssClass="profile-picture" Visible="false" />
                    </div>
                    <h2 class="mb-3"><asp:Label ID="lblUserName" runat="server" Text="User Name"></asp:Label></h2>
                    <p class="text-muted"><i class="fas fa-envelope me-2"></i><asp:Label ID="lblUserEmail" runat="server" Text="user@example.com"></asp:Label></p>
                </div>

                <!-- Navigation Tabs -->
                <ul class="nav nav-tabs mb-4" id="accountTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab">Profile</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="orders-tab" data-bs-toggle="tab" data-bs-target="#orders" type="button" role="tab">Orders</button>
                    </li>
                   
                </ul>

                <!-- Tab Content -->
                <div class="tab-content" id="accountTabsContent">
                    <!-- Profile Tab -->
                    <div class="tab-pane fade show active" id="profile" role="tabpanel">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="txtUsername" class="form-label"><i class="fas fa-user me-2"></i>Username</label>
                                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" required="true" OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtEmail" class="form-label"><i class="fas fa-envelope me-2"></i>Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="true"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <label for="txtPhone" class="form-label"><i class="fas fa-phone me-2"></i>Phone Number</label>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="txtPassword" class="form-label"><i class="fas fa-lock me-2"></i>Password</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="SingleLine" CssClass="form-control" />

                                        <button class="btn btn-outline-secondary" type="button" id="showPasswordBtn"><i class="fas fa-eye"></i></button>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="txtAddress" class="form-label"><i class="fas fa-map-marker-alt me-2"></i>Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                       
                    </div>

 <!-- Orders Tab -->
<div class="tab-pane fade" id="orders" role="tabpanel">
    <div class="table-wrapper">
        <h3 class="mb-3 text-center">Order Details</h3>
        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btn btn-light" OnClick="btnRefresh_Click" />
        <asp:Label ID="lblNoOrders" runat="server" Text="No orders found." CssClass="text-danger" Visible="false"></asp:Label>
        <asp:Repeater ID="rptOrders" runat="server">
            <HeaderTemplate>
                <div class="row text-center mb-3">
                    <div class="col-md"><strong>Book Image</strong></div>
                    <div class="col-md-2"><strong>Book Name</strong></div>
                    <div class="col-md-1"><strong>Quantity</strong></div>
                    <div class="col-md-3"><strong>Address</strong></div>
                    <div class="col-md-2"><strong>Order Date</strong>
                        <strong>Delivery Date</strong>
                    </div>

                    <div class="col-md-2"><strong>Status</strong></div>
                </div>
            </HeaderTemplate>
            <ItemTemplate>
                <div class="row text-center align-items-center mb-3">
                    <div class="col-md-2">
                       <img src='<%# Eval("BookImageUrl") %>' alt="Book Cover" style="width: 80px; height: auto;" />

                    </div>
                    <div class="col-md-2">
                        <%# Eval("BookName") %>
                    </div>
                    <div class="col-md-1">
                        <%# Eval("Quantity") %>
                    </div>
                    <div class="col-md-3">
                        <%# Eval("AddressDetails") %>
                    </div>
                    <div class="col-md-2">
                        <%# Eval("OrderDate", "{0:dd-MM-yyyy}") %>
                           <%# Eval("DeliveryDate", "{0:dd-MM-yyyy}") %>
                    </div>
                    
                   <div class="col-md-2">
    <asp:Button 
        ID="btnStatus" 
        runat="server" 
        Text='<%# Eval("OrderStatus") %>' 
        CommandName="UpdateStatus" 
        CommandArgument='<%# Eval("OrderID") %>' 
        CssClass='<%# GetStatusButtonClass(Eval("OrderStatus").ToString()) %>' 
        OnCommand="btnStatus_Command" />
</div>

                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
</div>
                    <!-- Settings Tab -->
                   
                </div>
            </div>
       

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start">
                        <h5>The Reader's Gateway</h5>
                        <p>Your portal to endless reading adventures</p>
                    </div>
                  
                </div>
                <div class="text-center mt-3">
                    <p class="mb-0">&copy; 2023 The Reader's Gateway. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script>
        // Toggle password visibility
        document.getElementById('showPasswordBtn').addEventListener('click', function() {
            const passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            const icon = this.querySelector('i');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });
        
        // Add animation when scrolling
        document.addEventListener('DOMContentLoaded', function() {
            const animateElements = document.querySelectorAll('.fade-in');
            
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animate__animated', 'animate__fadeInUp');
                        observer.unobserve(entry.target);
                    }
                });
            }, {
                threshold: 0.1
            });
            
            animateElements.forEach(element => {
                observer.observe(element);
            });
        });
    </script>
</body>
</html>