<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="finalyearproject.Cart" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Shopping Cart - The Reader's Gateway</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4a6fa5;
            --secondary-color: #166088;
            --accent-color: #4fc3f7;
            --dark-color: #2d3142;
            --light-color: #f8f9fa;
            --success-color: #28a745;
            --danger-color: #dc3545;
            --warning-color: #ffc107;
        }

        body {
            background-color: #f5f7fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--dark-color);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar Styles */
        .navbar {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 0.8rem 1rem;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
            color: white !important;
            display: flex;
            align-items: center;
        }

        .navbar-brand i {
            margin-right: 10px;
            font-size: 1.8rem;
        }

        .nav-link {
            color: rgba(255, 255, 255, 0.85) !important;
            font-weight: 500;
            padding: 0.5rem 1rem;
            margin: 0 0.2rem;
            transition: all 0.3s ease;
            border-radius: 4px;
        }

        .nav-link:hover, .nav-link.active {
            color: white !important;
            background-color: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
        }

        /* Main Content */
        .main-content {
            flex: 1;
            padding: 2rem 0;
        }

        .cart-header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .cart-header h1 {
            font-weight: 700;
            color: var(--dark-color);
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        .cart-header h1:after {
            content: '';
            position: absolute;
            width: 60px;
            height: 4px;
            background: var(--accent-color);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }

        /* Cart Table */
        .cart-table {
            background-color: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 2rem;
        }

        .cart-table thead th {
            background-color: var(--primary-color);
            color: white;
            font-weight: 600;
            padding: 1rem;
            text-align: center;
        }

        .cart-table tbody td {
            vertical-align: middle;
            padding: 1.25rem 1rem;
            text-align: center;
        }

        .book-image {
            width: 60px;
            height: 90px;
            object-fit: cover;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .book-image:hover {
            transform: scale(1.05);
        }

        .quantity-input {
            width: 70px;
            margin: 0 auto;
            text-align: center;
        }

        /* Action Buttons */
        .btn-action {
            border: none;
            border-radius: 6px;
            padding: 0.5rem 1rem;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-continue {
            background-color: var(--primary-color);
            color: white;
        }

        .btn-continue:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
            color: white;
        }

        .btn-checkout {
            background-color: var(--success-color);
            color: white;
        }

        .btn-checkout:hover {
            background-color: #218838;
            transform: translateY(-2px);
            color: white;
        }

        .btn-remove {
            background-color: var(--danger-color);
            color: white;
        }

        .btn-remove:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            color: white;
        }

        /* Cart Summary */
        .cart-summary {
            background-color: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 2rem;
        }

        .summary-title {
            font-weight: 600;
            color: var(--dark-color);
            margin-bottom: 1.5rem;
            border-bottom: 2px solid var(--light-color);
            padding-bottom: 0.75rem;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .summary-total {
            font-weight: 700;
            font-size: 1.25rem;
            color: var(--success-color);
            border-top: 2px solid var(--light-color);
            padding-top: 1rem;
            margin-top: 1rem;
        }

        /* Empty Cart */
        .empty-cart {
            text-align: center;
            padding: 3rem;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
        }

        .empty-cart-icon {
            font-size: 4rem;
            color: var(--warning-color);
            margin-bottom: 1.5rem;
        }

        /* Footer */
        .footer {
            background-color: var(--dark-color);
            color: white;
            padding: 2rem 0;
            margin-top: auto;
        }

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            .navbar-brand {
                font-size: 1.2rem;
            }
            
            .cart-table thead {
                display: none;
            }
            
            .cart-table tbody tr {
                display: block;
                margin-bottom: 1.5rem;
                border: 1px solid #dee2e6;
                border-radius: 8px;
                padding: 1rem;
            }
            
            .cart-table tbody td {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0.75rem;
                border: none;
                text-align: right;
            }
            
            .cart-table tbody td:before {
                content: attr(data-label);
                font-weight: 600;
                margin-right: 1rem;
                color: var(--primary-color);
            }
            
            .book-image {
                margin: 0 auto;
            }
            
            .quantity-input {
                margin: 0;
            }
            
            .btn-action {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }

        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.1rem;
            }
            
            .cart-header h1 {
                font-size: 1.8rem;
            }
            
            .btn-group-responsive {
                flex-direction: column;
                gap: 0.75rem;
            }
            
            .btn-group-responsive .btn {
                width: 100%;
            }
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .cart-item {
            animation: fadeIn 0.4s ease forwards;
            opacity: 0;
        }

        .cart-item:nth-child(1) { animation-delay: 0.1s; }
        .cart-item:nth-child(2) { animation-delay: 0.2s; }
        .cart-item:nth-child(3) { animation-delay: 0.3s; }
        .cart-item:nth-child(4) { animation-delay: 0.4s; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
            <div class="container">
                <a class="navbar-brand" href="homepage.aspx">
                    <i class="fas fa-book-open"></i> The Reader's Gateway
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkHome" runat="server" NavigateUrl="homepage.aspx" CssClass="nav-link">
                                <i class="fas fa-home"></i> Home
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkBooks" runat="server" NavigateUrl="books.aspx" CssClass="nav-link">
                                <i class="fas fa-book"></i> Books
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item">
                            <asp:HyperLink ID="lnkCart" runat="server" NavigateUrl="Cart.aspx" CssClass="nav-link active">
                                <i class="fas fa-shopping-cart"></i> Cart
                                <span id="cartCount" runat="server" class="badge bg-danger ms-1">0</span>
                            </asp:HyperLink>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user"></i> Account
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li>
                                    <asp:HyperLink ID="lnkratings" runat="server" NavigateUrl="appratings.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-star"></i> App Ratings
                                    </asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="lnknewPublished" runat="server" NavigateUrl="NewPublished.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-book-medical"></i> New Releases
                                    </asp:HyperLink>
                                </li>
                                <li>
                                    <asp:HyperLink ID="lnkaccount" runat="server" NavigateUrl="youraccount.aspx" CssClass="dropdown-item">
                                        <i class="fas fa-user-cog"></i> Your Account
                                    </asp:HyperLink>
                                </li>
                            
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <div class="container">
                <div class="cart-header">
                    <h1><i class="fas fa-shopping-cart me-2"></i>Your Shopping Cart</h1>
                    <p class="text-muted">Review and manage the items in your cart</p>
                </div>

                <asp:Panel ID="pnlCartItems" runat="server">
                    <div class="table-responsive">
                        <table class="table cart-table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                                    <ItemTemplate>

                                        <tr id="row_<%# Eval("BookID") %>" class="cart-item">
                                            <td data-label="Product">
                                                <div class="d-flex align-items-center">
                                                    <img src='<%# Eval("Base64Image") %>' class="book-image me-3" alt='<%# Eval("BookName") %>'>
                                                    <div class="text-start">
                                                        <h6 class="mb-1"><%# Eval("bookname") %></h6>
                                                        
                                                    </div>
                                                </div>
                                            </td>
                                            <td data-label="Price" id="price_<%# Eval("BookID") %>" data-price="<%# Eval("cost") %>">
                                                ₹<%# Eval("cost") %></td>
                                            <td data-label="Quantity">
                                                <input type="number" id="qty_<%# Eval("BookID") %>" 
                                                       value="1" min="1" class="form-control quantity-input"   onchange="updatePrice('<%# Eval("BookID") %>','<%# Eval("cartid") %>')">
                                            </td>
                                            <td data-label="Total" id="total_<%# Eval("BookID") %>" class="book-total">
                                                ₹<%# Eval("cost") %></td>
                                            <td data-label="Action">
              <asp:LinkButton ID="btnRemove" runat="server" 
    CommandName="RemoveBook" 
    CommandArgument='<%# Eval("cartid") %>' 
    CssClass="btn btn-danger btn-sm" 
    OnClientClick='return confirm("Are you sure you want to remove this item?");'
    Text="🗑 Remove" />



            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-lg-8">
                            <div class="d-flex justify-content-between btn-group-responsive">
                                <asp:HyperLink ID="lnkContinueShopping" runat="server" NavigateUrl="books.aspx" CssClass="btn btn-continue">
                                    <i class="fas fa-arrow-left me-2"></i> Continue Shopping
                                </asp:HyperLink>
                               <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout"  CssClass="btn btn-checkout" OnClick="btnCheckout_Click" />
                            </div>
                        </div>
                        <div class="col-lg-4 mt-4 mt-lg-0">
                           <div class="cart-summary">
    <h5 class="summary-title">Cart Summary</h5>
    <div class="summary-item">
        <span>Subtotal:</span>
        <span id="subtotalAmount">₹0.00</span>
    </div>
    <div class="summary-item">
        <span>Shipping:</span>
        <span id="shippingCharge">Free</span>
    </div>
    <div class="summary-item summary-total">
        <span>Total:</span>
        <span id="totalAmount">₹0.00</span>
    </div>
    <asp:HiddenField ID="hdnTotalAmount" runat="server" OnValueChanged="hdnTotalAmount_ValueChanged" />
</div>
                        </div>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false" CssClass="empty-cart">
                    <div class="empty-cart-icon">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                    <h3>Your cart is empty</h3>
                    <p class="text-muted mb-4">Looks like you haven't added any items to your cart yet</p>
                    <asp:HyperLink ID="lnkBrowseBooks" runat="server" NavigateUrl="books.aspx" CssClass="btn btn-primary">
                        <i class="fas fa-book me-2"></i> Browse Books
                    </asp:HyperLink>
                </asp:Panel>
            </div>
        </main>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start">
                        <p>&copy; 2025 The Reader's Gateway. All rights reserved.d-start">
                        <p>&copy; 2025 The Reader's Gateway. All rights reserved.</p>
                    </div>
                   
                </div>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            const MAX_CART_ITEMS = 3;
            // Initialize tooltips
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl)
            });
            function updateShippingCharges(isFirstOrder) {
                const shippingChargeElement = document.getElementById("shippingCharge");
                const totalAmountElement = document.getElementById("totalAmount");
                const subtotalAmountElement = document.getElementById("subtotalAmount");

                // Get the subtotal from the UI
                const subtotal = parseFloat(subtotalAmountElement.innerText.replace("₹", ""));

                if (isFirstOrder) {
                    // First order: Free shipping
                    shippingChargeElement.innerText = "Free";
                    totalAmountElement.innerText = "₹" + subtotal.toFixed(2);
                } else {
                    // Subsequent orders: Add ₹65 as shipping charges
                    const shippingCharges = 65;
                    shippingChargeElement.innerText = "₹" + shippingCharges.toFixed(2);
                    totalAmountElement.innerText = "₹" + (subtotal + shippingCharges).toFixed(2);
                }

                // Call updateTotal to reflect changes on the frontend
                updateTotal();
            }
            // Update cart totals
            function updateTotal() {
                let subtotal = 0;
                let itemCount = 0;

                document.querySelectorAll(".cart-item").forEach(function (item) {
                    const qtyInput = item.querySelector("input[type='number']");
                    const qty = parseInt(qtyInput.value);
                    const price = parseFloat(item.querySelector("td[data-price]").dataset.price);
                    const total = qty * price;

                    item.querySelector(".book-total").innerText = "₹" + total.toFixed(2);
                    subtotal += total;
                    itemCount++;
                });

                const total = subtotal.toFixed(2);
                document.getElementById("subtotalAmount").innerText = "₹" + total;
                document.getElementById("totalAmount").innerText = "₹" + total;
                document.getElementById("<%= hdnTotalAmount.ClientID %>").value = total;

                // Update cart count badge
                document.getElementById("cartCount").innerText = itemCount;

                // Check cart limit
                if (itemCount > MAX_CART_ITEMS) {
                    alert("You can only have a maximum of 3 different items in your cart.");
                    return false;
                }

                return true;
            }

            // Update price when quantity changes
            function updatePrice(bookId, cartId) {
                // Get the current quantity from the input element
                let qty = parseInt(document.getElementById("qty_" + bookId).value);
                let price = parseFloat(document.getElementById("price_" + bookId).dataset.price);
                let total = (qty * price).toFixed(2);

                // Update the total price on the frontend
                document.getElementById("total_" + bookId).innerText = "₹" + total;

                // Update the backend with the new quantity
                updateCartQuantity(cartId, qty);
                updateTotal();
            }

            function updateCartQuantity(cartID, newQuantity) {
                // Backend update logic
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "Cart.aspx/UpdateCartQuantity", true);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        console.log("Quantity updated successfully in the backend.");
                    }
                };
                xhr.send(JSON.stringify({ cartID: cartID, newQuantity: newQuantity }));
            }


            // Remove book from cart
            function removeBook(rowId) {
                if (confirm("Are you sure you want to remove this item from your cart?")) {
                    const row = document.getElementById(rowId);
                    row.classList.add("animate__animated", "animate__fadeOut");

                    setTimeout(() => {
                        row.remove();
                        updateTotal();

                        // Show empty cart message if no items left
                        if (document.querySelectorAll(".cart-item").length === 0) {
                            document.getElementById("pnlCartItems").style.display = "none";
                            document.getElementById("pnlEmptyCart").style.display = "block";
                        }
                    }, 300);
                }
            }

            function removeCartItem(bookID) {
                var item = document.getElementById("cart-item-" + bookID);
                if (item) {
                    item.remove();
                    updateCartSummary(); // Optional: Update total after removal
                }
            }


            // Initialize totals on page load
            document.addEventListener("DOMContentLoaded", function () {
                if (!updateTotal()) {
                    // Hide checkout button if limit exceeded on load
                    document.getElementById("btnCheckout").disabled = true;
                }
            });
        </script>
    </form>
</body>
</html>