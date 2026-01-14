<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="paymentdetails.aspx.cs" Inherits="finalyearadmin.paymentdetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Details</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <style>
        .summary-card {
            border-left: 4px solid #0d6efd;
            border-radius: 0.375rem;
        }
        .table-hover tbody tr:hover {
            background-color: rgba(13, 110, 253, 0.05);
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container mt-4">
            <!-- Added Headings -->
            <div class="text-center mb-4">
                <h1 class="display-5 fw-bold text-primary mb-3">The Reader's Gateway</h1>
                <h2 class="lead text-muted">Payment Details</h2>
            </div>

            <!-- Header Section -->
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div class="summary-card bg-white p-3 shadow-sm">
                    <span class="text-muted">Total Amount Received:</span>
                    <h3 class="text-success mb-0">₹<asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label></h3>
                    </div>
                 <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btn btn-light" OnClick="btnRefresh_Click" />
  <asp:HyperLink ID="lnkBack" runat="server" CssClass="btn btn-light" NavigateUrl="~/adminhome.aspx">
    <i class="fas fa-arrow-left me-2"></i>Back
</asp:HyperLink>             
            </div>

            <!-- Payments Grid -->
            <div class="card shadow-sm">
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <asp:GridView ID="gvPayments" runat="server" AutoGenerateColumns="False" 
                            GridLines="None" CssClass="table table-hover align-middle mb-0">
                            <Columns>
                                <asp:BoundField DataField="orderid" HeaderText="Order ID" 
                                    HeaderStyle-CssClass="bg-light" />
                                <asp:BoundField DataField="username" HeaderText="User Name" 
                                    HeaderStyle-CssClass="bg-light" />
                                <asp:BoundField DataField="orderdate" HeaderText="Order Date" 
                                    DataFormatString="{0:dd-MM-yyyy}" HeaderStyle-CssClass="bg-light" />
                                <asp:BoundField DataField="paymentstatus" HeaderText="Payment Status" 
                                    HeaderStyle-CssClass="bg-light">
                                    <ItemStyle CssClass="text-capitalize" />
                                </asp:BoundField>
                                <asp:BoundField DataField="totalamount" HeaderText="Amount (₹)" 
                                    DataFormatString="{0:F2}" HeaderStyle-CssClass="bg-light">
                                    <ItemStyle CssClass="fw-bold text-end" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle CssClass="bg-light" />
                            <RowStyle CssClass="border-bottom" />
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- Mobile Summary -->
            <div class="d-lg-none mt-4 p-3 bg-white rounded shadow-sm">
                <h5 class="text-muted mb-3">Total Summary</h5>
                <div class="d-flex justify-content-between align-items-center">
                    <span class="text-muted">Total Received:</span>
                    <h5 class="text-success mb-0">₹<asp:Label ID="lblGrandTotalBottom" runat="server" Text=""></asp:Label></h5>
                </div>
            </div>
        </div>

        <!-- Bootstrap 5 JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    </form>
</body>
</html>