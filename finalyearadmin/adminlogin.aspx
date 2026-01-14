<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminlogin.aspx.cs" Inherits="finalyearadmin.adminlogin" %>



<!DOCTYPE aspx>
<aspx xmlns="http://www.w3.org/1999/xaspx">
<head runat="server">
    <title>The Reader's Gateway - Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
        }
        .login-container {
    padding: 30px;
    background: rgba(255, 255, 255, 0.95);
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    animation: fadeIn 1.2s ease-in-out;
    width: 100%;
    max-width: 450px;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-20px); }
    to { opacity: 1; transform: translateY(0); }
}
        .login-container h2 {
           font-size: 28px;
font-weight: 600;
color: #343a40;
text-align: center;
margin-bottom: 20px;
        }
        .login-container h4 {
            color: #555;
            margin-bottom: 30px;
            font-size: 20px;
        }
        .form-label
        {
         font-weight: 600;
         color: #495057;
         font-size: 14px;
 }

 .form-control {
     border-radius: 8px;
     padding: 10px;
     border: 1px solid #ced4da;
     font-size: 16px;
     transition: border-color 0.3s, box-shadow 0.3s;
 }

 .form-control:focus {
     border-color: #6a11cb;
     box-shadow: 0 0 8px rgba(106, 17, 203, 0.3);
 }
        .btn-primary {
            background-color: #2575fc;
            border: none;
            border-radius: 10px;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #6a11cb;
        }
        .emoji {
            font-size: 24px;
            margin-right: 10px;
        }
        .message {
            margin-top: 20px;
            font-size: 14px;
            color: #ff4444;
        }
         .error-message {
    color: #dc3545;
    font-size: 14px;
    margin-top: 5px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>📚 The Reader's Gateway</h2>
            <h4>🔐 Admin Login</h4>
            <div class="mb-3">
                <label for="txtUsername" class="form-label">👤 Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
    ControlToValidate="txtUsername" ErrorMessage="Username is required" 
    CssClass="error-message" Display="Dynamic" />
            </div>
            <div class="mb-3">
                <label for="txtPassword" class="form-label">🔒 Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
    ControlToValidate="txtPassword" ErrorMessage="Password is required" 
    CssClass="error-message" Display="Dynamic" />
            </div>
            <div class="mb-3">
                <label for="txtPhoneNumber" class="form-label">📞 Phone Number</label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control" placeholder="Enter phone number"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server"
    ControlToValidate="txtPhoneNumber"
    ValidationExpression="^\d{10}$"
    ErrorMessage="Phone number must be 10 digits"
    CssClass="error-message" Display="Dynamic" />
            </div>
            <asp:Button ID="btnLogin" runat="server" Text="🚀 OK" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message mt-2 d-block text-center"></asp:Label>
        </div>
    </form>
</body>
</aspx>
