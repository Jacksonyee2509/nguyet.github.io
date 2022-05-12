<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Product</h2>
	<form action="addToCart.htm" method="post">
	<input style="border:none" type="text" id="product_id" name="product_id" value="${productsingle.product_id}">
	<h3>${productsingle.product_name}</h3>
	<h3>${productsingle.product_price}</h3>
	<div>
		<input type="number" name="quantity"
			value="1" max="40" min="1" required="required" />
	</div>
	<div>
		<button type="submit">Add to cart</button>
		</div>
	</form>
</body>
</html>