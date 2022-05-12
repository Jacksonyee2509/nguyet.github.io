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

							<h4 class="font-alt">Forget Password</h4>
							<hr class="divider-w mb-10">
							<form action="forgetpass.htm" method="post" class="form">
								<div class="form-group">
									<input class="form-control" id="username" type="email"
										name="username_login" placeholder="Username" required />
								</div>
								<div class="form-group">
									<button class="btn btn-round btn-b">Kiểm tra</button>
								</div>
								<c:if test="${ not empty checkuser }">
									<div class="alert alert-danger" role="alert">
										<button class="close" type="button" data-dismiss="alert"
											aria-hidden="true">&times;</button>
										<i class="fa fa-cog fa-spin"></i><strong>${ checkuser }</strong>
									</div>
								</c:if>
								<c:if test="${ not empty message_mail }">
									<div class="alert alert-danger" role="alert">
										<button class="close" type="button" data-dismiss="alert"
											aria-hidden="true">&times;</button>
										<i class="fa fa-cog fa-spin"></i><strong>${ message_mail }</strong>
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