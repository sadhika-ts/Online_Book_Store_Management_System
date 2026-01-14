<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stocks.aspx.cs" Inherits="finalyearadmin.Stocks" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Stocks - The Reader's Gateway</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #36b9cc;
            --primary-light: #e3f6fa;
            --secondary-color: #1cc88a;
            --secondary-light: #e6f7f0;
            --dark-color: #2d3748;
            --light-color: #f8f9fc;
            --border-radius: 10px;
            --box-shadow: 0 10px 20px rgba(0,0,0,0.05);
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: var(--dark-color);
            line-height: 1.6;
        }
        
        .dashboard-card {
            border: none;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            margin-bottom: 2rem;
            background-color: white;
            overflow: hidden;
            transition: var(--transition);
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--primary-color), #2c9faf);
            color: white;
            font-weight: 600;
            border-radius: 0 !important;
            padding: 1.25rem 1.5rem;
            font-size: 1.25rem;
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 0.75rem 1.75rem;
            font-weight: 500;
            border-radius: 8px;
            letter-spacing: 0.5px;
            transition: var(--transition);
        }
        
        .btn-primary:hover {
            background-color: #2da4bb;
            border-color: #2a9eb4;
            transform: translateY(-2px);
        }
        
        .btn-outline-secondary {
            border-color: var(--dark-color);
            color: var(--dark-color);
            border-radius: 8px;
            padding: 0.75rem 1.75rem;
            font-weight: 500;
            transition: var(--transition);
        }
        
        .btn-outline-secondary:hover {
            background-color: var(--dark-color);
            color: white;
            transform: translateY(-2px);
        }
        
        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }
        
        .table-responsive {
            border-radius: var(--border-radius);
            overflow: hidden;
            box-shadow: 0 0 15px rgba(0,0,0,0.03);
        }
        
        .table {
            margin-bottom: 0;
        }
        
        .table th {
            background-color: var(--primary-light);
            color: var(--dark-color);
            font-weight: 600;
            padding: 1rem;
            border-bottom: 2px solid #dee2e6;
        }
        
        .table td {
            padding: 0.75rem 1rem;
            vertical-align: middle;
            border-top: 1px solid #f1f1f1;
        }
        
        .table tr:hover td {
            background-color: var(--primary-light);
        }
        
        .stock-input-group {
            position: relative;
        }
        
        .stock-input-group::after {
            content: "units";
            position: absolute;
            right: 15px;
            top: 38px;
            color: var(--dark-color);
            font-weight: 500;
            font-size: 0.875rem;
            opacity: 0.7;
        }
        
        .form-control, .form-select {
            border-radius: 8px;
            padding: 0.75rem 1rem;
            border: 1px solid #e2e8f0;
            transition: var(--transition);
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.25rem rgba(54, 185, 204, 0.25);
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
            color: var(--dark-color);
        }
        
        .section-title {
            position: relative;
            padding-bottom: 0.75rem;
            margin-bottom: 1.5rem;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 3px;
            background: var(--primary-color);
            border-radius: 3px;
        }
        
        .radio-group {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .radio-option {
            flex: 1;
            min-width: 200px;
            background: white;
            border-radius: var(--border-radius);
            padding: 1.25rem;
            box-shadow: var(--box-shadow);
            cursor: pointer;
            transition: var(--transition);
            border: 2px solid transparent;
        }
        
        .radio-option:hover {
            border-color: var(--primary-light);
        }
        
        .radio-option.selected {
            border-color: var(--primary-color);
            background-color: var(--primary-light);
        }
        
        .radio-option i {
            font-size: 1.5rem;
            color: var(--primary-color);
            margin-bottom: 0.75rem;
            display: block;
        }
        
        .action-buttons {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        
        @media (max-width: 992px) {
            .radio-option {
                min-width: 150px;
            }
        }
        
        @media (max-width: 768px) {
            .card-header {
                font-size: 1.1rem;
                padding: 1rem;
            }
            
            .btn {
                padding: 0.65rem 1.25rem;
                font-size: 0.875rem;
            }
            
            .radio-group {
                flex-direction: column;
            }
            
            .radio-option {
                width: 100%;
            }
            
            .stock-input-group::after {
                right: 12px;
                top: 35px;
            }
        }
        
        @media (max-width: 576px) {
            .container {
                padding-left: 15px;
                padding-right: 15px;
            }
            
            .action-buttons {
                flex-direction: column;
                gap: 0.75rem;
            }
            
            .action-buttons .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-4 py-lg-5">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="dashboard-card">
                        <div class="card-header d-flex align-items-center">
                            <i class="fas fa-boxes me-3"></i>
                            <span>Manage Inventory</span>
                        </div>
                        <div class="card-body p-4 p-md-5">
                            <div class="mb-4">
                                <h5 class="section-title">Filter Books</h5>
                                <div class="radio-group">
                                    <div class="radio-option" onclick="document.getElementById('<%= rbDiscounts.ClientID %>').checked = true; highlightSelected(this)">
                                        <i class="fas fa-tag"></i>
                                        <asp:RadioButton ID="rbDiscounts" runat="server" GroupName="stocks" 
                                            AutoPostBack="true" CssClass="form-check-input visually-hidden" />
                                        <label class="form-check-label d-block">
                                            <strong>Discount Books</strong>
                                            <small class="d-block text-muted">View discounted items</small>
                                        </label>
                                    </div>
                                    
                                    <div class="radio-option" onclick="document.getElementById('<%= rbNewArrivals.ClientID %>').checked = true; highlightSelected(this)">
                                        <i class="fas fa-star"></i>
                                        <asp:RadioButton ID="rbNewArrivals" runat="server" GroupName="stocks" 
                                            AutoPostBack="true" CssClass="form-check-input visually-hidden" />
                                        <label class="form-check-label d-block">
                                            <strong>New Arrivals</strong>
                                            <small class="d-block text-muted">Recently added books</small>
                                        </label>
                                    </div>
                                    
                                    <div class="radio-option" onclick="document.getElementById('<%= rbNormalBooks.ClientID %>').checked = true; highlightSelected(this)">
                                        <i class="fas fa-book"></i>
                                        <asp:RadioButton ID="rbNormalBooks" runat="server" GroupName="stocks" 
                                            AutoPostBack="true" CssClass="form-check-input visually-hidden" />
                                        <label class="form-check-label d-block">
                                            <strong>All Books</strong>
                                            <small class="d-block text-muted">Complete inventory</small>
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="text-center mt-3">
                                    <asp:Button ID="btnFetch" runat="server" Text="Load Inventory" 
                                        CssClass="btn btn-primary px-4" OnClick="btnFetch_Click" />
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h5 class="section-title m-0">Inventory List</h5>
                                    <div class="text-muted small">
                                        <asp:Label ID="lblResultCount" runat="server" Text="0 books found"></asp:Label>
                                    </div>
                                </div>
                                <div class="table-responsive rounded-3">
                                    <asp:GridView ID="gvBooks" runat="server" 
                                        CssClass="table table-hover align-middle" 
                                        AutoGenerateColumns="true"
                                        EmptyDataText="No books found. Please select a filter and click 'Load Inventory'."
                                        EmptyDataRowStyle-CssClass="text-center py-4">
                                    </asp:GridView>
                                </div>
                            </div>
                            
                            <div class="border-top pt-4 mt-4">
                                <h5 class="section-title">Update Inventory</h5>
                                <p class="text-muted mb-4">Enter book details below to update stock levels</p>
                                
                                <div class="row g-3">
                                    <div class="col-md-3">
                                        <label for="txtBookID" class="form-label">Book ID</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light"><i class="fas fa-barcode"></i></span>
                                            <asp:TextBox ID="txtBookID" runat="server" CssClass="form-control" 
                                                AutoPostBack="true" OnTextChanged="txtBookID_TextChanged"
                                                placeholder="Enter book ID"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-3">
                                        <label for="txtBookName" class="form-label">Book Name</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light"><i class="fas fa-book"></i></span>
                                            <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control" 
                                                placeholder="Book name"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-2">
                                        <label for="txtCurrentStocks" class="form-label">Current Stock</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light"><i class="fas fa-box-open"></i></span>
                                            <asp:TextBox ID="txtCurrentStocks" runat="server" CssClass="form-control" 
                                                ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-2 stock-input-group">
                                        <label for="txtNewStocks" class="form-label">Add Stock</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light"><i class="fas fa-plus-circle"></i></span>
                                            <asp:TextBox ID="txtNewStocks" runat="server" CssClass="form-control" 
                                                oninput="calculateTotalStocks()" Text="0"></asp:TextBox>
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-2">
                                        <label for="txtTotalStocks" class="form-label">Total Stock</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light"><i class="fas fa-check-circle"></i></span>
                                            <asp:TextBox ID="txtTotalStocks" runat="server" CssClass="form-control" 
                                                ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="action-buttons mt-4 pt-3">
                                    <asp:Button ID="leave" runat="server" Text="Back to Dashboard" 
                                        CssClass="btn btn-outline-secondary" OnClick="btnleave_Click" />
                                        
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update Inventory" 
                                        CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        function calculateTotalStocks() {
            var currentStocks = parseFloat(document.getElementById('<%= txtCurrentStocks.ClientID %>').value) || 0;
            var newStocks = parseFloat(document.getElementById('<%= txtNewStocks.ClientID %>').value) || 0;
            var totalStocks = currentStocks + newStocks;
            document.getElementById('<%= txtTotalStocks.ClientID %>').value = totalStocks;
        }

        function highlightSelected(element) {
            // Remove selected class from all options
            document.querySelectorAll('.radio-option').forEach(opt => {
                opt.classList.remove('selected');
            });

            // Add selected class to clicked option
            element.classList.add('selected');
        }

        // Initialize the selected radio button on page load
        document.addEventListener('DOMContentLoaded', function () {
            const selectedRadio = document.querySelector('.form-check-input:checked');
            if (selectedRadio) {
                const radioId = selectedRadio.id;
                const optionDiv = document.querySelector(`[onclick*="${radioId}"]`);
                if (optionDiv) {
                    optionDiv.classList.add('selected');
                }
            }
        });
    </script>
</body>
</html>