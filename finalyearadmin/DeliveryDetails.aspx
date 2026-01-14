<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryDetails.aspx.cs" Inherits="finalyearadmin.DeliveryDetails" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Delivery Details - The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        .card-header {
            background: linear-gradient(to right, #3498db, #2c3e50);
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        .status-badge {
            font-size: 0.9rem;
            padding: 0.3rem 0.6rem;
            border-radius: 1rem;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#"><i class="fas fa-truck me-2"></i>The Reader's Gateway</a>
                <div class="d-flex align-items-center">
                    <span class="text-white me-3"><i class="fas fa-calendar-day me-2"></i>
                        <asp:Label ID="lblDate" runat="server"></asp:Label>
                    </span>
                    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-outline-light" OnClick="btnBack_Click" />
                </div>
            </div>
        </nav>

        <main class="container my-4">
            <div class="card shadow-lg">
                <div class="card-header">
                    <h4 class="mb-0"><i class="fas fa-boxes me-2"></i>Delivery Details</h4>
                </div>

                <div class="card-body">
                    <!-- Tabs -->
                    <ul class="nav nav-tabs" id="deliveryTabs" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="out-for-delivery-tab" data-bs-toggle="tab" data-bs-target="#out-for-delivery" type="button" role="tab" aria-controls="out-for-delivery" aria-selected="true">
                                Out for Delivery
                            </button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="delivered-tab" data-bs-toggle="tab" data-bs-target="#delivered" type="button" role="tab" aria-controls="delivered" aria-selected="false">
                                Delivered
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content mt-4">
                        <!-- Out for Delivery Tab -->
                        <div class="tab-pane fade show active" id="out-for-delivery" role="tabpanel" aria-labelledby="out-for-delivery-tab">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th>#</th>
                                            <th>Order ID</th>
                                            <th>Order Item ID</th>
                                            <th>Book Name</th>
                                            <th>Quantity</th>
                                            <th>Order Date</th>
                                            <th>Delivery Date</th>
                                            <th>Address</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptDelivery" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Container.ItemIndex + 1 %></td>
                                                    <td><span class="fw-bold text-primary"><%# Eval("orderid") %></span></td>
                                                    <td><%# Eval("orderitemid") %></td>
                                                    <td><%# Eval("bookname") %></td>
                                                    <td><span class="badge bg-info text-dark"><%# Eval("quantity") %></span></td>
                                                    <td><%# Convert.ToDateTime(Eval("orderdate")).ToString("dd-MMM-yyyy") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("deliverydate")).ToString("dd-MMM-yyyy") %></td>
                                                    <td class="text-truncate" style="max-width: 200px;"><%# Eval("deliveryaddress") %></td>
                                                    <td>
                                                        <span class='<%# GetStatusClass(Eval("orderstatus").ToString()) %>'>
                                                            <%# Eval("orderstatus") %>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Delivered Tab -->
                        <div class="tab-pane fade" id="delivered" role="tabpanel" aria-labelledby="delivered-tab">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle mb-0">
                                    <thead class="table-light">
                                        <tr>
                                            <th>#</th>
                                            <th>Order ID</th>
                                            <th>Order Item ID</th>
                                            <th>Book Name</th>
                                            <th>Quantity</th>
                                            <th>Order Date</th>
                                            <th>Delivery Date</th>
                                            <th>Address</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rptDelivered" runat="server">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Container.ItemIndex + 1 %></td>
                                                    <td><span class="fw-bold text-primary"><%# Eval("orderid") %></span></td>
                                                    <td><%# Eval("orderitemid") %></td>
                                                    <td><%# Eval("bookname") %></td>
                                                    <td><span class="badge bg-info text-dark"><%# Eval("quantity") %></span></td>
                                                    <td><%# Convert.ToDateTime(Eval("orderdate")).ToString("dd-MMM-yyyy") %></td>
                                                    <td><%# Convert.ToDateTime(Eval("deliverydate")).ToString("dd-MMM-yyyy") %></td>
                                                    <td class="text-truncate" style="max-width: 200px;"><%# Eval("deliveryaddress") %></td>
                                                    <td>
                                                        <span class='<%# GetStatusClass(Eval("orderstatus").ToString()) %>'>
                                                            <%# Eval("orderstatus") %>
                                                        </span>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-footer text-muted text-end">
                    <asp:Label ID="lblTotalDeliveries" runat="server"></asp:Label>
                </div>
            </div>
        </main>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>