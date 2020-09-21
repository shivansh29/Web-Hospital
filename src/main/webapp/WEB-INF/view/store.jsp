<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
    <head>
        <title>Medicine | Store</title>
        <meta name="description" content="This is the description">
        <link rel="stylesheet" href="resources\\styles.css" />
		<script src="resources\\store.js" async></script>
    </head>
    <body>
        <header class="main-header">
            <nav class="main-nav nav">
                <ul>
                    <li><a href="/home">HOME</a></li>
                    <li><a href="/Shopping">STORE</a></li>
                    <li><a href="">ABOUT</a></li><!-- To be Removed-->
                </ul>
            </nav>
            <h1 class="band-name band-name-large" style="font-family:time new roman;font-size:100px;"><i>The Store</i></h1>
        </header>
        <section class="container content-section">
            <h2 class="section-header" style="font-family:time new roman;">Drugs/Medicine</h2>
            <div class="shop-items">
            
                <c:forEach var="emp" items="${list}">
                <c:if test="${emp.getPrescription().equalsIgnoreCase('no')}">
                <div class="shop-item">
                    <span class="shop-item-title">${emp.getName()}</span>
                    <img class="shop-item-image" src="resources//${emp.getURL()}" />
                    <div class="shop-item-details">
                        <span class="shop-item-price">${emp.getPrice()}</span>
                        <button class="btn btn-primary shop-item-button" type="button">ADD TO CART</button>
                    </div>
                </div>
                </c:if>
                </c:forEach>
               
            </div>
        </section>
        <section class="container content-section">
            <h2 class="section-header" style="font-family:time new roman;">CART</h2>
            <div class="cart-row">
                <span class="cart-item cart-header cart-column">ITEM</span>
                <span class="cart-price cart-header cart-column">PRICE</span>
                <span class="cart-quantity cart-header cart-column">QUANTITY</span>
            </div>
            <div class="cart-items">
                
            </div>
            <div class="cart-total">
                <strong class="cart-total-title">Total</strong>
                <span class="cart-total-price">Rs0</span>
            </div>
            <button class="btn btn-primary btn-purchase" type="button">PURCHASE</button>
        </section>
        <footer class="main-footer">
            <div class="container main-footer-container">
                <h3 class="band-name" style="font-family:time new roman;">The Store</h3>
                <ul class="nav footer-nav">
                    <li>
                        
                    </li>
                    <li>
                        
                    </li>
                    <li>
                        
                    </li>
                </ul>
            </div>
        </footer>
    </body>
</html>