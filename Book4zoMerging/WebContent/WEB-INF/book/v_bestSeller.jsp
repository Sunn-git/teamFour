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
   베스트 셀러 전체보기
  </title>

    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, viewport-fit=cover"
    />
  
    <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/material-kit.css?v=2.0.7" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
  
	<!-- 준수 페이지 -->
	    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/swiper.4.1.6.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css" /> <!-- 여기에  layout css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home-3.10f79.css" /> <!-- 여기에 버튼 css -->    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookList.css" />

    <!-- JS -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>

    <!-- 핵심 CSS -->
    <link href="https://select.ridicdn.net/app.a00239db55301aa1cd30.css" rel="stylesheet">

	<!-- 시간되면 ajax 코드 정리하기 ........... 알아보기 힘들다  -->
    <script type="text/javascript">
      $(function () {
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
        
        
        var ajax =$.ajax({
        	url : "GetBookSearchResult.ajax",
        	type : "POST",
        	dataType : "json",
        	success : function(data){
        		console.log(data);
        		var totalCount=0;
        		
            $("#book-list").empty();
            

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
        	}
        }); //ajax end
        
        
        
       //Tag Ajax Start
       $(".swiper-slide").children().on("click", function () {
    	   $(".swiper-slide").children().removeClass("active")
    	   $(this).addClass("active")
    	   if($(this).attr('name') == 'total'){
    		   $.ajax({
    				url : "GetBookSearchResult.ajax",
    	        	type : "POST",
    	        	dataType : "json",
    	        	success : function(data){
    	        		console.log(data);
    	        		var totalCount=0;
    	            $("#book-list").empty();
    	            

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
    	                
    	              
    	            }); //each end << 와 언니 똑똑쓰해 써놓으면 알아보기 쉽네요
    	           $('#total-length').empty();
    	           $('#total-length').append(totalCount)
    				console.log(totalCount)
    	        	}
    	        });
    	   }
    	   
    	   
    	   $.ajax({
    		   url : 'GetBookListByTag.ajax',
    		   type : 'POST',
    		   dataType : "json",
    		   data: {
    			   selectedTag :$(this).attr('name')
    		   },
    		   success: function(data) {
    				var totalCount=0;
    	            $("#book-list").empty();
    	            

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
			}
    		   
    	   }) 
    	   
        })//tag axaj end
        
      })
    </script>
	


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

<div class="container bestsellerbykeyward" style ="width : 860px;">
<h3>키워드 별 베스트셀러 <button class="btn btn-link btn-sm btn-toggle" href="BestSellerView.book">게시글 더보기</button></h3>
<hr>
<div class="bestsellercontents">
</div>

<!-- 준수오빠...어케해요... -->
<main id="contents" class="result_depth" style="margin-top: 40px;">
      <div class="" id="selectBox"">
        
        <div class="curation-nav swipe">
          <ul class="swiper-wrap">
            <li class="swiper-slide">
              <button type="button" id="btn-total" class="active" name="total" style="margin-left: 6px">종합</button>
              <button type="button" id="btn-noble" class=" " name="소설" style="margin-left: 6px">소설</button>
              <button type="button" id="btn-poem" class="" name="시/에세이" style="margin-left: 6px">시/에세이</button>
              <button type="button" id="btn-social" class="" name="예술/대중문화" style="margin-left: 6px">예술/대중문화</button>
              <button type="button" id="btn-business" class="" name="경제경영" style="margin-left: 6px">경제/경영</button>
              <button type="button" id="btn-self" class="" name="자기계발" style="margin-left: 6px">자기계발</button>
              <button type="button" id="btn-lib" class="" name="인문" style="margin-left: 6px">인문</button>
            </li>
          </ul>
        </div>
      </div>

      <div class="nodata_box">검색결과가 없습니다.</div>

      <ul id="book-list" class="book-list grid" style="padding-right:40px; margin-top:40px;">
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

	  <!-- 준수 script -->
    <script>
      ;(function (w, d, $) {
        var $totalLength = $("#total-length"),
          $orderSelect = $("#order-select"),
          $ordeUl = $orderSelect.find("ul"),
          $nodataBox = $(".nodata_box"),
          $bookList = $("#book-list"),
          $goTop = $("#go-top")
        var isGrid = true
        var currentSelectValue = "regdate"
        var isSelectOpen = false
        var selectItem = [
          {
            label: "업데이트 순",
            value: "regdate",
          },
          {
            label: "제목 순",
            value: "book_name",
          },
          {
            label: "발간일 순",
            value: "pubdate",
          },
        ]

        var millie = store.get("millie") || {}
        var search_keyword = ""
        var category1 = "1474"
        var category2 = "사회"
        var category2_seq = "1485"

        var millie = store.get("millie") || {}
        var param = getUrlParams()
        var library_seq = param.library_seq
        var cateName = ""
        var search_keyword = ""

        var total = 0
        var totalPage = 0
        var page = 1
        var bookTypeSchema = [
          {
            className: "readingbook",
            text: "오디오북",
            isBedge: true,
            typeCode: 806,
          },
          {
            className: "chatbook",
            text: "챗북",
            isBedge: true,
            typeCode: 876,
          },
          {
            className: "docent",
            text: "도슨트",
            isBedge: true,
            typeCode: 878,
          },
          {
            className: "pdf",
            text: "PDF",
            isBedge: false,
            typeCode: 829,
          },
          {
            className: "comic",
            text: "만화",
            isBedge: false,
            typeCode: 882,
          },
          {
            className: "none",
            iconText: "준비중",
            isBedge: false,
            typeCode: 249,
          },
        ]
        var scrollEventStatus = true
        var listData = {
          path: null,
          RESP_DATE: null,
          RESP_DATA: [],
          page: null,
          sort: null,
          scrollY: 0,
        }
        var isGoTopShow = false

        $("#contents").append('<div class="page_loading" style="display:none;"><span></span></div>')
        var $pageLoading = $(".page_loading")

        function dateDiff(now, soon) {
          var sd = /(\d{4})\-(\d{2})\-(\d{2}) (\d{2}\:\d{2}\:\d{2})/.exec(soon)
          var date = new Date(sd[1] + "/" + sd[2] + "/" + sd[3] + "/" + sd[4])
          return {
            year: Number(sd[1]),
            month: Number(sd[2]),
            day: Number(sd[3]),
            diff: Math.ceil((date.getTime() - now.getTime()) / (1000 * 3600 * 24)),
          }
        }
        function setTotal() {
          var t = total
          if (t === 0) {
            scrollEventStatus = false
            $nodataBox.addClass("on")
          } else {
            $nodataBox.removeClass("on")
            if (t > 1000) {
              $totalLength.text("+999")
            } else {
              $totalLength.text(String(t).replace(/\B(?=(\d{3})+(?!\d))/g, ","))
            }
          }
        }

        function getStorage() {
          var ss = sessionStorage.getItem("millieSearch3")
          if (ss) {
            var storage = JSON.parse(ss)
            if (location.href === storage.path) {
              page = storage.page
              currentSelectValue = storage.sort
              setSelect()
              setList(storage, false)
            } else {
              getList(false)
            }
          } else {
            getList(false)
          }
        }
        function setStorage() {
          sessionStorage.setItem("millieSearch3", JSON.stringify(listData))
        }

        function setList(data, isAppend) {
          listData.path = location.href
          listData.RESP_DATE = data.RESP_DATE
          listData.page = page
          listData.sort = currentSelectValue

          total = Number(data.RESP_DATA[0].total)
          totalPage = Number(data.RESP_DATA[0].total_page)
          var html = ""
          var nowDate = /(\d{4})(\d{2})(\d{2})(\d{2})(\d{2})(\d{2})/.exec(data.RESP_DATE)
          var now = new Date(
            nowDate[1] +
              "/" +
              nowDate[2] +
              "/" +
              nowDate[3] +
              "/" +
              nowDate[4] +
              ":" +
              nowDate[5] +
              ":" +
              nowDate[6]
          )
          $.each(data.RESP_DATA, function (index, item) {
            listData.RESP_DATA.push(item)
            var isComingSoon = false
            var bookType = null
            $.each(bookTypeSchema, function (i, t) {
              if (item.contents_code && Number(item.contents_code) === t.typeCode) {
                bookType = t
              }
            })
            html += "<li>"
            html += '<a href="/viewfinder/book_detail.html?book_seq=' + item.book_seq + '">'
            if (bookType) {
              if (bookType.iconText) {
                if (item.book_adult_yn === "Y" && item.mem_adult_yn === "Y") {
                  html +=
                    '<div class="image book-icon ' +
                    bookType.className +
                    '" data-icon="' +
                    bookType.iconText +
                    ' adult">'
                } else {
                  html +=
                    '<div class="image book-icon ' +
                    bookType.className +
                    '" data-icon="' +
                    bookType.iconText +
                    '">'
                }
              } else {
                if (item.book_adult_yn === "Y" && item.mem_adult_yn === "Y") {
                  html += '<div class="image book-icon ' + bookType.className + ' adult">'
                } else {
                  html += '<div class="image book-icon ' + bookType.className + '">'
                }
              }
            } else {
              if (item.book_adult_yn === "Y" && item.mem_adult_yn === "Y") {
                html += '<div class="image adult">'
              } else {
                html += '<div class="image">'
              }
            }

            if (item.book_kind_code === "61") {
              html += '<span class="free"></span>'
            }

            //item.coming_soon_date = "2019-08-05 10:00:00";
            if (item.coming_soon_date) {
              var d = dateDiff(now, item.coming_soon_date)
              if (d.diff && d.diff > 0) {
                isComingSoon = true
                html += '<div class="time">'
                html += '<time datatime="">'
                if (d.diff <= 5) {
                  html += '<span class="year">OPEN</span>'
                  html += '<span class="day">D-' + d.diff + "</span>"
                } else {
                  html += '<span class="year">' + d.month + "월</span>"
                  html += '<span class="day">' + d.day + "</span>"
                }
                html += "</time>"
                html += '<span class="ir">출간 예정</span>'
                html += "</div>"
              }
            }
            if (item.book_adult_yn === "Y") {
              if (item.mem_adult_yn === "Y") {
                if (isComingSoon) {
                  html += '<img src="' + item.book_cover_image + '" class="blur" alt="">'
                } else {
                  html += '<img src="' + item.book_cover_image + '" alt="">'
                }
              } else {
                html +=
                  '<img src="https://www.millie.co.kr/common/images/common/new-book-adult.png" alt="">'
              }
            } else {
              if (isComingSoon) {
                html += '<img src="' + item.book_cover_image + '" class="blur" alt="">'
              } else {
                html += '<img src="' + item.book_cover_image + '" alt="">'
              }
            }
            html += "</div>"
            html += '<div class="body">'
            if (bookType && bookType.isBedge) {
              html += '<span class="bedge-icon ' + bookType.className + '">'
              html += "<i>" + bookType.text + "</i>"
              if (bookType.typeCode === 806) {
                html += "<span>" + item.leader_name + "</span>"
              }
              html += "</span>"
            }
            html += '<span class="title">' + item.book_name + "</span>"
            html += "<p>" + item.sub_title + "</p>"
            html += "<div>"
            html += '<span class="author">' + item.author + "</span>"
            html += '<span class="publisher">' + item.pub_name + "</span>"
            html += "</div>"
            html += "</div>"
            html += "</a>"
            html += "</li>"
          })
          if (isAppend) {
            $bookList.append(html)
          } else {
            $bookList.html(html)
          }
          data.scrollY > 0 && $(w).scrollTop(data.scrollY)
          setStorage()
          setTotal()
        }
        function getList(isAppend) {
          $pageLoading.show()
          var post_api = {
            session_id: millie.session_id,
            method: "viewfinder",
            mode: "book",
            page: page,
            blockpage: "30",
            search: "",
            search_txt: "",
            b2b_yn: "Y",
            category_name: category1,
            category2_name: category2,
            category2_seq: category2_seq,
            ebook_yn: "Y",
            range: "asc",
            sort: currentSelectValue,
          }
          doAjax(post_api, function (data) {
            if (data.RESP_CD === "000") {
              if (data.RESP_DATA.length) {
                setList(data, isAppend)
                scrollEventStatus = true
              } else {
                scrollEventStatus = false
              }
              $pageLoading.stop().delay(500).fadeOut(300)
            } else {
              $pageLoading.hide()
            }
          })
        }

        $(w).on("scroll", function () {
          if (totalPage > page) {
            if (
              scrollEventStatus &&
              w.innerHeight + $(this).scrollTop() + 100 >= d.body.offsetHeight
            ) {
              scrollEventStatus = false
              page++
              getList(true)
            }
          }

          var y = $(this).scrollTop()
          if (y > 0) {
            if (!isGoTopShow) {
              isGoTopShow = true
              $goTop.addClass("show").stop().fadeIn(200).clearQueue()
            }
          } else {
            isGoTopShow = false
            $goTop.stop().fadeOut(200, function () {
              $(this).removeClass("show")
            })
          }

          listData.scrollY = y
          setStorage()
        })
        $("#list-type-btn").on("click", function () {
          isGrid = !isGrid
          if (isGrid) {
            $(this).removeClass("grid")
            $(this).addClass("grid")
            $(this).removeClass("list")
          } else {
            $(this).addClass("grid")
            $(this).addClass("list")
            $(this).removeClass("grid")
          }
        })
        function setSelect() {
          var items = ""
          if (isSelectOpen) {
            $.each(selectItem, function (index, item) {
              if (item.value !== currentSelectValue) {
                items +=
                  '<li><a href="#" data-value="' + item.value + '">' + item.label + "</a></li>"
              }
            })
            $ordeUl.append(items)
          } else {
            $.each(selectItem, function (index, item) {
              if (item.value === currentSelectValue) {
                items +=
                  '<li><a href="#" data-value="' + item.value + '">' + item.label + "</a></li>"
              }
            })
            $ordeUl.html(items)
          }
        }
        function selectClick(e) {
          e.preventDefault()
          $orderSelect.toggleClass("open")
          isSelectOpen = !isSelectOpen
          if (!isSelectOpen) {
            if (currentSelectValue !== e.target.dataset.value) {
              currentSelectValue = e.target.dataset.value
              page = 1
              getList(false)
            }
          }
          setSelect()
        }

        $ordeUl.on("click", "a", selectClick)

        setSelect()
        getStorage()
      })(window, document, jQuery)
    </script>
    <!-- Code injected by live-server -->
    <script type="text/javascript">
      // <![CDATA[  <-- For SVG support
      if ("WebSocket" in window) {
        ;(function () {
          function refreshCSS() {
            var sheets = [].slice.call(document.getElementsByTagName("link"))
            var head = document.getElementsByTagName("head")[0]
            for (var i = 0; i < sheets.length; ++i) {
              var elem = sheets[i]
              var parent = elem.parentElement || head
              parent.removeChild(elem)
              var rel = elem.rel
              if (
                (elem.href && typeof rel != "string") ||
                rel.length == 0 ||
                rel.toLowerCase() == "stylesheet"
              ) {
                var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, "")
                elem.href =
                  url +
                  (url.indexOf("?") >= 0 ? "&" : "?") +
                  "_cacheOverride=" +
                  new Date().valueOf()
              }
              parent.appendChild(elem)
            }
          }
          var protocol = window.location.protocol === "http:" ? "ws://" : "wss://"
          var address = protocol + window.location.host + window.location.pathname + "/ws"
          var socket = new WebSocket(address)
          socket.onmessage = function (msg) {
            if (msg.data == "reload") window.location.reload()
            else if (msg.data == "refreshcss") refreshCSS()
          }
          if (sessionStorage && !sessionStorage.getItem("IsThisFirstTime_Log_From_LiveServer")) {
            console.log("Live reload enabled.")
            sessionStorage.setItem("IsThisFirstTime_Log_From_LiveServer", true)
          }
        })()
      } else {
        console.error(
          "Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading."
        )
      }
      // ]]>
    </script>

</body>
</html>