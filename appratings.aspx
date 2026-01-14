<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appratings.aspx.cs" Inherits="finalyearproject.appratings" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Reviews - The Reader's Gateway</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Remix Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css">
    
    <!-- Swiper JS CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css">
    
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
            --container-color: #ffffff;
            --border-color: #e0e0e0;
            --h1-font-size: 2.5rem;
            --h2-font-size: 1.75rem;
            --h3-font-size: 1.25rem;
            --normal-font-size: 1rem;
            --small-font-size: 0.875rem;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--light-bg);
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Header Styles */
        .main-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 3rem 0;
            text-align: center;
            position: relative;
            overflow: hidden;
            margin-bottom: 3rem;
        }

        .main-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxkZWZzPjxwYXR0ZXJuIGlkPSJwYXR0ZXJuIiB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHBhdHRlcm5Vbml0cz0idXNlclNwYWNlT25Vc2UiIHBhdHRlcm5UcmFuc2Zvcm09InJvdGF0ZSg0NSkiPjxyZWN0IHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgZmlsbD0icmdiYSgyNTUsMjU1LDI1NSwwLjA1KSIvPjwvcGF0dGVybj48L2RlZnM+PHJlY3QgZmlsbD0idXJsKCNwYXR0ZXJuKSIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIvPjwvc3ZnPg==');
            opacity: 0.3;
        }

        .main-header h1 {
            font-size: var(--h1-font-size);
            font-weight: 700;
            margin-bottom: 0.5rem;
            position: relative;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .main-header p {
            font-size: 1.25rem;
            opacity: 0.9;
            position: relative;
        }

        /* Section Title */
        .section-title {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .section-title h2 {
            font-size: var(--h2-font-size);
            font-weight: 700;
            color: var(--primary-color);
            display: inline-block;
            position: relative;
            padding-bottom: 1rem;
        }

        .section-title h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, var(--primary-color), var(--secondary-color));
            border-radius: 3px;
        }

        /* Testimonial Cards */
        .testimonial__card {
            background-color: var(--container-color);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            height: 100%;
            display: flex;
            flex-direction: column;
            border: 1px solid rgba(0,0,0,0.05);
        }

        .testimonial__card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
        }

        .testimonial__img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            object-fit: cover;
            border: 5px solid rgba(106, 17, 203, 0.1);
            transition: all 0.3s ease;
        }

        .testimonial__card:hover .testimonial__img {
            border-color: rgba(106, 17, 203, 0.3);
        }

        .testimonial__title {
            font-size: var(--h3-font-size);
            font-weight: 600;
            margin-bottom: 0.75rem;
            color: var(--text-dark);
        }

        .testimonial__description {
            font-size: var(--normal-font-size);
            margin-bottom: 1.5rem;
            color: var(--text-light);
            flex-grow: 1;
        }

        .testimonial__stars {
            color: #FFD700;
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }

        /* Swiper Navigation */
        .swiper-button-next,
        .swiper-button-prev {
            color: var(--primary-color) !important;
            background: rgba(255, 255, 255, 0.8);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .swiper-button-next::after,
        .swiper-button-prev::after {
            font-size: 1.2rem !important;
        }

        .swiper-button-next:hover,
        .swiper-button-prev:hover {
            background: white;
            transform: scale(1.1);
        }

        /* Swiper Pagination */
        .swiper-pagination-bullet {
            background: #ccc !important;
            opacity: 1 !important;
        }

        .swiper-pagination-bullet-active {
            background: var(--primary-color) !important;
        }

        /* Rating Summary Section */
        .rating-summary {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.05);
            margin-bottom: 3rem;
        }

        .overall-rating {
            text-align: center;
            margin-bottom: 2rem;
        }

        .rating-number {
            font-size: 3.5rem;
            font-weight: 700;
            color: var(--primary-color);
            line-height: 1;
            margin-bottom: 0.5rem;
        }

        .rating-stars {
            font-size: 1.5rem;
            color: #FFD700;
            margin-bottom: 1rem;
        }

        .rating-count {
            color: var(--text-light);
            font-size: 0.9rem;
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .main-header {
                padding: 2.5rem 0;
            }
            
            .main-header h1 {
                font-size: 2.2rem;
            }
            
            .section-title h2 {
                font-size: 1.8rem;
            }
        }

        @media (max-width: 768px) {
            .main-header {
                padding: 2rem 0;
            }
            
            .main-header h1 {
                font-size: 2rem;
            }
            
            .testimonial__card {
                padding: 2rem;
            }
            
            .rating-number {
                font-size: 3rem;
            }
        }

        @media (max-width: 576px) {
            .main-header {
                padding: 1.5rem 0;
            }
            
            .main-header h1 {
                font-size: 1.8rem;
            }
            
            .testimonial__card {
                padding: 1.5rem;
            }
            
            .testimonial__img {
                width: 80px;
                height: 80px;
            }
            
            .swiper-button-next,
            .swiper-button-prev {
                display: none !important;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Main Header -->
        <header class="main-header animate__animated animate__fadeIn">
            <div class="container">
                <h1 class="animate__animated animate__fadeInDown">📚 The Reader's Gateway</h1>
                <p class="animate__animated animate__fadeInUp">What Our Readers Say About Us</p>
            </div>
        </header>
         <asp:HyperLink ID="btnback" runat="server" NavigateUrl="homepage.aspx" CssClass="btn btn-primary">
     <i class="fas fa-book me-2"></i> back
 </asp:HyperLink>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="feedback.aspx" CssClass="btn btn-primary">
    <i class="fas fa-book me-2"></i> leave a feedback
</asp:HyperLink>
        <!-- Rating Summary -->
        <div class="container rating-summary animate__animated animate__fadeIn">
            <div class="row align-items-center">
                <div class="col-md-4 overall-rating">
                    <div class="rating-number">4.8</div>
                    <div class="rating-stars">
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-fill"></i>
                        <i class="ri-star-half-fill"></i>
                    </div>
                    <div class="rating-count">Based on 247 reviews</div>
                </div>
                <div class="col-md-8">
                    <div class="row">
                        <div class="col-6 col-md-3 text-center mb-3">
                            <div class="h4 mb-1">5★</div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 85%" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted">210 reviews</small>
                        </div>
                        <div class="col-6 col-md-3 text-center mb-3">
                            <div class="h4 mb-1">4★</div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted">25 reviews</small>
                        </div>
                        <div class="col-6 col-md-3 text-center mb-3">
                            <div class="h4 mb-1">3★</div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 3%" aria-valuenow="3" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted">8 reviews</small>
                        </div>
                        <div class="col-6 col-md-3 text-center mb-3">
                            <div class="h4 mb-1">2★</div>
                            <div class="progress" style="height: 8px;">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 1%" aria-valuenow="1" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <small class="text-muted">3 reviews</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Testimonials Section -->
        <section class="section" id="testimonial">
            <div class="container">
                <div class="section-title animate__animated animate__fadeIn">
                    <h2>Customer Reviews</h2>
                </div>

                <div class="testimonial__container">
                    <div class="testimonial__swiper swiper animate__animated animate__fadeInUp">
                        <div class="swiper-wrapper">
                            <!-- Testimonial 1 -->
                            <article class="testimonial__card swiper-slide">
                                <img src="img/p1.png" alt="Rose" class="testimonial__img">

                                <h3 class="testimonial__title">Rose</h3>
                                <p class="testimonial__description">
                                    The best website to buy books, the purchase is very easy to make and has great discounts. 
                                    The delivery was faster than expected and the books arrived in perfect condition.
                                </p>

                                <div class="testimonial__stars">
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-half-fill"></i>
                                </div>
                                <small class="text-muted">Posted 2 weeks ago</small>
                            </article>

                            <!-- Testimonial 2 -->
                            <article class="testimonial__card swiper-slide">
                                <img src="img/p2.png" alt="Jack" class="testimonial__img">

                                <h3 class="testimonial__title">Jack</h3>
                                <p class="testimonial__description">
                                    'The Great Train Journey' book shows the journey of a common man. 
                                    This book makes me travel along with him. The website's recommendation 
                                    system is spot on!
                                </p>

                                <div class="testimonial__stars">
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                </div>
                                <small class="text-muted">Posted 1 month ago</small>
                            </article>

                            <!-- Testimonial 3 -->
                            <article class="testimonial__card swiper-slide">
                                <img src="img/p3.png" alt="Inarvi" class="testimonial__img">

                                <h3 class="testimonial__title">Inarvi</h3>
                                <p class="testimonial__description">
                                    'One Indian Girl' book talks about the freedom of Indian girls. 
                                    Thank you for the website to suggest this wonderful book. 
                                    The mobile app is also very user-friendly.
                                </p>

                                <div class="testimonial__stars">
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-line"></i>
                                </div>
                                <small class="text-muted">Posted 3 days ago</small>
                            </article>

                            <!-- Testimonial 4 -->
                            <article class="testimonial__card swiper-slide">
                                <img src="img/p4.png" alt="Peter" class="testimonial__img">

                                <h3 class="testimonial__title">Peter</h3>
                                <p class="testimonial__description">
                                    This website provides great discounts and offers. 
                                    I will suggest this website to my friends and family members. 
                                    Customer support is excellent too!
                                </p>

                                <div class="testimonial__stars">
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-fill"></i>
                                    <i class="ri-star-half-fill"></i>
                                </div>
                                <small class="text-muted">Posted 2 months ago</small>
                            </article>

                           

                        <!-- Swiper Navigation -->
                        <div class="swiper-button-next"></div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script>
        // Initialize Swiper
        let swiperTestimonial = new Swiper('.testimonial__swiper', {
            loop: true,
            spaceBetween: 30,
            grabCursor: true,
            slidesPerView: 'auto',
            centeredSlides: true,
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            breakpoints: {
                768: {
                    slidesPerView: 2,
                    centeredSlides: false,
                },
                992: {
                    slidesPerView: 3,
                    centeredSlides: false,
                }
            }
        });

        // Add animation to cards on hover
        document.querySelectorAll('.testimonial__card').forEach(card => {
            card.addEventListener('mouseenter', function () {
                this.querySelector('.testimonial__img').style.transform = 'scale(1.1)';
            });

            card.addEventListener('mouseleave', function () {
                this.querySelector('.testimonial__img').style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>