<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDetails.aspx.cs" Inherits="finalyearadmin.UserDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Management | The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --dark-color: #343a40;
            --light-color: #f8f9fa;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7ff;
        }
        
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .main-container {
            padding: 2rem;
            max-width: 1400px;
            margin: 0 auto;
        }
        
        .table-container {
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 1.5rem;
            overflow-x: auto;
        }
        
        .table th {
            background-color: var(--primary-color);
            color: white;
        }
        
        .action-btn {
            padding: 0.25rem 0.5rem;
            font-size: 0.85rem;
        }
        
        @media (max-width: 768px) {
            .main-container {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <i class="fas fa-book-open me-2"></i>The Reader's Gateway
                </a>
            </div>
        </nav>
       
        <!-- Main Content -->
        <div class="main-container">

            <h2 class="mb-4"><i class="fas fa-users me-2"></i>User Management</h2>
            
            <!-- Search Section -->
            <div class="card mb-4">
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6 mb-2 mb-md-0">
                            <div class="input-group">
                                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" 
                                    placeholder="Search by username or email"></asp:TextBox>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" 
                                    CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" 
                                CssClass="btn btn-outline-secondary" OnClick="btnRefresh_Click" />
                        </div>
                        <div class="col-md-6">
                                <div class="col-lg-2 text-center text-lg-end">
                             <asp:HyperLink ID="lnkBack" runat="server" CssClass="btn btn-light" NavigateUrl="~/adminhome.aspx">
                             <i class="fas fa-arrow-left me-2"></i>Back
                             </asp:HyperLink>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            
            <!-- User Details Table -->
            <div class="table-container">
                <asp:GridView ID="gvUserDetails" runat="server" AutoGenerateColumns="False" 
    CssClass="table table-hover" EmptyDataText="No users found"
    AllowPaging="True" PageSize="10" OnPageIndexChanging="gvUserDetails_PageIndexChanging"
    DataKeyNames="userid" OnRowCommand="gvUserDetails_RowCommand">
    
    <Columns>
        <%-- Optional: Display UserID if you want --%>
        <asp:BoundField DataField="userid" HeaderText="User ID" />

        <asp:BoundField DataField="username" HeaderText="Username" />

        <asp:TemplateField HeaderText="Password">
            <ItemTemplate>
                ••••••••
            </ItemTemplate>
        </asp:TemplateField>

        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="phonenumber" HeaderText="Phone" />
        <asp:BoundField DataField="address" HeaderText="Address" />

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteUser" 
                    CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'

                    CssClass="btn btn-sm btn-danger action-btn"
                    OnClientClick="return confirm('Are you sure you want to delete this user?');">
                    <i class="fas fa-trash-alt"></i> Delete
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

    <PagerSettings Mode="NumericFirstLast" />
    <PagerStyle CssClass="pagination justify-content-center" />
</asp:GridView>

            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>