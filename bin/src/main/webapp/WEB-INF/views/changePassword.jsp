<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/tablib.jsp"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<style>

</style>
<%@include file="/WEB-INF/views/user/header/head.jsp"%>


<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
	<section class="module">
				<div class="container">
					<div class="row">
					<h2 style="position:relative; text-align: center; top: -40px;">Change password</h2>
						<form:form action="user/changePassword/success.htm" modelAttribute="user" method="post">
							<div class="col-sm-3">
							</div>
							<div class="col-sm-6">
								<input name="id" type="hidden" id="id" value="${user.users_id}">
								<div class="form-group">
									<label>Enter current password</label>
									<input class="form-control" name="oldPassword" type="password" id="oldPassword"/>
								</div>
								<div class="form-group">
									<label>Enter neww password</label>
									<input class="form-control" name="newPassword" type="password" id="newPassword"/>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-lg btn-block btn-round btn-b">Change password</button>
								</div>
							</div>
							
							
							
						</form:form>
					</div>
					<div class="row">
								<c:if test="${message != null}">
									<div class="col-sm-3"></div>
									<div class="alert alert-danger col-sm-6" style="text-align:center">
									 	<strong>${message}</strong>
									</div>
									<div class="col-sm-3"></div>
								</c:if>
					</div>
				</div>
			</section>
		<%@include file="/WEB-INF/views/user/header/header.jsp"%>
		<div class="main">
		
		
		<%@include file="/WEB-INF/views/user/footer/footer.jsp"%>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    
	<%@include file="/WEB-INF/views/user/js/js.jsp"%>
</body>
</html>