<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<%@include file="/WEB-INF/views/user/header/head.jsp"%>

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>

		<%@include file="/WEB-INF/views/user/header/header.jsp"%>

		<div class="main">
			<!--  <section class="module module-video bg-dark-30"
				data-background="assets/images/shop/itt.png">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h1 class="module-title font-alt mb-0">Login-Register</h1>
						</div>
					</div>
				</div>
				<!--  <video width="1345" height="374" controls autoplay="true">
					<source src="assets/video/Hi-Tech.mp4" type="video/mp4">
					https://www.youtube.com/watch?v=oKYW5gKeOWc
				</video>
			<div class="video-player"
				data-property="{videoURL:'https://www.youtube.com/watch?v=Im7slkFMtI8', containment:'.module-video', startAt:3, mute:true, autoPlay:true, loop:true, opacity:1, showControls:false, showYTLogo:false, vol:25}"></div>
			</section>-->
			<section class="module">
				<div class="container">
					<div class="row">
						<div class="col-sm-5 col-sm-offset-1 mb-sm-40">

							<h4 class="font-alt">Login</h4>
							<hr class="divider-w mb-10">
							<form action="login.htm" method="post" class="form">
								<div class="form-group">
									<input class="form-control" id="username" type="tel"
										name="username_login" placeholder="Username"  pattern="[0]{1}[0-9]{9}" required />
								</div>
								<div class="form-group">
									<input class="form-control" id="password" type="password"
										name="password_login" placeholder="Password" required />
								</div>
								<div class="form-group">
									<button class="btn btn-round btn-b">Login</button>
								</div>
								<div class="form-group">
									<a href="forgetpass.htm">Forgot Password?</a>
								</div>

								<!-- khi đăng nhập sai mới hiện status -->
								<c:if test="${ not empty Status_login }">
									<div class="alert alert-danger" role="alert">
										<button class="close" type="button" data-dismiss="alert"
											aria-hidden="true">&times;</button>
										<i class="fa fa-cog fa-spin"></i><strong>${ Status_login }</strong>
									</div>
								</c:if>

							</form>
						</div>
						<div class="col-sm-5">
							<h4 class="font-alt">Register</h4>
							<hr class="divider-w mb-10">
							<form class="form" action="register.htm" method="get">
								<div class="form-group">
								<div class="form-group">
									<input class="form-control" id="sdt" type="tel"
										name="sdt_register" placeholder="Số điện thoại" pattern="[0]{1}[0-9]{9}" required />
								</div>
								<div class="form-group">
									<input class="form-control" id="password" type="password"
										name="password_register" placeholder="Password" required />
								</div>
							
								<div class="form-group">
									<input class="form-control" id="name" type="text"
										name="name_register" placeholder="Họ và tên" required />
								</div>
							<div class="form-group">
									<input class="form-control" id="address" type="text"
										name="address_register" placeholder="Địa chỉ" required />
								</div>
								<div class="form-group">
									<input type="radio" class="active" id="male" name="gender_register" value="1" checked>
									<label for="male">NAM</label> 
									<input type="radio" id="female" name="gender_register" value="0"> 
									<label for="female">NỮ</label>
									<br>
								</div>
								<!-- <div class="form-group">
									<input class="form-control" id="re-password" type="password"
										name="re-password" placeholder="Re-enter Password" />
								</div> -->
								<div class="form-group">
									<button class="btn btn-block btn-round btn-b">Register</button>
								</div>
								<c:if test="${ not empty message_register_fail }">
									<div class="alert alert-danger" role="alert">
										<button class="close" type="button" data-dismiss="alert"
											aria-hidden="true">&times;</button>
										<i class="fa fa-cog fa-spin"></i><strong>${ message_register_fail }</strong>
									</div>
								</c:if>
								<c:if test="${ not empty message_register_success }">
									<div class="alert alert-success" role="alert">
										<button class="close" type="button" data-dismiss="alert"
											aria-hidden="true">&times;</button>
										<i class="fa fa-cog fa-spin"></i><strong>${ message_register_success }</strong>
									</div>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</section>

			<%@include file="/WEB-INF/views/user/footer/footer.jsp"%>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<%@include file="/WEB-INF/views/user/js/js.jsp"%>
</body>
</html>