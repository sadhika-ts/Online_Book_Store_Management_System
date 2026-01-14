<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="finalyearproject.feedback" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Feedback Page</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(120deg, #fdfbfb 0%, #ebedee 100%);
            min-height: 100vh;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .star-rating {
            direction: rtl;
            display: inline-block;
            font-size: 40px;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: #ddd;
            cursor: pointer;
            transition: color 0.2s;
            margin: 0 5px;
        }

        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #ffd700;
        }

        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(255, 215, 0, 0.25);
            border-color: #ffd700;
        }

        .submit-btn {
            background: linear-gradient(45deg, #ffd700, #ffaa00);
            border: none;
            padding: 12px 30px;
            font-weight: 600;
            transition: all 0.3s;
        }

        .submit-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(255, 215, 0, 0.3);
        }

        .rating-label {
            font-size: 1.1rem;
            font-weight: 500;
            color: #444;
        }
    </style>
</head>
<body>
    <form id="feedbackForm" runat="server">
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">Book Feedback</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Home</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6">
                    <div class="card">
                        <div class="card-header bg-white text-center py-4">
                            <h2 class="mb-0">Share Your Feedback</h2>
                            <p class="text-muted">We value your opinion</p>
                        </div>
                        <div class="card-body p-4">
                            <!-- Book Selection -->
                            <div class="mb-4">
                                <label for="ddlBookName" class="form-label rating-label">Select Book</label>
                                <asp:DropDownList ID="ddlBookName" runat="server" CssClass="form-select form-select-lg">
                                    <asp:ListItem Text="Choose a book..." Value="" Selected="True" />
                                </asp:DropDownList>
                            </div>

                            <!-- Rating -->
                            <div class="mb-4">
                                <label class="form-label rating-label">Your Rating</label>
                                <div class="d-flex justify-content-center">
                                    <div class="star-rating">
                                        <input type="radio" id="star5" name="rating" value="5" runat="server" />
                                        <label for="star5" title="5 stars">&#9733;</label>
                                        <input type="radio" id="star4" name="rating" value="4" runat="server" />
                                        <label for="star4" title="4 stars">&#9733;</label>
                                        <input type="radio" id="star3" name="rating" value="3" runat="server" />
                                        <label for="star3" title="3 stars">&#9733;</label>
                                        <input type="radio" id="star2" name="rating" value="2" runat="server" />                                        
                                        <label for="star3" title="2 stars">&#9733;</label>
                                        <input type="radio" id="star1" name="rating" value="1" runat="server" />
                                        <label for="star1" title="1 star">&#9733;</label>
                                    </div>
                                </div>
                            </div>

                            <!-- Comments -->
                            <div class="mb-4">
                                <label for="txtComments" class="form-label rating-label">Comments</label>
                                <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" 
                                    Rows="5" placeholder="Share your thoughts..." 
                                    CssClass="form-control"></asp:TextBox>
                            </div>

                            <!-- Submit Button -->
                            <div class="d-grid gap-2">
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" 
                                    OnClick="SubmitFeedback_Click" CssClass="btn submit-btn rounded-pill" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>