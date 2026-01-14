<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="finalyearadmin.orders" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Reader's Gateway - Orders Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .delivery-date {
            color: #dc3545;
            font-weight: 600;
        }
        .status-badge {
            min-width: 100px;
            font-size: 0.9rem;
        }
        .card-header {
            background: linear-gradient(45deg, #2c3e50, #3498db);
            color: white;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
        }
        .order-id {
            font-family: 'Courier New', monospace;
            color: #2c3e50;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <!-- Navigation Bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <i class="fas fa-book-open me-2"></i>The Reader's Gateway
                </a>
                <div class="d-flex align-items-center">
                    <span class="text-white me-3"><i class="fas fa-calendar-day me-2"></i>
                        <asp:Label ID="lblCurrentDate" runat="server"></asp:Label>
                    </span>
                   <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-outline-light" OnClick="btnBack_Click" />
                </div>
            </div>
        </nav>

        <main class="container my-4">
            <div class="card shadow-lg">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h3 class="mb-0"><i class="fas fa-clipboard-list me-2"></i>Today's Orders</h3>
                   <div class="d-flex gap-2">
    <asp:TextBox ID="txtOrderDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <asp:Button ID="btnSearchByDate" runat="server" Text="Search by Date" CssClass="btn btn-outline-light" OnClick="btnSearchByDate_Click" />
    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btn btn-light" OnClick="btnRefresh_Click" />
</div>

                </div>
                
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>#</th>
                                    <th>Order ID</th>
                                    <th class="d-none d-lg-table-cell">Order Item ID</th>
                                    <th>Book Name</th>
                                    <th class="text-center">Qty</th>
                                    <th class="d-none d-md-table-cell">Order Date</th>
                                    <th>Delivery Date</th>
                                    <th class="d-none d-xl-table-cell">Address</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptOrders" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td class="fw-bold"><%# Container.ItemIndex + 1 %></td>
                                            <td class="order-id"><%# Eval("OrderID") %></td>
                                            <td class="d-none d-lg-table-cell"><%# Eval("OrderItemID") %></td>
                                            <td><%# Eval("BookName") %></td>
                                            <td class="text-center"><span class="badge bg-primary"><%# Eval("Quantity") %></span></td>
                                            <td class="d-none d-md-table-cell"><%# Convert.ToDateTime(Eval("OrderedDate")).ToString("dd-MMM-yy") %></td>
                                            <td class="delivery-date"><%# Convert.ToDateTime(Eval("DeliveryDate")).ToString("dd MMM yyyy") %></td>
                                            <td class="d-none d-xl-table-cell text-truncate" style="max-width: 200px;"><%# Eval("DeliveryAddress") %></td>
                                            <td>
                                                <asp:Button ID="btnStatus" runat="server" Text='<%# Eval("OrderStatus") %>'
                                                    CommandName="ChangeStatus" CommandArgument='<%# Eval("OrderID") %>'
                                                    CssClass='<%# "btn btn-sm status-badge rounded-pill " + GetOrderStatusClass(Eval("OrderStatus").ToString()) %>'
                                                    OnClick="btnStatus_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="card-footer bg-transparent">
                    <div class="d-flex justify-content-between align-items-center">
                        <small class="text-muted">Total Orders: <asp:Label ID="lblTotalOrders" runat="server" CssClass="fw-bold"></asp:Label></small>
                       
                    </div>
                </div>
            </div>
        </main>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Initialize Bootstrap tooltips
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl)
        })
    </script>
</body>
</html>