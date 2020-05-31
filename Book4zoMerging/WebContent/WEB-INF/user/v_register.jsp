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

	<style>
		*{
			border : 1px solid lightgray;
		}
	</style>

<script>
      $(document).ready(function() {
        var re_id = /^[a-z0-9]{5,12}$/;  //아이디 정규표현
        var re_name = /^[가-힣][가-힣]+$/;  //이름 한글만 두글자 이상
        var re_pwd = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,20}$/; // 비번
        //8~20자의 영문,숫자 사이에 적어도 하나의 영어대문자,특수문자가 포함돼야함
 
        function regCheck(inputId, reg) {
            
        let divId = "#" + $(inputId).parent().next().children('div').attr('id');
        // parameter로 받은 inputId로 divId 가져오기
            $(inputId).on({
                keyup : function() {
                    if(inputId != '#user_pwdCheck'){
                        if(!(reg.test($(inputId).val()))){
                            $(divId).text('형식에 맞지 않습니다.');
                            $(divId).css("color", "tomato");
                        }else{
                            $(divId).text('올바른 형식입니다.');
                            $(divId).css("color", "green");
                        }
                    }else{
                        if($(inputId).val() != $('#userPass').val()){
                            $(divId).text('비밀번호가 일치하지 않습니다.');
                            $(divId).css("color", "tomato");
                        }else{
                            $(divId).text('비밀번호가 일치합니다.');
                            $(divId).css("color", "green");
                        }
                    }
                },
                change : function() {
                    if(inputId != '#user_pwdCheck'){
                        if(!(reg.test($(inputId).val()))){
                            $(inputId).val("");
                        }
                    }else{
                        if($(inputId).val() != $('#userPass').val()){
                            $(inputId).val("");
                        }
                    }
                }
            });
        }
        // vaildation 함수
 
        regCheck("#user_id", re_id);
        // id 검증
        regCheck("#user_name", re_name);
        // id 검증
        regCheck("#user_pwd", re_pwd);
        // pwd 검증
        regCheck("#user_pwdCheck", re_pwd);
        // pwdcheck 검증

      });
  </script>

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
									<input type="text" id="user_id" name="user_id" class="form-control" placeholder="아이디" required>
								
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">lock_outline</i>
										</span>
									</div>
									<input type="password" id="user_pwd" name="user_pwd"  class="form-control" placeholder="비밀번호" required>
								</div>

								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">lock</i>
										</span>
									</div>
									<input type="password" id="user_pwdCheck" name="user_pwdCheck"  class="form-control"
										placeholder="비밀번호 확인" required>
									<div id="pwdCheck_result"></div>
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">face</i>
										</span>
									</div>
									<input type="text" id="user_name" name="user_name" class="form-control" placeholder="이름" required>
								</div>
								
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">email</i>
										</span>
									</div>
									<input type="email" id="user_email" name="user_email"  class="form-control"
										placeholder="이메일 주소" required>
								</div>
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i
											class="material-icons">profile</i>
										</span>
									</div>
									<div class="btn btn-link btn-round btn-fab"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill="none" d="M0 0h24v24H0z"/><path d="M2 3.993A1 1 0 0 1 2.992 3h18.016c.548 0 .992.445.992.993v16.014a1 1 0 0 1-.992.993H2.992A.993.993 0 0 1 2 20.007V3.993zM4 5v14h16V5H4zm8 10a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm0 2a5 5 0 1 1 0-10 5 5 0 0 1 0 10zm5-11h2v2h-2V6z"/></svg>
											</div>
									<input type="file" id="user_image" name="user_image"  class="form-control" >
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
	<script type="text/javascript">
		$("#user_pwdCheck").keyup(function(){
			console.log("keyup후 function작동")
			if($('#user_pwdCheck').val() == $('#user_pwd').val()){
				$('#pwdCheck_result').html("<p style='color:green;'>입력하신 비밀번호가 일치합니다.</p>");
			}else{
				$('#pwdCheck_result').html("<p style='color:green;'>입력하신 비밀번호가 일치하지 않습니다.</p>");
				
			}
		});
	</script>	
</body>
</html>