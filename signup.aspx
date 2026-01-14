<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="finalyearproject.signup" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>📚 Bookstore - Sign Up</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary-color: #4e73df;
            --secondary-color: #224abe;
            --accent-color: #f8f9fc;
            --success-color: #1cc88a;
            --danger-color: #e74a3b;
        }
        
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        
        .signup-container {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
            padding: 2rem;
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
        }
        
        .signup-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .signup-header h2 {
            color: var(--primary-color);
            font-weight: 700;
        }
        
        .form-label {
            font-weight: 600;
            color: #5a5c69;
        }
        
        .form-control {
            padding: 0.75rem 1rem;
            border-radius: 0.35rem;
            border: 1px solid #d1d3e2;
        }
        
        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
        }
        
        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
            padding: 0.75rem;
            font-weight: 600;
            width: 100%;
        }
        
        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }
        
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
        }
        
        .login-link a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        .error-message {
            color: var(--danger-color);
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        
        .valid-feedback {
            color: var(--success-color);
            font-size: 0.875rem;
        }
        
        .password-container {
            position: relative;
        }
        
        .password-toggle {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #6c757d;
        }
        
        .input-icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }
        
        .input-group-text {
            background-color: #f8f9fc;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="signup-container">
                    <div class="signup-header">
                        <h2>Create Your Account</h2>
                        <p>Join our bookstore community today</p>
                    </div>
                    
                    <form id="form1" runat="server">
                        <!-- Username Field -->
                        <div class="mb-3">
                            <label for="txtUsername" class="form-label">Username</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                                    placeholder="Enter username" MaxLength="20"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                ControlToValidate="txtUsername" ErrorMessage="Username is required" 
                                CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revUsername" runat="server"
                                ControlToValidate="txtUsername"
                                ValidationExpression="^[a-zA-Z0-9_]{4,20}$"
                                ErrorMessage="4-20 characters (letters, numbers, underscore)"
                                CssClass="error-message" Display="Dynamic" />
                        </div>
                        
                        <!-- Email Field -->
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" 
                                    placeholder="Enter email"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="Email is required" 
                                CssClass="error-message" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                ControlToValidate="txtEmail"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
                                ErrorMessage="Invalid email format"
                                CssClass="error-message" Display="Dynamic" />
                        </div>
                        
                        <!-- Password Field -->
                        <div class="mb-3">
                            <label for="txtPassword" class="form-label">Password</label>
                            <div class="password-container">
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" 
                                        CssClass="form-control" placeholder="Enter password"></asp:TextBox>
                                    <span class="password-toggle" id="togglePassword">
                                        <i class="far fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                ControlToValidate="txtPassword" ErrorMessage="Password is required" 
                                CssClass="error-message" Display="Dynamic" />
                            
                        </div>
                        
                        <!-- Phone Number Field -->
                        <div class="mb-3">
                            <label for="txtPhone" class="form-label">Phone Number</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-phone"></i></span>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" 
                                    placeholder="Enter phone number"></asp:TextBox>
                            </div>
                            <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                ControlToValidate="txtPhone"
                                ValidationExpression="^[0-9]{10}$"
                                ErrorMessage="10-digit phone number required"
                                CssClass="error-message" Display="Dynamic" />
                        </div>
                        
                        <!-- Address Field -->
                        <div class="mb-4">
                            <label for="txtAddress" class="form-label">Address</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2" 
                                    CssClass="form-control" placeholder="Enter your address"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ControlToValidate="txtAddress" ErrorMessage="Address is required" 
                                CssClass="error-message" Display="Dynamic" />
                        </div>
                        
                        <!-- Sign Up Button -->
                        <asp:Button ID="BtnLogin" runat="server" Text="Sign Up" 
                            CssClass="btn btn-primary" OnClick="BtnLogin_Click" />
                        
                        <!-- Login Link -->
                        <div class="login-link">
                            <p>Already have an account? <a href="login.aspx">Log in</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Password toggle visibility
        document.getElementById('togglePassword').addEventListener('click', function () {
            const password = document.getElementById('<%= txtPassword.ClientID %>');
            const icon = this.querySelector('i');

            if (password.type === 'password') {
                password.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                password.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        });

        // Client-side validation
        (function () {
            'use strict';

            // Fetch all forms we want to apply custom validation styles to
            var forms = document.querySelectorAll('.needs-validation');

            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault();
                            event.stopPropagation();
                        }

                        form.classList.add('was-validated');
                    }, false);
                });
        })();
    </script>
</body>
</html>