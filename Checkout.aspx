<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="finalyearproject.Checkout" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Checkout - The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .checkout-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-custom {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="checkout-container">
            <h2 class="text-center mb-4"><i class="fas fa-shopping-cart"></i> Checkout</h2>
            <p class="text-center text-muted">Verify your address details before proceeding</p>
            
            <form id="form1" runat="server">
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <asp:TextBox ID="TextBox2" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <asp:TextBox ID="TextBox3" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="mb-3">
                    Delivery Address Details with phone number and pincode
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" CssClass="form-control"  placeholder="Enter Delivery Address with Phone Number and Pincode" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
                </div>
                <div class="text-center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Proceed to Pay" CssClass="btn btn-custom btn-lg" />
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>