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
<body class="index-page sidebar-collapse">
<header>
<c:set var="user_id" value="${sessionScope.user_id}"/>
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
<div class="container wrapper"> <!-- style="background-color:white;" -->
    <!--         carousel  -->
    <div class="" id="carousel">
        <div class="row">
          <div class="col-md-10 mr-auto ml-auto">
            <!-- Carousel Card -->
            <div class="card card-raised card-carousel">
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="3000">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="d-block w-100" src="./assets/img/bg2.jpg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                      <h4>
                        <i class="material-icons">location_on</i>
                        Yellowstone National Park, United States
                      </h4>
                    </div>
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="./assets/img/bg3.jpg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                      <h4>
                        <i class="material-icons">location_on</i>
                        Somewhere Beyond, United States
                      </h4>
                    </div>
                  </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="./assets/img/bg.jpg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                      <h4>
                        <i class="material-icons">location_on</i>
                        Yellowstone National Park, United States
                      </h4>
                    </div>
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <i class="material-icons">keyboard_arrow_left</i>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <i class="material-icons">keyboard_arrow_right</i>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
            <!-- End Carousel Card -->
          </div>
        </div>
      
    </div>
    <!--         end carousel -->
<a href="Dashboard.admin">관리자페이지 테스트</a>
<br>
<a href="PostList.post">포스트작성</a><br>
<div class="container bestsellerbykeyward">
<h3>키워드 별 베스트셀러</h3>
<div class="bestsellercontents">
</div>

<!-- 준수오빠...어케해요... -->
<main id="contents" class="result_depth" style="">
      <div class="select-box pb12" id="selectBox">
        <div class="search-sort">
          <p>
            총 <span><span id="total-length">0</span>건</span>의 검색결과
          </p>
          <div>
            <span>
              <button type="button" id="list-type-btn" class="btn btn-default btn-link">
                <span class="ir"></span>
                <svg
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                  class="grid-btn"
                >
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M5 10.2C5 10.421 5.17909 10.6 5.4 10.6H10.2C10.4209 10.6 10.6 10.421 10.6 10.2V5.4C10.6 5.17909 10.4209 5 10.2 5H5.4C5.17909 5 5 5.17909 5 5.4V10.2Z"
                    stroke="#666666"
                  />
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M13.4003 10.2C13.4003 10.421 13.5794 10.6 13.8003 10.6H18.6003C18.8212 10.6 19.0003 10.421 19.0003 10.2V5.4C19.0003 5.17909 18.8212 5 18.6003 5H13.8003C13.5794 5 13.4003 5.17909 13.4003 5.4V10.2Z"
                    stroke="#666666"
                  />
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M5 18.5988C5 18.8198 5.17909 18.9988 5.4 18.9988H10.2C10.4209 18.9988 10.6 18.8198 10.6 18.5988V13.7988C10.6 13.5779 10.4209 13.3988 10.2 13.3988H5.4C5.17909 13.3988 5 13.5779 5 13.7988V18.5988Z"
                    stroke="#666666"
                  />
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M13.4004 18.5988C13.4004 18.8198 13.5795 18.9988 13.8004 18.9988H18.6004C18.8213 18.9988 19.0004 18.8198 19.0004 18.5988V13.7988C19.0004 13.5779 18.8213 13.3988 18.6004 13.3988H13.8004C13.5795 13.3988 13.4004 13.5779 13.4004 13.7988V18.5988Z"
                    stroke="#666666"
                  />
                </svg>
                <svg
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  xmlns="http://www.w3.org/2000/svg"
                  class="list-btn"
                >
                  <path d="M5 7H7" stroke="#666666" stroke-linecap="round" />
                  <path d="M5 12H7" stroke="#666666" stroke-linecap="round" />
                  <path d="M5 17H7" stroke="#666666" stroke-linecap="round" />
                  <path d="M10 7H19" stroke="#666666" stroke-linecap="round" />
                  <path d="M10 12H19" stroke="#666666" stroke-linecap="round" />
                  <path d="M10 17H19" stroke="#666666" stroke-linecap="round" />
                </svg>
              </button>
            </span>
            <div id="order-select" class="select">
              <ul></ul>
            </div>
          </div>
        </div>
        <div class="curation-nav swipe">
          <ul class="swiper-wrap">
            <li class="swiper-slide">
              <button type="button" id="btn-total" class="active btn btn-rose btn-round" name="total" style="margin-left: 6px">종합</button>
              <button type="button" id="btn-noble" class="btn btn-default btn-round " name="소설" style="margin-left: 6px">소설</button>
              <button type="button" id="btn-poem" class="btn btn-default btn-round" name="시/에세이" style="margin-left: 6px">시/에세이</button>
              <button type="button" id="btn-social" class="btn btn-default btn-round" name="예술/대중문화" style="margin-left: 6px">예술/대중문화</button>
              <button type="button" id="btn-business" class="btn btn-default btn-round" name="경제경영" style="margin-left: 6px">경제/경영</button>
              <button type="button" id="btn-self" class="btn btn-default btn-round" name="자기계발" style="margin-left: 6px">자기계발</button>
              <button type="button" id="btn-lib" class="btn btn-default btn-round" name="인문" style="margin-left: 6px">인문</button>
            </li>
          </ul>
        </div>
      </div>

      <div class="nodata_box">검색결과가 없습니다.</div>

      <ul id="book-list" class="book-list grid">
        <li>
          <a href="/viewfinder/book_detail.html?book_seq=15599279"
            ><div class="image book-icon readingbook">
              <img
                src="https://img.millie.co.kr/200x/service/cover/15599279/ea654d25ef014b00b9475cbb4c0e8247.jpg"
                alt=""
              />
            </div>
            <div class="body">
              <span class="bedge-icon readingbook"><i>오디오북</i><span>전문성우</span></span
              ><span class="title">싸울 때마다 투명해진다</span>
              <p>오디오북으로 듣는 여성들의 서사</p>
              <div><span class="author">은유</span><span class="publisher">서해문집</span></div>
            </div></a
          >
        </li>
        <li>
          <a href="/viewfinder/book_detail.html?book_seq=15599279"
            ><div class="image book-icon readingbook">
              <img
                src="https://img.millie.co.kr/200x/service/cover/15599279/ea654d25ef014b00b9475cbb4c0e8247.jpg"
                alt=""
              />
            </div>
            <div class="body">
              <span class="bedge-icon readingbook"><i>오디오북</i><span>전문성우</span></span
              ><span class="title">싸울 때마다 투명해진다</span>
              <p>오디오북으로 듣는 여성들의 서사</p>
              <div><span class="author">은유</span><span class="publisher">서해문집</span></div>
            </div></a
          >
        </li>
        <li>
          <a href="/viewfinder/book_detail.html?book_seq=15599279"
            ><div class="image book-icon readingbook">
              <img
                src="https://img.millie.co.kr/200x/service/cover/15599279/ea654d25ef014b00b9475cbb4c0e8247.jpg"
                alt=""
              />
            </div>
            <div class="body">
              <span class="bedge-icon readingbook"><i>오디오북</i><span>전문성우</span></span
              ><span class="title">싸울 때마다 투명해진다</span>
              <p>오디오북으로 듣는 여성들의 서사</p>
              <div><span class="author">은유</span><span class="publisher">서해문집</span></div>
            </div></a
          >
        </li>
        <li>
          <a href="/viewfinder/book_detail.html?book_seq=15599279"
            ><div class="image book-icon readingbook">
              <img
                src="https://img.millie.co.kr/200x/service/cover/15599279/ea654d25ef014b00b9475cbb4c0e8247.jpg"
                alt=""
              />
            </div>
            <div class="body">
              <span class="bedge-icon readingbook"><i>오디오북</i><span>전문성우</span></span
              ><span class="title">싸울 때마다 투명해진다</span>
              <p>오디오북으로 듣는 여성들의 서사</p>
              <div><span class="author">은유</span><span class="publisher">서해문집</span></div>
            </div></a
          >
        </li>
      </ul>
      <!-- <div class="listmore_wrap"><a href="javascript:;" class="btn_listmore"><span>더보기</span></a></div> -->
    </main>
    <!-- 준수오빠...어케해요... -->
    <h3>MD's Pick Post</h3>
    <div class="card card-body">여기에 포스트카드</div>
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