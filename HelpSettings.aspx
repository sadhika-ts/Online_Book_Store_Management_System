<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelpSettings.aspx.cs" Inherits="finalyearproject.HelpSettings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Help & Settings | The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <!-- Remixicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" />
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Playfair+Display:wght@400;500;600&display=swap" rel="stylesheet" />
    <!-- Animate.css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --text-color: #333;
            --text-light: #6c757d;
            --bg-gradient: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7ff;
            color: var(--text-color);
            line-height: 1.6;
            overflow-x: hidden;
        }
        
        .display-font {
            font-family: 'Playfair Display', serif;
        }
        
        /* Header Styles */
        header {
            background: var(--bg-gradient);
            color: white;
            padding: 2rem 0;
            position: relative;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
            z-index: 1;
        }
        
        .header-content {
            position: relative;
            z-index: 2;
        }
        
        /* Main Content */
        .main-content {
            padding: 4rem 0;
        }
        
        .section-title {
            font-family: 'Playfair Display', serif;
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 2rem;
            position: relative;
            display: inline-block;
        }
        
        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 60px;
            height: 3px;
            background: var(--accent-color);
        }
        
        /* Help Cards */
        .help-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: var(--card-shadow);
            transition: var(--transition);
            height: 100%;
            border: none;
            margin-bottom: 1.5rem;
        }
        
        .help-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
        }
        
        .help-card i {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
        }
        
        .help-card h3 {
            font-weight: 600;
            margin-bottom: 1rem;
        }
        
        .help-card p {
            color: var(--text-light);
        }
        
        /* Settings Section */
        .settings-section {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: var(--card-shadow);
            margin-bottom: 2rem;
        }
        
        .settings-title {
            font-weight: 600;
            color: var(--primary-color);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .settings-title i {
            font-size: 1.5rem;
        }
        
        /* FAQ Accordion */
        .accordion-item {
            border: none;
            margin-bottom: 10px;
            border-radius: 8px !important;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .accordion-button {
            font-weight: 500;
            border-radius: 8px !important;
            background-color: rgba(67, 97, 238, 0.05);
        }
        
        .accordion-button:not(.collapsed) {
            background-color: rgba(67, 97, 238, 0.1);
            color: var(--primary-color);
        }
        
        /* Footer */
        .footer {
            background: linear-gradient(135deg, #2c3e50, #1a2533);
            color: white;
            padding: 4rem 0 2rem;
            position: relative;
        }
        
        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--bg-gradient);
        }
        
        .footer__logo {
            display: flex;
            align-items: center;
            gap: 10px;
            color: white;
            font-size: 1.5rem;
            font-weight: 600;
            text-decoration: none;
            margin-bottom: 1.5rem;
        }
        
        .footer__logo i {
            color: var(--accent-color);
            font-size: 2rem;
        }
        
        .footer__description {
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 1.5rem;
        }
        
        .footer__title {
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
            color: white;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer__title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 40px;
            height: 2px;
            background: var(--accent-color);
        }
        
        .footer__links {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        
        .footer__link {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 8px;
        }
        
        .footer__link i {
            font-size: 0.9rem;
        }
        
        .footer__link:hover {
            color: var(--accent-color);
            transform: translateX(5px);
        }
        
        .footer__social {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }
        
        .footer__social-link {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            transition: var(--transition);
        }
        
        .footer__social-link:hover {
            background: var(--primary-color);
            transform: translateY(-5px);
        }
        
        .footer__copy {
            text-align: center;
            margin-top: 3rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.9rem;
        }
        
        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .section-title {
                font-size: 1.8rem;
            }
            
            .help-card {
                padding: 1.5rem;
            }
        }
        
        @media (max-width: 768px) {
            header {
                padding: 1.5rem 0;
            }
            
            .main-content {
                padding: 2rem 0;
            }
            
            .section-title {
                font-size: 1.6rem;
            }
            
            .footer__container {
                grid-template-columns: 1fr;
                gap: 2.5rem;
            }
        }
        
        /* Animations */
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
        
        .animate-in {
            animation: fadeInUp 0.6s ease-out forwards;
        }
        
        .delay-1 {
            animation-delay: 0.2s;
        }
        
        .delay-2 {
            animation-delay: 0.4s;
        }
        
        .delay-3 {
            animation-delay: 0.6s;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header Section -->
        <header>
            <div class="container header-content">
                <h1 class="display-4 display-font animate__animated animate__fadeInDown">📚 The Reader's Gateway</h1>
                <p class="lead animate__animated animate__fadeIn animate__delay-1s">Help & Settings Center</p>
            </div>
        </header>

        <!-- Main Content -->
        <main class="main-content">
            <div class="container">
                <!-- Help Section -->
                <section class="mb-5 animate-in">
                    <h2 class="section-title">How can we help you?</h2>
                    <div class="row g-4">
                        <div class="col-md-4">
                            <div class="help-card animate-in delay-1">
                                <i class="ri-question-line"></i>
                                <h3>FAQs</h3>
                                <p>Find answers to commonly asked questions about our services and platform.</p>
                                <asp:Button ID="btnFAQs" runat="server" Text="View FAQs" CssClass="btn btn-outline-primary mt-3" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="help-card animate-in delay-2">
                                <i class="ri-customer-service-2-line"></i>
                                <h3>Contact Support</h3>
                                <p>Reach out to our support team for personalized assistance with any issues.</p>
                                <asp:Button ID="btnContact" runat="server" Text="Contact Us" CssClass="btn btn-outline-primary mt-3" />
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="help-card animate-in delay-3">
                                <i class="ri-book-read-line"></i>
                                <h3>User Guides</h3>
                                <p>Access comprehensive guides to help you make the most of our platform.</p>
                                <asp:Button ID="btnGuides" runat="server" Text="View Guides" CssClass="btn btn-outline-primary mt-3" />
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Settings Section -->
                <section class="mb-5">
                    <div class="settings-section animate-in">
                        <h3 class="settings-title"><i class="ri-user-settings-line"></i> Account Settings</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Notification Preferences</label>
                                    <div class="form-check form-switch mb-2">
                                        <asp:CheckBox ID="cbEmailNotif" runat="server" CssClass="form-check-input" Checked="true" />
                                        <label class="form-check-label" for="cbEmailNotif">Email Notifications</label>
                                    </div>
                                    <div class="form-check form-switch mb-2">
                                        <asp:CheckBox ID="cbSMSNotif" runat="server" CssClass="form-check-input" />
                                        <label class="form-check-label" for="cbSMSNotif">SMS Notifications</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Privacy Settings</label>
                                    <div class="form-check form-switch mb-2">
                                        <asp:CheckBox ID="cbProfileVisibility" runat="server" CssClass="form-check-input" Checked="true" />
                                        <label class="form-check-label" for="cbProfileVisibility">Public Profile</label>
                                    </div>
                                    <div class="form-check form-switch mb-2">
                                        <asp:CheckBox ID="cbDataCollection" runat="server" CssClass="form-check-input" Checked="true" />
                                        <label class="form-check-label" for="cbDataCollection">Allow Data Collection</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-end">
                            <asp:Button ID="btnSaveSettings" runat="server" Text="Save Settings" CssClass="btn btn-primary px-4" />
                        </div>
                    </div>
                </section>

                <!-- FAQ Section -->
                <section>
                    <h2 class="section-title">Frequently Asked Questions</h2>
                    <div class="accordion" id="faqAccordion">
                        <div class="accordion-item animate-in">
                            <h2 class="accordion-header" id="headingOne">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne">
                                    How do I reset my password?
                                </button>
                            </h2>
                            <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    You can reset your password by clicking on the "Forgot Password" link on the login page. You'll receive an email with instructions to create a new password.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item animate-in delay-1">
                            <h2 class="accordion-header" id="headingTwo">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo">
                                    Can I change my email address?
                                </button>
                            </h2>
                            <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    Currently, email addresses cannot be changed directly for security reasons. Please contact our support team if you need to update your email address.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item animate-in delay-2">
                            <h2 class="accordion-header" id="headingThree">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree">
                                    How do I contact customer support?
                                </button>
                            </h2>
                            <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body">
                                    You can contact our support team 24/7 through the "Contact Us" form in the Help section, or by emailing support@readersgateway.com. Average response time is under 2 hours.
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-4">
                        <a href="#" class="footer__logo">
                            <i class="ri-book-3-line"></i>The Reader's Gateway
                        </a>
                        <p class="footer__description">
                            Your premier destination for discovering and enjoying eBooks from all your favorite authors worldwide.
                        </p>
                        <div class="footer__social">
                            <a href="#" class="footer__social-link"><i class="ri-facebook-fill"></i></a>
                            <a href="#" class="footer__social-link"><i class="ri-twitter-fill"></i></a>
                            <a href="#" class="footer__social-link"><i class="ri-instagram-line"></i></a>
                            <a href="#" class="footer__social-link"><i class="ri-linkedin-fill"></i></a>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-2">
                        <h3 class="footer__title">Quick Links</h3>
                        <ul class="footer__links">
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> Home</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> About Us</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> Books</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> Authors</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <h3 class="footer__title">Support</h3>
                        <ul class="footer__links">
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> Help Center</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> Contact Us</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> Privacy Policy</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-arrow-right-line"></i> Terms of Service</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4 col-lg-3">
                        <h3 class="footer__title">Contact Info</h3>
                        <ul class="footer__links">
                            <li><a href="#" class="footer__link"><i class="ri-map-pin-line"></i> 123 Book Street, Library City</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-mail-line"></i> help@readersgateway.com</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-phone-line"></i> +1 (555) 123-4567</a></li>
                            <li><a href="#" class="footer__link"><i class="ri-time-line"></i> 24/7 Support</a></li>
                        </ul>
                    </div>
                </div>
                <div class="footer__copy">
                    &copy; <span id="currentYear"></span> The Reader's Gateway. All rights reserved.
                </div>
            </div>
        </footer>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    
    <script>
        // Set current year in footer
        document.getElementById('currentYear').textContent = new Date().getFullYear();
        
        // Add scroll animations
        document.addEventListener('DOMContentLoaded', function() {
            const animateElements = document.querySelectorAll('.animate-in');
            
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