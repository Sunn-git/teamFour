<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
    Review 4 Book
  </title>
  <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/material-kit.css?v=2.0.7" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />


</head>
<body>
<body class="profile-page sidebar-collapse">
  <nav class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg" color-on-scroll="100" id="sectionsNav">
    <div class="container">
      <div class="navbar-translate">
        <a class="navbar-brand" href="Main.book">
          R4B </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="sr-only">Toggle navigation</span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
          <span class="navbar-toggler-icon"></span>
        </button>
      </div>
      <div class="collapse navbar-collapse">
        <div class="collapse navbar-collapse">
        	<form class="form-inline ml-auto">
            	<div class="form-group has-rose">
            		<input type="text" class="form-control" placeholder="도서 검색하기 :)" style="width:480px;">
            	</div>
                  	<button type="submit" class="btn btn-rose btn-raised btn-fab btn-round" style="margin-left:8px;">
                    <i class="material-icons">search</i>
                </button>
            </form>
            <ul class="navbar-nav ml-auto">
            	<li class="dropdown nav-item">
            		<a href="javascript:;" class="profile-photo dropdown-toggle nav-link" data-toggle="dropdown">
            			<div class="profile-photo-small">
                        	<img src="./assets/img/faces/avatar.jpg" alt="Circle Image" class="rounded-circle img-fluid">
                      	</div>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right">
                      <h6 class="dropdown-header">누구누구님 반갑습니다 :)</h6>
                      <a href="InfoEdit.book" class="dropdown-item">내 도서함</a>
                      <a href="javascript:;" class="dropdown-item">내 계정 관리</a>
                      <a href="javascript:;" class="dropdown-item">로그아웃</a>
                    </div>
            	</li>
        	</ul>
      </div>
    </div>
  </nav>
  <div class="page-header header-filter" data-parallax="true" style="background-image: url('../assets/img/city-profile.jpg');"></div>
  <div class="main main-raised">
    <div class="profile-content">
      <div class="container">
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
          <form action="">
            <div class="profile">
              <div class="avatar">
              	<div class="card-img-overlay">
                	<img src="${pageContext.request.contextPath}/assets/img/faces/christian.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid card-img">
              	</div>
              	<button class="btn btn-rose btn-fab btn-round" id="user-image" style = "padding-left:-20px; margin: 60px 0 0 100px;"><i class="material-icons">edit</i></button>
              </div>
              <div class="row" style="margin-top:60px;">
              <div class="col-md-8 m-auto">
              	<div class ="card card-body m-auto" align="left" style = "padding-left:28px; padding-right:28px;">	
	            	<label class="mt-4">이름</label>
	            	<div class="form-group has-rose">
	            	<input type="text" id="user-name" value="Christian Louboutin" class="form-control">
	            	</div>
	            	<label class="mt-4">아이디</label>
	            	<div class="form-group has-rose">
	            	<input type="text" id="user-id" value="thumbji" class="form-control" readonly>
	            	</div>
	            	<label class="mt-4">비밀번호</label>
	            	<div class="form-group has-rose">
	            	<input type="text" id="user-pwd" value="" class="form-control">
	            	</div>
	            	<label class="mt-4">비밀번호 확인</label>
	            	<div class="form-group has-rose">
	            	<input type="text" id="user-pwdCheck" value="" class="form-control">
	            	</div>
	            	<label class="mt-4">이메일</label>
	            	<div class="form-group has-rose">
	            	<input type="text" id="user-email" value="abc@abc.com" class="form-control">
	            	</div>
	            	<button class="btn btn-round btn-rose mt-4 mb-4">수정하기</button>
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
  </div>
  <footer class="footer footer-default">
    <div class="container">
      <nav class="float-left">
        <ul>
          <li>
            <a href="https://www.creative-tim.com/">
              Creative Tim
            </a>
          </li>
          <li>
            <a href="https://www.creative-tim.com/presentation">
              About Us
            </a>
          </li>
          <li>
            <a href="https://www.creative-tim.com/blog">
              Blog
            </a>
          </li>
          <li>
            <a href="https://www.creative-tim.com/license">
              Licenses
            </a>
          </li>
        </ul>
      </nav>
      <div class="copyright float-right">
        &copy;
        <script>
          document.write(new Date().getFullYear())
        </script>, made with <i class="material-icons">favorite</i> by
        <a href="https://www.creative-tim.com/" target="_blank">Creative Tim</a> for a better web.
      </div>
    </div>
  </footer>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap-material-design.min.js" type="text/javascript"></script>
  <script src="${pageContext.request.contextPath}/assets/js/plugins/moment.min.js"></script>
  <!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-datetimepicker.js" type="text/javascript"></script>
  <!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/nouislider.min.js" type="text/javascript"></script>
  <!--  Google Maps Plugin    -->
  <!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/assets/js/material-kit.js?v=2.0.7" type="text/javascript"></script>
  <script>
    $(document).ready(function() {
      //init DateTimePickers
      materialKit.initFormExtendedDatetimepickers();

      // Sliders Init
      materialKit.initSliders();

    });


    function scrollToDownload() {
      if ($('.section-download').length != 0) {
        $("html, body").animate({
          scrollTop: $('.section-download').offset().top
        }, 1000);
      }
    }
  </script>
</body>
</html>