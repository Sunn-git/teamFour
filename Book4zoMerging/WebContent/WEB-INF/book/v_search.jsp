<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
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
  
  	    <!-- 준수 CSS -->     
    <link rel="stylesheet" href="c/css/layout.css" /> <!-- 여기에  layout css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home-3.10f79.css" /> <!-- 여기에 버튼 css -->    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookList.css" />
    
     <!-- 준수 JS -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

    <script type="text/javascript">

    $(function () {
    	
    	//이거 쓸 수도 있어서 일단 남겨둠
        var isGrid = true
        $("#list-type-btn").on("click", function () {
          isGrid = !isGrid
          if (isGrid) {
            $("#list-type-btn").removeClass("grid")
            $("#book-list").addClass("grid")
            $("#book-list").removeClass("list")
          } else {
            $("#list-type-btn").addClass("grid")
            $("#book-list").addClass("list")
            $("#book-list").removeClass("grid")
          }
        })
        
        //동적으로 추천도서목록 생성해주는 부분
        var ajax =$.ajax({
	      	  url: "http://book.interpark.com/api/recommend.api",
	    	  data: {
	    		  key: 'ECF73A29EE9688587F70A785201AB95DE352C2284B870EEE927ECAC11048DEDE',
	    		  categoryId: '102',
	    		  output: 'json'        		  
	    	  },
			  dataType: 'jsonp',
        	success : function(data){//korBookList
        		        		
        		var totalCount=0;
           		$("#book-list").empty();
           		
           		let dataArr = data.item;

        		$.each(dataArr, function (index, item) {
        			
                let bl = "<li>"
                bl += "<a>"
                bl += "<div class='image book-icon readingbook'>"
                bl += "<img src='" + item.coverLargeUrl +"'/> </div>"
                bl += "<div class ='body'>"
                bl += "<span class = 'bedge-icon readingbook'>"
                bl += "<span>" +item.categoryName + "</span>"
                bl += "</span>"
                bl += "<span class='title'>" + item.title + "</span>"
                
              	//저자 길이 제한
                if(item.author.length > 10){
                	var shorten = item.author.substring(0,35)
                	bl += "<span class='author'>" + shorten +"..."+"</span>"
                }else{
                	bl += "<div><span class='author'>"+item.author+"</span>"
                }
                bl += "<span class='publisher'>" +item.publisher+"</span></div>"
                bl += "</div>"
                bl += "</a>"
                bl += "</li>"
              
              $('#book-list').append(bl)
              totalCount+=1;
              
            }); //each end
           $('#total-length').empty();
           $('#total-length').append(totalCount)
        	}
        }); //ajax end
      })
    </script>
  
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <style type="text/css">
  #jumbo{
  	background-image : url("${pageContext.request.contextPath}/assets/img/searchjumbo.jpg");
  	background-size: 100%;
  	height:300px; 
  	background-color:#b8a7a7; 
  	color : white; 
  	padding-top: 160px;
  }
  </style>
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
	
	
	<div class="header" id="jumbo" >
		<div class="container">
		
		</div>
	</div>
	
	
	<!-- 검색  -->
	<div class="container">
		<div class="card card-body">
			<!-- <form action="#" class=""> -->
	    		<label for="exampleFormControlSelect1">카테고리</label>
				<div class="form-group has-rose row" style="padding-top:10px;">
	    			<select id="searchFilter" class="col-sm-1" id="exampleFormControlSelect1" style="margin:4px 16px 4px 20px;">
				      <option>제목</option>
				      <option>저자</option>
				      <option>출판사</option>
				    </select>
				    
				    <!-- 검색어 입력창 -->
	    			<input type="text" id="bookSearchInput" name="bookSearchInput" placeholder="오늘은 어떤 책을 알아볼까요?" class="search-input form-control has-success col-sm-9 m-1" value="">
	  				<button type="submit" id="bookSearchInputButton" name="bookSearchInputButton" class="btn btn-rose btn-raised btn-fab btn-round " style="margin-left:20px;">
	                    <i class="material-icons">search</i>
	                </button>
	  			</div>
			<!-- </form> -->
    </div>

		<!-- 검색결과 출력부분 -->	
		<div class="search-result">
		
		
		<div class="row">		
		  <div class="col-md-12">
		    <div class="card" id="bookSearchResultCard">
		    
		    	<!-- api받아와서 비동기로 뿌려지는 추천도서. 검색결과 나오면 비워질 부분-->
		        <div class="card-header card-header-rose">
		            <h4 class="card-title">	추천도서</h4>
		            <p class="category">국내 소설 신간</p>
		        </div>
		        <div class="card-body">
		        	<ul id="book-list" class="book-list grid">
		        	<!-- 임시 데이터 -->
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
				            </div></a>
				        </li>
   
					</ul>
				</div>
				
				
				
				
		    </div>
		  </div>
		</div>
			
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
  
  
  <!-- 
  정체불명? 어디서 온건지 모르겠다.
	  <script>
	    $(document).ready(function() {
	      init DateTimePickers
	      materialKit.initFormExtendedDatetimepickers();
	
	       Sliders Init
	      materialKit.initSliders();
	      
	       search-input keyup시 비동기 이벤트발생시키고 싶은데 어케해야할지..
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
	-->

<!-- 선 JS -->
<script type="text/javascript">
	$(function(){
		
		
		//일단한번 비동기

		//검색 기능 : 버튼클릭 
		$('#bookSearchInputButton').click(function() {

			//console.log($('#searchFilter option:selected').val());
			//console.log($('#bookSearchInput').val());

			$.ajax({
				url:"GetBookSearchResult.ajax",
				type:"post",
				dataType:"json",
				data: {
					searchFilter : $('#searchFilter option:selected').val(),
					bookSearchInput : $('#bookSearchInput').val()
				},
				success: function(data){
	        		console.log(data);
	        		var totalCount=0;
	        		
	            $("#bookSearchResultCard").empty();
	            $('#bookSearchResultCard').append('<ul id="book-list" class="book-list grid"></ul>');

	        		$.each(data, function (index, item) {
	                let bl = "<li>"
	                bl += "<a href='Detail.book?bookSeq="+ item.bookSeq +"'>"
	                bl += "<div class='image book-icon readingbook'>"
	                bl += "<img src='" + item.coverUrl +"'/> </div>"
	                bl += "<div class ='body'>"
	                bl += "<span class = 'bedge-icon readingbook'>"
	                bl += "<span>" +item.categoryTag + "</span>"
	                bl += "</span>"
	                bl += "<span class='title'>" +item.title + "</span>"
	                
	              //저자 길이 제한
	                if(item.author.length > 10){
	                	var shorten = item.author.substring(0,35)
	                	bl += "<span class='author'>" + shorten +"..."+"</span>"
	                }else{
	                	bl += "<div><span class='author'>"+item.author+"</span>"
	                }
	                bl += "<span class='publisher'>" +item.publisher+"</span></div>"
	                bl += "</div>"
	                bl += "</a>"
	                bl += "</li>"
	              
	              $('#book-list').append(bl)
	              totalCount+=1;
	              
	            }); //each end
	           $('#total-length').empty();
	           $('#total-length').append(totalCount)
				console.log(totalCount)
	        	},
				error: function() {
					console.log("error");
				}
			});
		});
	
	
		// 검색 기능 : keyup
		$('#bookSearchInput').keyup(function() {

			console.log($('#searchFilter option:selected').val());
			console.log($('#bookSearchInput').val());

			$.ajax({
				url:"GetBookSearchResult.ajax",
				type:"post",
				dataType:"json",
				data: {
					searchFilter : $('#searchFilter option:selected').val(),
					bookSearchInput : $('#bookSearchInput').val()
				},
				success: function(data){
	        		console.log(data);
	        		var totalCount=0;
	        		
	            $("#bookSearchResultCard").empty();
	            $('#bookSearchResultCard').append('<ul id="book-list" class="book-list grid"></ul>');

	        		$.each(data, function (index, item) {
	                let bl = "<li>"
	                bl += "<a href='Detail.book?bookSeq="+ item.bookSeq +"'>"
	                bl += "<div class='image book-icon readingbook'>"
	                bl += "<img src='" + item.coverUrl +"'/> </div>"
	                bl += "<div class ='body'>"
	                bl += "<span class = 'bedge-icon readingbook'>"
	                bl += "<span>" +item.categoryTag + "</span>"
	                bl += "</span>"
	                bl += "<span class='title'>" +item.title + "</span>"
	                
	              //저자 길이 제한
	                if(item.author.length > 10){
	                	var shorten = item.author.substring(0,35)
	                	bl += "<span class='author'>" + shorten +"..."+"</span>"
	                }else{
	                	bl += "<div><span class='author'>"+item.author+"</span>"
	                }
	                bl += "<span class='publisher'>" +item.publisher+"</span></div>"
	                bl += "</div>"
	                bl += "</a>"
	                bl += "</li>"
	              
	              $('#book-list').append(bl)
	              totalCount+=1;
	              
	            }); //each end
	           $('#total-length').empty();
	           $('#total-length').append(totalCount)
				console.log(totalCount)
	        	},
				error: function() {
					console.log("error");
				}
			});
		});
		
	});
</script>


</body>
	 

</html>