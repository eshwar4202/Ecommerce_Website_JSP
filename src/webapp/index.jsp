<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="ecommerce.connection.DBcon"%>
<%@page import="ecommerce.model.*"%>
<%@page import="java.util.*"%>
<%@page import="ecommerce.dao.*"%>
<%@page import="ecommerce.dao.userdao"%>
<%@page import="ecommerce.servlet.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DBcon.getconnection()); 
List<Product> products = pd.getAllProducts();
Product pr = new Product();
List<Product> book = pd.FilterProducts(pr.getFilter());
%>

<!DOCTYPE html>
<html>
<head>
<%@include file = "includes/head.jsp" %>
<title>welcome</title>
<style>
	#banner{
		top:10px;
		height:100px;
	}
	.one{
		position: relative;
		top:-5px;
		left:90px;
		padding:30px;
	}
	.two{
		position: relative;
		top:130px;
		left:120px;
		z-index:2;
		padding-right:70px;
		font-weight:bold;
	}
</style>
</head>
<body>
<%@include file = "includes/navbar.jsp" %>
	<div class="navbar navbar-expand-lg navbar-light" id = "two">
		<p class="two">Electronics</p><hr>
		<p class="two">furniture</p>
		<p class="two">Clothing</p>
	</div>
    <div class="navbar navbar-expand-lg navbar-light bg-light" id="banner">
    	<img src="https://rukminim1.flixcart.com/flap/80/80/image/69c6589653afdb9a.png?q=100" class = "one"/>
    	<img src="https://rukminim1.flixcart.com/flap/80/80/image/ab7e2b022a4587dd.jpg?q=100" class = "one"/>
    	<img src="https://rukminim1.flixcart.com/fk-p-flap/80/80/image/0d75b34f7d8fbcb3.png?q=100" class = "one"/>
    </div>
   
		<%
		if (!book.isEmpty()) {
			for (Product p : book) {
%>
		 <div class="container">
	<div class="card-header my-3">Filtered</div>
	<div class="row">
		<div class="col-md-3 my-3">
			<div class="card w-100">
				<img class="card-img-top" src="product-image/<%=p.getImage() %>"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title"><%=p.getName() %></h5>
					<h6 class="price">Price: $<%=p.getPrice() %></h6>
					<h6 class="category">Category: <%=p.getCategory() %></h6>
					<div class="mt-3 d-flex justify-content-between">
						<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
							class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
					</div>
				</div>
			</div>
		</div>
		

	</div>
</div>
    
<%}
}else{%>

<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="product-image/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>
	<%} %>
<%@include file = "includes/footer.jsp" %>
</body>
</html>