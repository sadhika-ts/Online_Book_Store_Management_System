<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDiscounts.aspx.cs" Inherits="finalyearadmin.AddDiscounts" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>The Reader's Gateway - Add Discounts</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #1cc88a;
            --accent-color: #f6c23e;
            --dark-color: #5a5c69;
            --light-color: #f8f9fc;
        }
        
        body {
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: var(--light-color);
            color: var(--dark-color);
        }
        
        header {
            background: linear-gradient(135deg, var(--primary-color), #224abe);
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
        }
        
        .card {
            border: none;
            border-radius: 0.35rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            margin-bottom: 1.5rem;
            transition: transform 0.3s ease;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card-header {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            border-radius: 0.35rem 0.35rem 0 0 !important;
        }
        
        .form-control, .form-select {
            border-radius: 0.35rem;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d3e2;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 0.75rem 1.5rem;
            font-weight: 600;
        }
        
        .btn-primary:hover {
            background-color: #2e59d9;
            border-color: #2653d4;
        }
        
        .btn-success {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
            padding: 0.75rem 1.5rem;
            font-weight: 600;
        }
        
        .btn-success:hover {
            background-color: #17a673;
            border-color: #169b6b;
        }
        
        .price-box {
            background-color: #f8f9fc;
            border-radius: 0.35rem;
            padding: 1rem;
            margin-bottom: 1rem;
            border-left: 0.25rem solid var(--accent-color);
        }
        
        .price-label {
            font-weight: 600;
            color: var(--dark-color);
        }
        
        .price-value {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary-color);
        }
        
        .discount-badge {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: var(--accent-color);
            color: #000;
            font-weight: bold;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        
        .section-title {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 50px;
            height: 3px;
            background-color: var(--accent-color);
        }
        
        .form-icon {
            position: absolute;
            top: 50%;
            left: 15px;
            transform: translateY(-50%);
            color: var(--primary-color);
        }
        
        .input-group-icon {
            padding-left: 40px;
        }
        
        @media (max-width: 768px) {
            .responsive-row {
                flex-direction: column;
            }
            
            .price-box {
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header class="animate__animated animate__fadeIn">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2 text-center text-lg-start">
                        <i class="fas fa-book-open fa-4x mb-3 mb-lg-0"></i>
                    </div>
                    <div class="col-lg-8 text-center">
                        <h1 class="display-4 fw-bold">The Reader's Gateway</h1>
                        <h2 class="h4">Add Discounted Books</h2>
                    </div>
                    <div class="col-lg-2 text-center text-lg-end">
                        <asp:HyperLink ID="lnkBack" runat="server" CssClass="btn btn-light" NavigateUrl="~/BookDetails.aspx">
                            <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
        </header>

        <!-- Main Form Section -->
        <div class="container mb-5">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="card animate__animated animate__fadeInUp">
                        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                            <h4 class="m-0 font-weight-bold text-white">
                                <i class="fas fa-tag me-2"></i>Book Discount Details
                            </h4>
                            <div class="discount-badge animate__animated animate__pulse animate__infinite">
                                <asp:Label ID="lblDiscountPercent" runat="server" Text="%"></asp:Label>
                            </div>
                        </div>
                        <div class="card-body">
                            <!-- Book Basic Information -->
                            <h5 class="section-title">Basic Information</h5>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="position-relative">
                                        <i class="fas fa-book form-icon"></i>
                                        <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control input-group-icon" 
                                            placeholder="Book Name" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="position-relative">
                                        <i class="fas fa-user-edit form-icon"></i>
                                        <asp:TextBox ID="txtAuthorName" runat="server" CssClass="form-control input-group-icon" 
                                            placeholder="Author Name" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <div class="position-relative">
                                        <i class="fas fa-building form-icon"></i>
                                        <asp:TextBox ID="txtPublisherName" runat="server" CssClass="form-control input-group-icon" 
                                            placeholder="Publisher Name" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="position-relative">
                                        <i class="far fa-calendar-alt form-icon"></i>
                                        <asp:TextBox ID="txtPublishDate" runat="server" CssClass="form-control input-group-icon" 
                                            TextMode="Date" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Book Description -->
                            <div class="mb-4">
                                <label for="txtBookDescription" class="form-label fw-bold">
                                    <i class="fas fa-align-left me-2"></i>Book Description
                                </label>
                                <asp:TextBox ID="txtBookDescription" runat="server" CssClass="form-control" 
                                    required="true" TextMode="MultiLine" Rows="5" 
                                    placeholder="Enter detailed book description..."></asp:TextBox>
                            </div>
                            


                                                        <!-- Filter Section -->
<div class="row mb-4">
   
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
           
        </div>
    </div>
</div>

                            <!-- Pricing Section -->
                            <h5 class="section-title">Pricing Information</h5>
                            <div class="row responsive-row">
                                <div class="col-md-3 mb-3">
                                    <div class="price-box h-100">
                                        <div class="price-label">Original Price</div>
                                        <div class="input-group">
                                            <span class="input-group-text">₹</span>
                                            <asp:TextBox ID="txtop" runat="server" CssClass="form-control text-end" 
                                                required="true" placeholder="0.00"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-3 mb-3">
                                    <div class="price-box h-100">
                                        <div class="price-label">Discount Percentage</div>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtp" runat="server" CssClass="form-control text-end" 
                                                placeholder="0" AutoPostBack="true" OnTextChanged="txtp_TextChanged"></asp:TextBox>
                                            <span class="input-group-text">%</span>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-3 mb-3">
                                    <div class="price-box h-100">
                                        <div class="price-label">Discount Amount</div>
                                        <div class="input-group">
                                            <span class="input-group-text">₹</span>
                                            <asp:TextBox ID="txtda" runat="server" CssClass="form-control text-end" 
                                                required="true" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-3 mb-3">
                                    <div class="price-box h-100 bg-success bg-opacity-10">
                                        <div class="price-label text-success">Final Price</div>
                                        <div class="input-group">
                                            <span class="input-group-text text-success">₹</span>
                                            <asp:TextBox ID="txtfp" runat="server" CssClass="form-control text-end fw-bold text-success" 
                                                required="true" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Additional Information -->
                            <h5 class="section-title">Additional Information</h5>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="fileBookPhoto" class="form-label fw-bold">
                                        <i class="fas fa-camera me-2"></i>Book Cover Image
                                    </label>
                                    <div class="card">
                                        <div class="card-body text-center">
                                            <div class="mb-3">
                                                <asp:Image ID="imgPreview" runat="server" CssClass="img-thumbnail" 
                                                    ImageUrl="~/Images/placeholder-book.jpg" Width="200" Height="300" />
                                            </div>
                                            <asp:FileUpload ID="fileBookPhoto" runat="server" CssClass="form-control" 
                                                accept=".jpg,.jpeg,.png" required="true" />
                                            <small class="text-muted">Recommended size: 200x300 pixels, JPG/PNG format</small>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6 mb-3">
                                    <div class="mb-3">
                                        <label for="txtstocks" class="form-label fw-bold">
                                            <i class="fas fa-boxes me-2"></i>Available Stock
                                        </label>
                                        <div class="input-group">
                                            <asp:TextBox ID="txtstocks" runat="server" CssClass="form-control" 
                                                required="true" TextMode="Number" min="0" placeholder="0"></asp:TextBox>
                                            <span class="input-group-text">units</span>
                                        </div>
                                    </div>
                                    
                                  
                                </div>
                            </div>
                            
                            <!-- Submit Button -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <asp:Button ID="btnReset" runat="server" Text="Reset Form" 
                                    CssClass="btn btn-outline-secondary me-md-2" CausesValidation="false" />
                                <asp:Button ID="btnSubmit" runat="server" Text="Add Discounted Book" 
                                    CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                            </div>
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

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    
    <!-- Custom Script for Image Preview -->
    <script>
        document.getElementById('<%= fileBookPhoto.ClientID %>').addEventListener('change', function(e) {
            if (this.files && this.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('<%= imgPreview.ClientID %>').setAttribute('src', e.target.result);
                }
                reader.readAsDataURL(this.files[0]);
            }
        });
    </script>
</body>
</html>