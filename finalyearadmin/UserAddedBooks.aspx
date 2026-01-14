<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAddedBooks.aspx.cs" Inherits="finalyearadmin.UserAddedBooks" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Books - The Reader's Gateway</title>
    
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
            --primary-color: #6a11cb;
            --secondary-color: #2575fc;
            --accent-color: #ff6b6b;
            --text-dark: #2d3436;
            --text-light: #636e72;
            --light-bg: #f8f9fa;
            --card-bg: #ffffff;
            --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f8f9fa;
            background-image: linear-gradient(rgba(255,255,255,0.95), rgba(255,255,255,0.95)), 
                            url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
        }

        .header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
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

        .book-details-card {
            background-color: rgba(255,255,255,0.95);
            border-radius: 16px;
            box-shadow: var(--shadow);
            padding: 2.5rem;
            margin: 2rem auto;
            max-width: 1000px;
            border: none;
            position: relative;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.1);
        }

        .book-details-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.15);
        }

        .book-details-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 6px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        .card-header {
            text-align: center;
            margin-bottom: 2.5rem;
            position: relative;

        }

        .card-header h2 {
            font-family: 'Playfair Display', serif;

            color: var(--primary-color);
            font-weight: 700;
            font-size: 2.2rem;
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .card-header h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: 2px;
        }

        .card-header .icon {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
            display: inline-block;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-group {
            margin-bottom: 1.8rem;
            position: relative;
        }

        .form-group label {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            transition: all 0.3s ease;
        }

        .form-group label i {
            margin-right: 12px;
            font-size: 1.1rem;
            color: var(--primary-color);
            width: 24px;
            text-align: center;
        }

        .form-control, .dropdown-select {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #e0e6ed;
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #f8fafc;
        }

        .form-control:focus, .dropdown-select:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(106, 17, 203, 0.1);
            background-color: #fff;
        }

        .dropdown-select {
            appearance: none;
            background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%236a11cb' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
            background-repeat: no-repeat;
            background-position: right 18px center;
            background-size: 1em;
        }
       

        .book-cover-container {
            text-align: center;
            margin: 2rem 0;
            position: relative;
            overflow: hidden;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            transition: all 0.4s ease;
            background: linear-gradient(135deg, #f5f7fa, #ffffff);
            padding: 20px;
            border: 1px dashed rgba(106, 17, 203, 0.3);
        }

        .book-cover-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 28px rgba(0,0,0,0.15);
            border-color: rgba(106, 17, 203, 0.5);
        }

        .book-cover-container label {
            display: block;
            margin-bottom: 1rem;
            font-weight: 600;
            color: var(--primary-color);
        }

        .book-cover-container img {
            max-width: 100%;
            height: auto;
            max-height: 280px;
            border-radius: 8px;
            transition: transform 0.4s ease;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .book-cover-container:hover img {
            transform: scale(1.02);
        }

        .btn-custom {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
            border: none;
            padding: 14px 28px;
            border-radius: 10px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(106, 17, 203, 0.3);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 0.95rem;
        }

        .btn-custom:hover {
            background: linear-gradient(135deg, var(--secondary-color), var(--primary-color));
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(106, 17, 203, 0.4);
        }

        .btn-custom i {
            margin-right: 10px;
            font-size: 1.1rem;
        }

        .btn-custom::after {
            content: "";
            position: absolute;
            top: 50%;
            left: 50%;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            opacity: 0;
            border-radius: 100%;
            transform: scale(1, 1) translate(-50%);
            transform-origin: 50% 50%;
        }

        .btn-custom:focus:not(:active)::after {
            animation: ripple 1s ease-out;
        }

        @keyframes ripple {
            0% {
                transform: scale(0, 0);
                opacity: 0.5;
            }
            100% {
                transform: scale(20, 20);
                opacity: 0;
            }
        }

        /* Animation for form elements */
        @keyframes fadeInUp {
            from { 
                opacity: 0; 
                transform: translateY(20px);
            }
            to { 
                opacity: 1; 
                transform: translateY(0);
            }
        }

        .animate-group {
            animation: fadeInUp 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
            opacity: 0;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .book-details-card {
                padding: 2rem;
            }
            
            .card-header h2 {
                font-size: 2rem;
            }
        }

        @media (max-width: 768px) {
            .book-details-card {
                padding: 1.75rem;
            }
            
            .card-header h2 {
                font-size: 1.8rem;
            }
            
            .form-control, .dropdown-select {
                padding: 12px 16px;
            }
            
            .btn-custom {
                padding: 12px 24px;
            }
        }

        @media (max-width: 576px) {
            body {
                padding: 15px;
                align-items: flex-start;
            }
            
            .book-details-card {
                padding: 1.5rem;
            }
            
            .card-header h2 {
                font-size: 1.6rem;
            }
            
            .form-group label {
                font-size: 0.95rem;
            }
            
            .btn-custom {
                width: 100%;
                padding: 14px;
            }
            
            .book-cover-container {
                margin: 1.5rem 0;
                padding: 15px;
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
                            <i class="fas fa-book fa-4x mb-3 mb-lg-0"></i>
                        </div>
                        <div class="col-lg-8 text-center">
                            <h1>The Reader's Gateway</h1>
                            <h2>Your Book Collection</h2>
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
        <div class="container">
            <div class="book-details-card animate__animated animate__fadeInUp">
                <div class="card-header">
                    <div class="icon">
                        <i class="fas fa-book-open"></i>
                    </div>
                    <h2>Your Book Details</h2>
                </div>

                <div class="row">
                    <div class="col-lg-6">
                        <!-- Book ID Dropdown -->
                        <div class="form-group animate-group" style="animation-delay: 0.1s">
                            <label for="ddlBookId"><i class="fas fa-id-card-alt"></i> Select Book ID:</label>
                            <asp:DropDownList ID="ddlBookId" runat="server" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlBookId_SelectedIndexChanged" CssClass="form-control dropdown-select">
                                <asp:ListItem Text="Select a Book ID" Value="" />
                            </asp:DropDownList>
                        </div>

                        <!-- Book Name Dropdown -->
                        <div class="form-group animate-group" style="animation-delay: 0.2s">
                            <label for="ddlBookName"><i class="fas fa-book"></i> Select Book Name:</label>
                            <asp:DropDownList ID="ddlBookName" runat="server" AutoPostBack="true" 
                                OnSelectedIndexChanged="ddlBookName_SelectedIndexChanged" CssClass="form-control dropdown-select">
                                <asp:ListItem Text="Select a Book Name" Value="" />
                            </asp:DropDownList>
                        </div>

                        <!-- Book ID -->
                        <div class="form-group animate-group" style="animation-delay: 0.3s">
                            <label for="txtBookId"><i class="fas fa-barcode"></i> Book ID:</label>
                            <asp:TextBox ID="txtBookId" runat="server" ReadOnly="true" CssClass="form-control" />
                        </div>

                        <!-- Book Name -->
                        <div class="form-group animate-group" style="animation-delay: 0.4s">
                            <label for="txtBookName"><i class="fas fa-bookmark"></i> Book Name:</label>
                            <asp:TextBox ID="txtBookName" runat="server" ReadOnly="true" CssClass="form-control" />
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <!-- Author Name -->
                        <div class="form-group animate-group" style="animation-delay: 0.5s">
                            <label for="txtAuthorName"><i class="fas fa-user-edit"></i> Author Name:</label>
                            <asp:TextBox ID="txtAuthorName" runat="server" ReadOnly="true" CssClass="form-control" />
                        </div>

                        <!-- Publisher Name -->
                        <div class="form-group animate-group" style="animation-delay: 0.6s">
                            <label for="txtPublisherName"><i class="fas fa-building"></i> Publisher Name:</label>
                            <asp:TextBox ID="txtPublisherName" runat="server" ReadOnly="true" CssClass="form-control" />
                        </div>

                        <!-- Cost -->
                        <div class="form-group animate-group" style="animation-delay: 0.7s">
                            <label for="txtCost"><i class="fas fa-tag"></i> Price:</label>
                            <div class="input-group">
                                <span class="input-group-text">₹</span>
                                <asp:TextBox ID="txtCost" runat="server" ReadOnly="true" CssClass="form-control" />
                            </div>
                        </div>

                        <!-- Publish Date -->
                        <div class="form-group animate-group" style="animation-delay: 0.8s">
                            <label for="txtPublishDate"><i class="fas fa-calendar-day"></i> Publish Date:</label>
                            <asp:TextBox ID="txtPublishDate" runat="server" ReadOnly="true" CssClass="form-control" />
                        </div>
                    </div>
                </div>

                <!-- Book Description -->
                <div class="form-group animate-group" style="animation-delay: 0.9s">
                    <label for="txtBookDescription"><i class="fas fa-align-left"></i> Book Description:</label>
                    <asp:TextBox ID="txtBookDescription" runat="server" ReadOnly="true" 
                        CssClass="form-control" TextMode="MultiLine" Rows="5" />
                </div>

                <!-- Book Cover -->
                <div class="book-cover-container animate-group" style="animation-delay: 1s">
                    <label><i class="fas fa-image"></i> Book Cover Preview</label>
                    <asp:Image ID="imgBookPhoto" runat="server" CssClass="img-fluid" />
                </div>

                <!-- Action Buttons -->
                <div class="d-flex justify-content-between mt-4">
                    <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" 
                        CssClass="btn btn-custom animate-group" style="animation-delay: 1.1s"
                        OnClick="btnleave_Click">
                    </asp:Button>
                    
                    <button type="button" class="btn btn-custom animate-group" style="animation-delay: 1.2s">
                        <i class="fas fa-download"></i> Export Details
                    </button>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Font Awesome JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
    
    <!-- Custom JS -->
    <script>
        // Add animation to form elements on focus
        document.querySelectorAll('.form-control, .dropdown-select').forEach(input => {
            input.addEventListener('focus', function () {
                const label = this.parentElement.querySelector('label');
                label.style.color = 'var(--primary-color)';
                label.querySelector('i').style.transform = 'scale(1.2)';
            });

            input.addEventListener('blur', function () {
                const label = this.parentElement.querySelector('label');
                label.style.color = 'var(--text-dark)';
                label.querySelector('i').style.transform = 'scale(1)';
            });
        });

        // Initialize animations
        document.addEventListener('DOMContentLoaded', function () {
            const animateGroups = document.querySelectorAll('.animate-group');
            animateGroups.forEach((group, index) => {
                group.style.animationDelay = `${0.1 + (index * 0.1)}s`;
            });
        });
    </script>
</body>
</html>