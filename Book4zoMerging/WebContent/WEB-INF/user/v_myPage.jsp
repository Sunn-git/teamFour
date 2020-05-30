<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
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


     <!-- 리디 폰트-->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&amp;display=swap&amp;subset=korean"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto:500,700&amp;display=swap&amp;text=1234567890,/%"
        rel="stylesheet">

        <!-- 핵심 CSS -->
    <link href="https://select.ridicdn.net/app.a00239db55301aa1cd30.css" rel="stylesheet">
	

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
                      <h6 class="dropdown-header">${param.userId}님 반갑습니다 :)</h6>
                      <a href="Mypage.book" class="dropdown-item">내 도서함</a>
                      <a href="InfoEdit.book" class="dropdown-item">내 계정 관리</a>
                      <a href="javascript:;" class="dropdown-item">로그아웃</a>
                    </div>
            	</li>
        	</ul>
      </div>
    </div>
  </nav>


  <div class="page-header header-filter" data-parallax="true" style="background-image: url('../assets/img/city-profile.jpg');">
  </div>


  <div class="main main-raised">
    <div class="profile-content">
      <h3>${param.userId} 님의 소중한 책장</h3>
      <div class="container">

        <!-- 프로필 영역 -->
        <div class="row">
          <div class="col-md-6 ml-auto mr-auto">
            <div class="profile">
              <div class="avatar">
                <img src="${pageContext.request.contextPath}/assets/img/faces/christian.jpg" alt="Circle Image" class="img-raised rounded-circle img-fluid">
              </div>
              <div class="name">
                <h3 class="title">Christian Louboutin</h3>
              </div>
            </div>
          </div>
        </div>


        <!-- 탭 아이콘 영역 -->
        <div class="row">
          <div class="col-md-8 ml-0">
            <div class="profile-tabs">
              <ul class="nav nav-pills nav-pills-icons justify-content-center" role="tablist">
              	<li class="nav-item">
                  <a class="nav-link active" href="#favorite" role="tab" data-toggle="tab">
                    <i class="material-icons">favorite</i> 찜목록
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#post" role="tab" data-toggle="tab">
                    <i class="material-icons">camera</i> 포스트
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#reply" role="tab" data-toggle="tab">
                    <i class="material-icons">palette</i> 내 댓글
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>

        
        <!-- 탭 컨텐츠 영역 -->
        <div class="tab-content tab-space">

          <!-- 찜목록 영역 -->
          <div class="tab-pane active text-center gallery" id="favorite">
            <div class="row">
              <div class="col-md-8 m-auto">
              	<div class ="card card-body">
              		<div class="mydipsbooks row mt-3">
              			<div class="col-md-3">
	              			<a href="Detail.book"><img class="dipsbook" src="${pageContext.request.contextPath}/assets/img/nodab.jpg" style="width:140px; margin:0 8px 0 8px;"></a>
	              			<h5>책제목</h5>
              			</div>
              			<div class="col-md-3">
	              			<a href="Detail.book"><img class="dipsbook" src="${pageContext.request.contextPath}/assets/img/nodab.jpg" style="width:140px; margin:0 8px 0 8px;"></a>
	              			<h5>책제목</h5>
              			</div>
              			<div class="col-md-3">
	              			<a href="Detail.book"><img class="dipsbook" src="${pageContext.request.contextPath}/assets/img/nodab.jpg" style="width:140px; margin:0 8px 0 8px;"></a>
	              			<h5>책제목</h5>
              			</div>
              			<div class="col-md-3">
	              			<a href="Detail.book"><img class="dipsbook" src="${pageContext.request.contextPath}/assets/img/nodab.jpg" style="width:140px; margin:0 8px 0 8px;"></a>
	              			<h5>책제목</h5>
              			</div>
              		</div>
              	</div>
              </div>
            </div>
          </div>


          <!-- 내 포스트 목록 영역 -->
   
          <div class="tab-pane text-center gallery" id="post">
          
          	<c:forEach var="post" items="${requestScope.postList}">
          	 <c:forEach var="book" items="${requestScope.bookList}">
          	 <c:if test="${post.book_seq == book.bookSeq}">
            <div class="row">
              <div class="col-md-8 m-auto">
              	<div class ="card card-body" onclick="location.href='PostDetailView.post?post_seq=${post.post_seq}';">
              		<div class="mydipsbooks row mt-3">
              			<div class="col-md-3 mb-4">
							<a href="Detail.book?bookSeq=${post.book_seq}">
              					<img class="dipsbook" src="${book.coverUrl}" alt="${book.title}" style="width:140px; margin:0 8px 0 8px;">
           					</a>
						</div>
              			<div class="col-md-9" align="left">
              				<span>${book.title}</span> - <span>저자 ${book.author}</span>
              				<h3>${post.post_title}</h3>
              				<p>${post.post_contents}</p>
              			</div>
              		</div>
				</div>
              </div>
            </div>
            </c:if>
            </c:forEach>
            </c:forEach>
          </div>

          <!-- 내 댓글 영역 -->
          <div class="tab-pane text-center gallery" id="reply">
            <div class="row">
              <div class="col-md-8 m-auto">
              	<div class ="card card-body">
              		<a href="#">
              		<div class="mydipsbooks row mt-2">
              			<div class="col-md-2 mb-3" style="padding:0;">
	              			<a href="#"><img class="dipsbook" src="${pageContext.request.contextPath}/assets/img/nodab.jpg" style="width:60px; margin:0 8px 0 8px;"></a>
	            
              			</div>
              			<div class="col-md-9" align="left">
              				<span>책제목</span> - <span>저자</span>
              				<p>아~~~~~~~~댓글란인데 아직 안했다~~~~선언니꺼랑 합치면서 수정해야한다!</p>
              				<button class="btn btn-rose btn-link btn-round">
                				<i class="material-icons">favorite</i> 받은 좋아요 수 10개
             				</button>
              			</div>
              		</div>
              		</a>
              	</div>
              </div>
            </div>
          </div>


        </div>
        <!-- 탭 컨텐츠 end -->



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