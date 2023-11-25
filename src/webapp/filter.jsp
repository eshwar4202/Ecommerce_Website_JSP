<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="ecommerce.dao.ProductDao"%>
    <%@page import="ecommerce.model.*"%>
    List<Product> filter = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DBcon.getconnection());
	cartProduct = pDao.getCartProducts(cart_list);
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>