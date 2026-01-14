<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="finalyearproject.login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🔐 Login - The Reader's Gateway</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #6a11cb;
            --secondary-color: #2575fc;
            --accent-color: #ff6b6b;
            --text-dark: #2d3436;
            --text-light: #636e72;
            --light-bg: #f8f9fa;
        }

        body {
            background-color: #f8f9fa;
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('pagesweb/bookstore.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Poppins', sans-serif;
            padding: 20px;
            margin: 0;
        }

        .login-container {
            width: 100%;
            max-width: 450px;
            padding: 2.5rem;
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
            animation: fadeInUp 0.8s ease-out;
            position: relative;
            overflow: hidden;
        }

        .login-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
        }

        @keyframes fadeInUp {
            from { 
                opacity: 0; 
                transform: translateY(30px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h2 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            -webkit-background-clip: text;
            background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .login-header p {
            color: var(--text-light);
            font-size: 0.9rem;
        }

        .form-label {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
        }

        .form-label i {
            margin-right: 8px;
            color: var(--primary-color);
        }

        .form-control {
            border-radius: 10px;
            margin-bottom: 1rem;
            padding: 12px 15px;
            border: 2px solid #e0e0e0;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .form-control:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(106, 17, 203, 0.1);
        }

        .input-group-text {
            background-color: transparent;
            border-right: none;
        }

        .form-control-with-icon {
            border-left: none;
        }

        .btn-login {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            font-weight: 600;
            border: none;
            padding: 12px;
            border-radius: 10px;
            width: 100%;
            transition: all 0.3s ease;
            margin-top: 1rem;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            font-size: 0.95rem;
            position: relative;
            overflow: hidden;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(106, 17, 203, 0.2);
        }

        .btn-login:active {
            transform: translateY(-1px);
        }

        .btn-login::after {
            content: "";
            display: block;
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            pointer-events: none;
            background-image: radial-gradient(circle, #fff 10%, transparent 10.01%);
            background-repeat: no-repeat;
            background-position: 50%;
            transform: scale(10, 10);
            opacity: 0;
            transition: transform .5s, opacity 1s;
        }

        .btn-login:active::after {
            transform: scale(0, 0);
            opacity: 0.3;
            transition: 0s;
        }

        .error-message {
            color: #dc3545;
            font-size: 0.85rem;
            margin-top: -0.5rem;
            margin-bottom: 0.5rem;
            display: block;
        }

        .forgot-password {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            display: inline-block;
            margin-top: 1rem;
        }

        .forgot-password:hover {
            color: var(--secondary-color);
            transform: translateX(3px);
        }

        .additional-options {
            text-align: center;
            margin-top: 1.5rem;
            color: var(--text-light);
            font-size: 0.9rem;
        }

        .social-login {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-btn {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: all 0.3s ease;
        }

        .social-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .facebook { background-color: #3b5998; }
        .google { background-color: #db4437; }
        .twitter { background-color: #1da1f2; }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .login-container {
                padding: 2rem;
            }
            
            .login-header h2 {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 576px) {
            body {
                padding: 15px;
            }
            
            .login-container {
                padding: 1.5rem;
                border-radius: 15px;
            }
            
            .login-header h2 {
                font-size: 1.6rem;
            }
            
            .form-control {
                padding: 10px 12px;
            }
            
            .btn-login {
                padding: 10px;
                font-size: 0.9rem;
            }
        }

        @media (max-width: 400px) {
            .login-container {
                padding: 1.25rem;
            }
            
            .social-login {
                gap: 0.75rem;
            }
            
            .social-btn {
                width: 36px;
                height: 36px;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-sm-10 col-md-8 col-lg-6">
            <form id="mainForm" runat="server">
                <div class="login-container">
                    <div class="login-header">
                        <h2>Welcome Back</h2>
                        <p>Log in to access your reading dashboard</p>
                    </div>

                   <!-- Email Field -->
<div class="mb-3">
    <label for="txtEmail" class="form-label">Email Address</label>
    <div class="input-group">
        <span class="input-group-text"><i class="fas fa-envelope"></i></span>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control" 
            placeholder="Enter email" OnTextChanged="txtEmail_TextChanged"></asp:TextBox>
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
                        <label for="TextBox2" class="form-label">
                            <i class="fas fa-lock"></i> Password
                        </label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control form-control-with-icon" placeholder="Enter your password"></asp:TextBox>
                        </div>
                        <!-- RequiredFieldValidator for Password -->
                        <asp:RequiredFieldValidator 
                            ID="rfvPassword" 
                            runat="server" 
                            ControlToValidate="TextBox2"
                            ErrorMessage="Password is required" 
                            CssClass="error-message"
                            Display="Dynamic" />
                    </div>

                    <!-- Remember Me Checkbox -->
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" id="rememberMe">
                        <label class="form-check-label" for="rememberMe">
                            Remember me
                        </label>
                    </div>

                    <!-- Log In Button -->
                    <asp:Button 
                        ID="btnLogIn" 
                        runat="server" 
                        Text="Log In" 
                        CssClass="btn btn-login" 
                        OnClick="BtnLogin_Click" />

                   
                   
                    <!-- Divider -->
                    <div class="position-relative my-3">
                        <hr>
                        <div class="position-absolute top-50 start-50 translate-middle bg-white px-2">or</div>
                    </div>

                  

                    <!-- Sign Up Link -->
                    <div class="text-center mt-3">
                        <p>Don't have an account? <a href="signup.aspx" class="forgot-password">Sign up</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JS -->
<script>
    // Add animation to form elements on focus
    document.querySelectorAll('.form-control').forEach(input => {
        input.addEventListener('focus', function () {
            this.parentElement.parentElement.querySelector('.form-label').style.color = 'var(--primary-color)';
            this.parentElement.querySelector('.input-group-text').style.color = 'var(--primary-color)';
        });

        input.addEventListener('blur', function () {
            this.parentElement.parentElement.querySelector('.form-label').style.color = 'var(--text-dark)';
            this.parentElement.querySelector('.input-group-text').style.color = '';
        });
    });
</script>

</body>
</html>