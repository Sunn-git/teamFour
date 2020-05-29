<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>Register</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath}/assets/css/material-kit.css?v=2.0.7"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="${pageContext.request.contextPath}/assets/demo/demo.css"
	rel="stylesheet" />


</head>
<body class="register-page sidebar-collapse">
	<div class="page-header header-filter"
		style="background-image: url('${pageContext.request.contextPath}/assets/img/bg7.jpg'); background-size: cover; background-position: top center;">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6 ml-auto mr-auto">
					<div class="card card-login">
						<form id="fileUpload" enctype="multipart/form-data" class="form" method="post" action="RegisterAction.user">
							<div class="card-header card-header-rose text-center">
								<h4 class="card-title">Register</h4>
							
							</div>

							<div class="card-body">
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">perm_identity</i>
										</span>
									</div>
									<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디">
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">lock_outline</i>
										</span>
									</div>
									<input type="password" id="user_pwd" name="user_pwd"  class="form-control" placeholder="비밀번호">
								</div>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">lock</i>
										</span>
									</div>
									<input type="password" id="user_pwdCheck" name="user_pwdCheck"  class="form-control"
										placeholder="비밀번호 확인">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">face</i>
										</span>
									</div>
									<input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름">
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">email</i>
										</span>
									</div>
									<input type="email" id="user_email" name="user_email"  class="form-control"
										placeholder="이메일 주소">
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">profile</i>
										</span>
									</div>
									<input type="file" id="user_image" name="user_image"  class="form-control">
								</div>




								<div class="row">
									<div class="col-md-9 ml-auto mr-4 mt-4 mb-4">
										<input class="btn btn-white btn-round" type="reset" value="입력취소">
										<input class="btn btn-rose btn-round" type="submit" id="submit" value="회원가입"> 
									</div>
								</div>
							</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>


	<!--   Core JS Files   -->
	<script src="../assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="../assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="../assets/js/core/bootstrap-material-design.min.js"
		type="text/javascript"></script>
	<script src="../assets/js/plugins/moment.min.js"></script>
	<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
	<script src="../assets/js/plugins/bootstrap-datetimepicker.js"
		type="text/javascript"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="../assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Google Maps Plugin    -->
	<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
	<script src="../assets/js/material-kit.js?v=2.0.7"
		type="text/javascript"></script>
</body>
</html>