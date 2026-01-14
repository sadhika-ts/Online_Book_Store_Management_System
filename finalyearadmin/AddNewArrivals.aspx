<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewArrivals.aspx.cs" Inherits="finalyearadmin.AddNewArrivals" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <title>The Reader's Gateway - Add New Arrivals</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
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
            --primary-color: #36b9cc;
            --secondary-color: #1cc88a;
            --accent-color: #f6c23e;
            --dark-color: #5a5c69;
            --light-color: #f8f9fc;
        }
        
        body {
            font-family: 'Nunito', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: #f8f9fc;
            color: var(--dark-color);
            background-image: linear-gradient(rgba(255,255,255,0.95), rgba(255,255,255,0.95)), 
                            url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
        }
        
        header {
            background: linear-gradient(135deg, var(--primary-color), #2c9faf);
            color: white;
            padding: 3rem 0;
            margin-bottom: 2rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            position: relative;
            overflow: hidden;
        }
        
        header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            opacity: 0.1;
            z-index: 0;
        }
        
        .header-content {
            position: relative;
            z-index: 1;
        }
        
        .new-arrival-badge {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: var(--accent-color);
            color: #000;
            font-weight: bold;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.1);
            font-size: 1.25rem;
            z-index: 1;
        }
        
        .card {
            border: none;
            border-radius: 0.5rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            margin-bottom: 2rem;
            transition: transform 0.3s ease;
            background-color: rgba(255,255,255,0.95);
            position: relative;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .card-header {
            background: linear-gradient(135deg, var(--primary-color), #2c9faf);
            color: white;
            font-weight: 700;
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            border-radius: 0.5rem 0.5rem 0 0 !important;
            padding: 1.25rem 1.5rem;
        }
        
        .form-control, .form-select {
            border-radius: 0.35rem;
            padding: 0.75rem 1rem;
            border: 1px solid #d1d3e2;
            transition: all 0.3s;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(54, 185, 204, 0.25);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 0.75rem 1.75rem;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            border-radius: 0.35rem;
            transition: all 0.3s;
        }
        
        .btn-primary:hover {
            background-color: #2da4bb;
            border-color: #2a9eb4;
            transform: translateY(-2px);
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
        }
        
        .form-label {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 0.5rem;
        }
        
        .section-title {
            color: var(--primary-color);
            font-weight: 700;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 0.5rem;
            font-family: 'Playfair Display', serif;
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
        
        .img-preview-container {
            border: 2px dashed #d1d3e2;
            border-radius: 0.5rem;
            padding: 1rem;
            text-align: center;
            background-color: #f8f9fc;
            margin-bottom: 1rem;
        }
        
        .img-preview {
            max-width: 100%;
            height: auto;
            border-radius: 0.35rem;
        }
        
        .arrival-date-picker {
            border: 2px solid var(--primary-color);
            border-radius: 0.5rem;
            padding: 1rem;
            background-color: rgba(54, 185, 204, 0.05);
        }
        
        @media (max-width: 768px) {
            header {
                padding: 2rem 0;
            }
            
            .card-header {
                font-size: 1.25rem;
            }
            
            .btn-primary {
                padding: 0.65rem 1.5rem;
            }
            
            .new-arrival-badge {
                width: 50px;
                height: 50px;
                font-size: 1rem;
            }
        }
        
        @media (max-width: 576px) {
            header {
                padding: 1.5rem 0;
            }
            
            .card-header {
                font-size: 1.1rem;
                padding: 1rem;
            }
            
            .form-control, .form-select {
                padding: 0.65rem 0.9rem;
            }
            
            .new-arrival-badge {
                width: 40px;
                height: 40px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header class="animate__animated animate__fadeIn">
            <div class="container header-content">
                <div class="row align-items-center">
                    <div class="col-lg-2 text-center text-lg-start">
                        <i class="fas fa-bookmark fa-4x mb-3 mb-lg-0"></i>
                    </div>
                    <div class="col-lg-8 text-center">
                        <h1 class="display-4 fw-bold">The Reader's Gateway</h1>
                        <h2 class="h4">Add New Arrivals</h2>
                    </div>
                    <div class="col-lg-2 text-center text-lg-end">
                        <asp:HyperLink ID="lnkBack" runat="server" CssClass="btn btn-light" NavigateUrl="~/BookDetails.aspx">
                            <i class="fas fa-arrow-left me-2"></i>Back
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
                        <div class="new-arrival-badge animate__animated animate__pulse animate__infinite">
                            NEW
                        </div>
                        <div class="card-header">
                            <i class="fas fa-star me-2"></i>New Arrival Details
                        </div>
                        <div class="card-body">
                            <!-- Basic Information -->
                            <h5 class="section-title">Book Information</h5>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="txtBookName" class="form-label">Book Name</label>
                                    <div class="position-relative">
                                        <i class="fas fa-book form-icon"></i>
                                        <asp:TextBox ID="txtBookName" runat="server" CssClass="form-control input-group-icon" 
                                            placeholder="Enter book title" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="txtAuthorName" class="form-label">Author Name</label>
                                    <div class="position-relative">
                                        <i class="fas fa-user-edit form-icon"></i>
                                        <asp:TextBox ID="txtAuthorName" runat="server" CssClass="form-control input-group-icon" 
                                            placeholder="Enter author's name" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="txtPublisherName" class="form-label">Publisher Name</label>
                                    <div class="position-relative">
                                        <i class="fas fa-building form-icon"></i>
                                        <asp:TextBox ID="txtPublisherName" runat="server" CssClass="form-control input-group-icon" 
                                            placeholder="Enter publisher's name" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-4">
                                    <label for="txtPublishDate" class="form-label">Original Publish Date</label>
                                    <div class="position-relative">
                                        <i class="far fa-calendar-alt form-icon"></i>
                                        <asp:TextBox ID="txtPublishDate" runat="server" CssClass="form-control input-group-icon" 
                                            TextMode="Date" required="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Book Description -->
                            <div class="mb-4">
                                <label for="txtBookDescription" class="form-label">Book Description</label>
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

                            <!-- Arrival Information -->
                            <h5 class="section-title">Arrival Details</h5>
                            <div class="row">
                                <div class="col-md-4 mb-4">
                                    <label for="txtArrivalDate" class="form-label">Arrival Date</label>
                                    <div class="arrival-date-picker">
                                        <asp:TextBox ID="txtArrivalDate" runat="server" CssClass="form-control" 
                                            TextMode="Date" required="true"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="col-md-4 mb-4">
                                    <label for="txtCost" class="form-label">Price</label>
                                    <div class="input-group">
                                        <span class="input-group-text">₹</span>
                                        <asp:TextBox ID="txtCost" runat="server" CssClass="form-control text-end" 
                                            required="true" placeholder="0.00" TextMode="Number" step="0.01"></asp:TextBox>
                                    </div>
                                </div>
                                
                                <div class="col-md-4 mb-4">
                                    <label for="txtstocks" class="form-label">Initial Stock</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="txtstocks" runat="server" CssClass="form-control text-end" 
                                            required="true" placeholder="0" TextMode="Number" min="0"></asp:TextBox>
                                        <span class="input-group-text">units</span>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Book Cover -->
                            <h5 class="section-title">Book Cover</h5>
                            <div class="row">
                                <div class="col-md-6 mb-4">
                                    <label for="fileBookPhoto" class="form-label">Upload Cover Image</label>
                                    <div class="img-preview-container">
                                        <asp:Image ID="imgPreview" runat="server" CssClass="img-preview mb-3" 
                                            ImageUrl="~/Images/placeholder-book.jpg" Width="200" />
                                        <asp:FileUpload ID="fileBookPhoto" runat="server" CssClass="form-control" 
                                            accept=".jpg,.jpeg,.png" required="true" />
                                    </div>
                                    <small class="text-muted">Recommended size: 200x300 pixels, JPG/PNG format</small>
                                </div>
                                
                               
                            </div>
                            
                            <!-- Submit Button -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                                <asp:Button ID="btnSubmit" runat="server" Text="Add New Arrival" 
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

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
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
        
        // Set arrival date to today by default
        document.addEventListener('DOMContentLoaded', function() {
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0');
            var yyyy = today.getFullYear();
            today = yyyy + '-' + mm + '-' + dd;
            document.getElementById('<%= txtArrivalDate.ClientID %>').value = today;
        });
    </script>
</body>
</html>