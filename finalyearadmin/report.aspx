<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="finalyearadmin.report" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Profit Report</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
        }
        
        .header-title {
            font-family: 'Playfair Display', serif;
            font-size: 2.5rem;
            color: #2c3e50;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
            animation: fadeInDown 1s ease;
        }
        
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
            background: white;
        }
        
        .card:hover {
            transform: translateY(-5px);
        }
        
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
        }
        
        .table thead {
            background: #2c3e50;
            color: white;
        }
        
        .table-hover tbody tr:hover {
            background-color: rgba(44, 62, 80, 0.05);
        }
        
        .list-group-item {
            border: none;
            margin-bottom: 8px;
            border-radius: 8px !important;
            transition: all 0.3s ease;
        }
        
        .list-group-item:hover {
            background-color: #f8f9fa;
            transform: translateX(10px);
        }
        
        .chart-container {
            position: relative;
            height: 400px;
        }
        
        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .section-title {
            font-family: 'Playfair Display', serif;
            color: #2c3e50;
            border-bottom: 2px solid #2c3e50;
            padding-bottom: 0.5rem;
            margin-bottom: 1.5rem;
        }
        /* Custom Back Button Style */
    .btn-home {
        background: #f8f9fa;
        border: 2px solid #2c3e50;
        color: #2c3e50;
        padding: 0.75rem 1.5rem;
        border-radius: 30px;
        font-weight: 500;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }

    .btn-home:hover {
        background: #2c3e50;
        color: white;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .btn-home:active {
        transform: translateY(0);
        box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }

    /* Custom Refresh Button Style */
    .btn-refresh {
        background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
        color: white;
        padding: 0.75rem 1.5rem;
        border: none;
        border-radius: 30px;
        font-weight: 500;
        position: relative;
        overflow: hidden;
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        box-shadow: 0 4px 6px rgba(37, 117, 252, 0.1);
    }

    .btn-refresh:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 12px rgba(37, 117, 252, 0.15);
        background: linear-gradient(135deg, #2575fc 0%, #6a11cb 100%);
    }

    .btn-refresh:active {
        transform: translateY(0);
        box-shadow: 0 2px 4px rgba(37, 117, 252, 0.1);
    }

    .btn-refresh::after {
        content: "🔄";
        margin-left: 0.5rem;
        display: inline-block;
        transition: transform 0.3s ease;
    }

    .btn-refresh:hover::after {
        transform: rotate(360deg);
    }
        .badge-custom {
            background: #3498db;
            font-weight: 500;
        }
        
        @media (max-width: 768px) {
            .header-title {
                font-size: 2rem;
            }
            
            .chart-container {
                height: 300px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-5">
            <!-- Header -->
            <div class="text-center mb-5">
                <h1 class="header-title">The Reader's Gateway</h1>
            </div>
             <div class="d-flex justify-content-center gap-3 mb-5 flex-wrap">
               <asp:Button ID="btnBack" runat="server" Text="Back to Home" 
     CssClass="btn-home" OnClick="btnBack_Click" />
<asp:Button ID="btnRefresh" runat="server" Text="Refresh Data" 
     CssClass="btn-refresh" OnClick="btnRefresh_Click" />
            </div>
            <!-- Main Content -->
            <div class="row g-4">
                <!-- Profit Loss Table -->
               <div class="col-lg-8">
    <div class="card p-4">
        <h3 class="section-title">Profit/Loss Analysis</h3>
        <div class="table-responsive">
<asp:Repeater ID="rptProfitLossTable" runat="server" OnItemDataBound="rptProfitLossTable_ItemDataBound">
    <HeaderTemplate>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Book Name</th>
                    <th>Category</th>
                    
                    <th>Profit Per Unit</th>
                    <th>Quantity</th>
                    <th>Profit</th>
                </tr>
            </thead>
            <tbody>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td><%# Eval("Book ID") %></td>
            <td><%# Eval("Book Name") %></td>
            <td><%# Eval("Category") %></td>
          
            <td><%# Eval("Profit Per Unit", "{0:C}") %></td>
              <td><%# Eval("Quantity") %></td>
            <td class="fw-bold"><%# Eval("Profit", "{0:C}") %></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        <tr style="font-weight:bold;">
            <td colspan="5" style="text-align:right;">Total Profit:</td>
            <td><asp:Label ID="lblTotalProfit" runat="server" /></td>
        </tr>
        </tbody>
        </table>
    </FooterTemplate>
</asp:Repeater>

        </div>
    </div>
</div>

                <!-- Top 10 Books -->
                <div class="col-lg-4">
                    <div class="card p-4">
                        <h3 class="section-title">Best Sellers</h3>
                        <asp:Repeater ID="rptTopBooks" runat="server">
                            <HeaderTemplate>
                                <div class="list-group">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="list-group-item d-flex justify-content-between align-items-center">
                                     <span class="text-truncate">
                                        Book ID<strong> <%# Eval("bookid") %></strong> - <%# Eval("bookname") %>
                                    </span>
                                   
                                    <span class="badge badge-custom rounded-pill"><%# Eval("TotalSold") %></span>
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <!-- Chart Section -->
            <div class="row mt-4">
            <div class="col-12">
    <div class="card p-4">
        <h3 class="section-title">Category Profit Distribution</h3>
        <div class="chart-container">
            <canvas id="categoryProfitChart"></canvas>
        </div>
        <!-- This Literal is used to inject the JavaScript dynamically -->
        <asp:Literal ID="litCategoryProfitChart" runat="server"></asp:Literal>
    </div>
</div>
            </div>
        </div>
    </form>

    <script>
        // Add smooth scroll behavior
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Initialize animations on scroll
        window.addEventListener('scroll', function () {
            const cards = document.querySelectorAll('.card');
            cards.forEach(card => {
                const cardTop = card.getBoundingClientRect().top;
                if (cardTop < window.innerHeight) {
                    card.style.opacity = '1';
                }
            });
        });
   });
        });
    </script>
</body>
</html>