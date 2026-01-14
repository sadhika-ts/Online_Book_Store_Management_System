<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="finalyearproject.payment" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Terminal</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4cc9f0;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4bb543;
            --danger-color: #ff3333;
        }
        
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .payment-container {
            max-width: 500px;
            margin: 2rem auto;
            padding: 2rem;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }
        
        .payment-header {
            text-align: center;
            margin-bottom: 2rem;
            color: var(--primary-color);
        }
        
        .payment-header i {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--primary-color);
        }
        
        .payment-display {
            position: relative;
            margin-bottom: 2rem;
        }
        
        .payment-display input {
            font-size: 2rem;
            font-weight: bold;
            text-align: right;
            padding: 1rem;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            background-color: #f8f9fa;
            letter-spacing: 1px;
            transition: all 0.3s;
        }
        
        .payment-display input:focus {
            outline: none;
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(67, 97, 238, 0.1);
        }
        
        .payment-display .currency {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.5rem;
            color: var(--dark-color);
        }
        
        .number-pad {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 1.5rem;
        }
        
        .num-btn {
            padding: 1.5rem 0;
            font-size: 1.5rem;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.2s;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
        }
        
        .num-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
        }
        
        .num-btn:active {
            transform: translateY(0);
        }
        
        .btn-number {
            background-color: white;
            color: var(--dark-color);
        }
        
        .btn-number:hover {
            background-color: #f1f3f5;
        }
        
        .btn-clear {
            background-color: var(--danger-color);
            color: white;
        }
        
        .btn-clear:hover {
            background-color: #e60000;
        }
        
        .btn-submit {
            background-color: var(--success-color);
            color: white;
            font-weight: bold;
            grid-column: span 1;
        }
        
        .btn-submit:hover {
            background-color: #3aa33a;
        }
        
        .payment-footer {
            margin-top: 2rem;
            text-align: center;
            font-size: 0.9rem;
            color: #6c757d;
        }
        
        @media (max-width: 576px) {
            .payment-container {
                padding: 1.5rem;
                margin: 1rem;
            }
            
            .number-pad {
                gap: 10px;
            }
            
            .num-btn {
                padding: 1rem 0;
                font-size: 1.2rem;
            }
            
            .payment-display input {
                font-size: 1.5rem;
                padding: 0.75rem;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container py-5">
            <div class="payment-container">
                <div class="payment-header">
                    <i class="fas fa-credit-card"></i>
                    <h2>Payment Terminal</h2>
                    <p class="text-muted">Enter the payment amount</p>
                </div>
                
                <div class="payment-display">
                    <span class="currency">₹</span>
                    <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control payment-amount" ReadOnly="true" OnTextChanged="txtNumber_TextChanged"></asp:TextBox>
                </div>
                
                <div class="number-pad">
                    <button type="button" class="num-btn btn-number" onclick="addNumber(1)">1</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(2)">2</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(3)">3</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(4)">4</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(5)">5</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(6)">6</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(7)">7</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(8)">8</button>
                    <button type="button" class="num-btn btn-number" onclick="addNumber(9)">9</button>
                    <button type="button" class="num-btn btn-clear" onclick="clearInput()">
                        <i class="fas fa-undo-alt"></i>
                    </button>

                    <asp:Panel ID="pnlSuccessMessage" runat="server" Visible="false">
    <asp:Label ID="lblSuccessMessage" runat="server" Text="" Font-Bold="true" />
</asp:Panel>

<asp:Button ID="Button1" runat="server" Text="Pay" OnClick="btnSubmit_Click" />

                    <button type="button" class="num-btn btn-number" onclick="addNumber(0)">0</button>
                </div>
                
                <div class="payment-footer">
                    <p><i class="fas fa-lock"></i> Secure payment processing</p>
                </div>
            </div>
        </div>
    </form>

    <script>
        function addNumber(num) {
            let txtBox = document.getElementById('<%= txtNumber.ClientID %>');
            txtBox.value += num;
        }

        function clearInput() {
            document.getElementById('<%= txtNumber.ClientID %>').value = "";
        }

        // Add animation to buttons when clicked
        document.querySelectorAll('.num-btn').forEach(button => {
            button.addEventListener('click', function () {
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = '';
                }, 100);
            });
        });
    </script>
</body>
</html>