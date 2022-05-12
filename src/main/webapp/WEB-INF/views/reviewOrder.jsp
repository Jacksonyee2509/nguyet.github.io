<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<%@include file="/WEB-INF/views/user/header/head.jsp"%>

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>

		<%@include file="/WEB-INF/views/user/header/header.jsp"%>
		<div class="main">
		<section class="module">
			<img style="max-height:150px; position:relative; left:700px; top:-60px; margin:auto;" src="assets\images\success-icon-10.png"/>
		
		<div class="card text-center">
		  <div class="card-header">
		  <hr>
		    <h2>Đặt hàng thành công</h2>
		  </div>
		  <div class="card-body">
		    <h4 class="card-title">Xin cảm ơn <strong>${name}</strong> đã mua hàng tại shop!</h4>
		    <p style="font-size: 18px;" class="card-text">Đơn hàng sẽ được giao đến địa chỉ <strong>${address }</strong> trong vòng 7 ngày.</p>
		    <p style="font-size: 18px;" class="card-text"> Vui lòng kiểm tra số điện thoại <strong><i>${phone}</i></strong> và email <strong><i>${email}</i></strong> để shipper có thể liên lạc.</p>
		    <h5>Ghi chú: ${note} </h5>
		    <br>
		    <a href="index.htm" class="btn btn-lg  btn-round btn-b">Continue shopping</a>
		  </div>
		  <div class="card-footer text-muted">
		    <h4>Best regard!</h4>
		    
		  </div>
		</div>
		
		
		
	<%@include file="/WEB-INF/views/user/footer/footer.jsp"%>
		
		
			
	</section>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<%@include file="/WEB-INF/views/user/js/js.jsp"%>
</body>
</html>