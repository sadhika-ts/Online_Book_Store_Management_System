<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RemoveBooks.aspx.cs" Inherits="finalyearadmin.RemoveBooks" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Remove Books - The Reader's Gateway</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    
    <style>
        :root {
            --primary-color: #e74a3b;
            --secondary-color: #f6c23e;
            --accent-color: #5a5c69;
            --light-color: #f8f9fc;
            --dark-color: #2d3436;
        }
        
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f8f9fc;
            background-image: linear-gradient(rgba(255,255,255,0.95), rgba(255,255,255,0.95)), 
                            url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
        }

        .header {
            background: linear-gradient(135deg, var(--primary-color), #c03427);
            color: white;
            text-align: center;
            padding: 3rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://images.unsplash.com/photo-1535905557558-afc4877a26fc?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            opacity: 0.1;
            z-index: 0;
        }

        .header-content {
            position: relative;
            z-index: 1;
        }

        .header h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .header h2 {
            font-weight: 500;
            font-size: 1.25rem;
        }

        .dashboard-card {
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            margin-bottom: 2rem;
            background-color: white;
            transition: all 0.3s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 0.5rem 1.5rem rgba(58, 59, 69, 0.2);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary-color), #c03427);
            color: white;
            font-weight: 700;
            font-family: 'Playfair Display', serif;
            border-radius: 0.5rem 0.5rem 0 0 !important;
            padding: 1.25rem 1.5rem;
            position: relative;
        }

        .card-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background: linear-gradient(90deg, var(--secondary-color), var(--primary-color));
        }

        .danger-badge {
            position: absolute;
            top: -15px;
            right: -15px;
            background-color: var(--secondary-color);
            color: #000;
            font-weight: bold;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0.25rem 0.5rem rgba(0, 0, 0, 0.15);
            font-size: 1.5rem;
            z-index: 1;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .form-check-label {
            font-weight: 600;
            color: var(--dark-color);
        }

        .table-responsive {
            border-radius: 0.5rem;
            overflow: hidden;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }

        .table th {
            background-color: var(--light-color);
            font-weight: 700;
            color: var(--dark-color);
        }

        .table-hover tbody tr:hover {
            background-color: rgba(231, 74, 59, 0.05);
        }

        .btn-danger {
            background: linear-gradient(135deg, var(--primary-color), #c03427);
            border: none;
            padding: 0.75rem 1.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            border-radius: 0.35rem;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .btn-danger:hover {
            background: linear-gradient(135deg, #c03427, var(--primary-color));
            transform: translateY(-2px);
            box-shadow: 0 0.5rem 1rem rgba(231, 74, 59, 0.3);
        }

        .btn-outline-secondary {
            border-color: var(--accent-color);
            color: var(--accent-color);
            font-weight: 600;
        }

        .btn-outline-secondary:hover {
            background-color: var(--accent-color);
            color: white;
        }

        .warning-section {
            border-left: 4px solid var(--secondary-color);
            background-color: rgba(246, 194, 62, 0.05);
            padding: 1.5rem;
            border-radius: 0.35rem;
        }

        .form-control {
            border-radius: 0.35rem;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d3e2;
            transition: all 0.3s;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(231, 74, 59, 0.25);
        }

        .animate-delay-1 { animation-delay: 0.1s; }
        .animate-delay-2 { animation-delay: 0.2s; }
        .animate-delay-3 { animation-delay: 0.3s; }

        @media (max-width: 992px) {
            .header h1 {
                font-size: 2.2rem;
            }
            
            .danger-badge {
                width: 50px;
                height: 50px;
                font-size: 1.25rem;
            }
        }

        @media (max-width: 768px) {
            .header {
                padding: 2rem 0;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .card-header {
                font-size: 1.25rem;
                padding: 1rem;
            }
            
            .btn {
                padding: 0.65rem 1.25rem;
            }
            
            .danger-badge {
                width: 45px;
                height: 45px;
                font-size: 1.1rem;
                top: -10px;
                right: -10px;
            }
        }

        @media (max-width: 576px) {
            .header {
                padding: 1.5rem 0;
            }
            
            .header h1 {
                font-size: 1.8rem;
            }
            
            .form-check-label {
                font-size: 0.95rem;
            }
            
            .btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }
            
            .d-flex {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header class="animate__animated animate__fadeIn">
            <div class="header-content">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-lg-2 text-center text-lg-start">
                            <i class="fas fa-trash-alt fa-4x mb-3 mb-lg-0"></i>
                        </div>
                        <div class="col-lg-8 text-center">
                            <h1>The Reader's Gateway</h1>
                            <h2>Remove Books</h2>
                        </div>
                        <div class="col-lg-2 text-center text-lg-end">
                            <asp:HyperLink ID="lnkBack" runat="server" CssClass="btn btn-light" NavigateUrl="~/BookDetails.aspx">
                                <i class="fas fa-arrow-left me-2"></i>Back
                            </asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Form Section -->
        <div class="container mb-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    
                        <div class="danger-badge animate__animated animate__pulse animate__infinite">
                            <i class="fas fa-exclamation"></i>
                        </div>
                        <div class="card-header">
                            <i class="fas fa-trash-alt me-2"></i>Remove Books
                        </div>
                        <div class="card-body">
                            <!-- Source Selection -->
                           
                                <label class="form-label fw-bold mb-3"><i class="fas fa-filter me-2"></i>Remove From:</label>
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <div class="form-check">
                                            <asp:RadioButton ID="rbDiscounts" runat="server" GroupName="stocks" 
                                                AutoPostBack="true" CssClass="form-check-input" />
                                            <label class="form-check-label" for="rbDiscounts">
                                                <i class="fas fa-tag me-2"></i>Discounts
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="form-check">
                                            <asp:RadioButton ID="rbNewArrivals" runat="server" GroupName="stocks" 
                                                AutoPostBack="true" CssClass="form-check-input" />
                                            <label class="form-check-label" for="rbNewArrivals">
                                                <i class="fas fa-star me-2"></i>New Arrivals
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <div class="form-check">
                                            <asp:RadioButton ID="rbNormalBooks" runat="server" GroupName="stocks" 
                                                AutoPostBack="true" CssClass="form-check-input" />
                                            <label class="form-check-label" for="rbNormalBooks">
                                                <i class="fas fa-book me-2"></i>All Books
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            
                                <asp:Button ID="btnFetch" runat="server" Text="Fetch Book List" 
                                    CssClass="btn btn-danger" OnClick="btnFetch_Click" />
                            
                                <asp:GridView ID="gvBooks" runat="server" 
                                    CssClass="table table-hover table-bordered" 
                                    AutoGenerateColumns="true">
                                </asp:GridView>
                            
                                <h5 class="fw-bold mb-4"><i class="fas fa-exclamation-triangle me-2 text-warning"></i>Remove Book</h5>
                                
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label for="txtBookID" class="form-label"><i class="fas fa-barcode me-2"></i>Book ID</label>
                                        <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" 
                                            AutoPostBack="true" OnTextChanged="txtBookID_TextChanged"></asp:TextBox>
                                    </div>
                                    
                                    <div class="col-md-4 mb-3">
                                        <label for="txtBookName" class="form-label"><i class="fas fa-book me-2"></i>Book Name</label>
                                        <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" 
                                            ReadOnly="true"></asp:TextBox>
                                    </div>
                                    
                                    <div class="col-md-4 mb-3">
                                        <label for="txtCurrentStocks" class="form-label"><i class="fas fa-boxes me-2"></i>Current Stocks</label>
                                        <asp:TextBox ID="txtCurrentStocks" runat="server" CssClass="form-control" 
                                            ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="d-flex justify-content-between mt-4">
                                    <asp:Button ID="leave" runat="server" Text="Back to Dashboard" 
                                        CssClass="btn btn-outline-secondary" OnClick="btnleave_Click" />
                                        
                                    <asp:Button ID="btnRemove" runat="server" Text="Remove Book" 
                                        CssClass="btn btn-danger" OnClick="btnRemove_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
               
            </div>
     
        
        <!-- Footer -->
        <footer class="bg-dark text-white py-4 mt-5">
            <div class="container text-center">
                <p class="mb-0">&copy; 2023 The Reader's Gateway. All rights reserved.</p>
            </div>
        </footer>
    </form>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom Script -->
    <script>
        // Add confirmation dialog for remove action
        document.getElementById('<%= btnRemove.ClientID %>').addEventListener('click', function(e) {
            if (!confirm('Are you sure you want to remove this book? This action cannot be undone.')) {
                e.preventDefault();
            }
        });

        // Highlight table row on hover
        document.querySelectorAll('.table-hover tbody tr').forEach(row => {
            row.addEventListener('mouseenter', function() {
                this.style.transition = 'all 0.3s ease';
                this.style.transform = 'translateX(5px)';
            });
            row.addEventListener('mouseleave', function() {
                this.style.transform = 'translateX(0)';
            });
        });
    </script>
</body>
</html>