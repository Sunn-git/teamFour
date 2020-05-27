<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
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
<c:set var="user_id" value="${sessionScope.user_id}"/>
<header>
<c:choose>
	<c:when test="${user_id != null}">
		<c:choose>
			<c:when test="${user_id == 'admin'}">
				<jsp:include page="/WEB-INF/common/v_navAdmin.jsp"/>
			</c:when>
			<c:otherwise>
				<jsp:include page="/WEB-INF/common/v_navMember.jsp"/>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/common/v_navNonmember.jsp"/>
	</c:otherwise>
</c:choose>
</header>
<div class="header" style="height:240px; background-color:#b8a7a7; color : white; padding-top: 120px;">
	<div class="container">
	<h2 style="margin:0;">Review 4 Book과 함께하는 독서 이야기</h2>
	<p>rakaskdf asdfasdfqlsdfjasd qwdfjs qwsd fs dfa sd wdfas dfasdfa asdfqwdf sf</p>
	</div>
</div>
<div class="container">
<div class="card card-body">
<form action="" class="">
    <label for="exampleFormControlSelect1">카테고리</label>
<div class="form-group has-rose row" style="padding-top:10px;">
    <select class="col-sm-1" id="exampleFormControlSelect1" style="margin:4px 16px 4px 20px;">
      <option>제목</option>
      <option>저자</option>
      <option>출판사</option>
    </select>
    <input type="text" placeholder="오늘은 어떤 책을 알아볼까요?" class="search-input form-control has-success col-sm-9 m-1">
  <button type="submit" class="btn btn-rose btn-raised btn-fab btn-round " style="margin-left:20px;">
                    <i class="material-icons">search</i>
                  </button>
  </div>
</form>
</div>
<div class="search-result">
<c:if test="${'.search-input' ==null})">
	<jsp:include page="/WEB-INF/book/v_searchRecommendBook.jsp"/>
</c:if>
</div>
</div>
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
      
      // search-input keyup시 비동기 이벤트발생시키고 싶은데 어케해야할지..
      $(".search-input").keyup(function() {
          $(".search-input").val().submit()
      });

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