<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@  taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert product</title>
<base href="${pageContext.servletContext.contextPath}/">
</head>
<body>
<h3>Add product</h3>
<h3>${message}</h3>
	<div class="container">
	<form:form cssClass="form-group" action="admin/product/add.htm" modelAttribute="productDTO" enctype="multipart/form-data">
		<label for="product_name">Name: </label>
		<form:input cssClass="form-control" path="product_name" required="required" />
		
		
		<label for="product_price">Price: </label>
		<form:input cssClass="form-control" path="product_price"/>
		
		<label for="product_discount">Discount: </label>
		<form:input cssClass="form-control" path="product_discount" required="required" />
		<label for="product_detail">Detail: </label>
		<form:input cssClass="form-control" path="product_detail" required="required" />
		<label for="product_quantity">Quantity: </label>
		<form:input cssClass="form-control" path="product_quantity" required="required" />
		
		<%-- <label for="product_images">Images: </label>
		<form:input cssClass="form-control" path="product_images" required="required" /> --%>
		<label for="categoryID">Category: </label>
		
			<select class="form-control" name="categoryID" id="categoryID" required="required">
				<option value="">-----Select-----</option> 
			<c:forEach var="category" items="${category}">
                <option value="${category.category_id}">${category.category_name}</option>                          
            </c:forEach>     
            </select>
		<br>
			
                <p>Hình ảnh</p>
                <div class="custom-file">
                    <input type="file"  class="custom-file-input" name="image" accept="image/"/>
                    <label class="custom-file-label" for="product_images">Choose file</label>
                </div>
                
                
            
		<div>
		<br>
			<form:button type="submit" class="btn btn-primary">Inserts</form:button>
		</div>
		
	</form:form>
<script type="text/javascript">
    function readURL(input){
        if(input.files && input.files[0]){
            var reader = new FileReader();
            reader.onload = function(e){
                $('#imgPreview').attr('src', e.target.result).width(100).height(100);
            }
            reader.readAsDataURL(input.files[0])
        }
    }
    $('#productImage').change(function(){
        readURL(this);
    });
    $(".custom-file-input").on("change", function() {
        var fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });
</script>	

</div>
</body>
</html>