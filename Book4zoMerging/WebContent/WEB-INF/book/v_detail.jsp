<%@page import="kr.or.book4zo.dto.BookDto"%>
<%@page import="kr.or.book4zo.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>Review 4 Book</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,viewport-fit=cover">



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

    <style>
        /* *{
            border: 1px solid lightgray;
        } */

        @media (min-width:835px){
            /* 
            .PageBookDetail_Panel{
                position:relative;
                width:800px;
                margin:0 auto;
                padding:30px 10px
            }

            .Reviews{
                width:100%;
                padding: 0 10px;
            }
             */

            .sectionDivider::after{
                position: absolute;
                top: -1px;
                left: 0;
                width: 100%;
                height: 2px;
                background-color: #e6e8eb;
                content: "";
                opacity: .9;
            }
        }



        .bookDetailBackgroundColorWhite {
            background-color: white;
        }

    </style>

      <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
</head>

<body class="focus-free">
    <div id="app">

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

        <main class="SceneWrapper PageBookDetail bookDetailBackgroundColorWhite">
            <div class="PageBookDetail_Header PageBookDetail_Header-dark" style="background: rgb(139, 23, 71);">
                <!-- 배경 책 표지 사진 들어가는 부분 -->
                <span class="PageBookDetail_HeaderBackground" style="background-image: url(&quot;${book.coverUrl}&quot;);">
                    <span class="Left_GradientOverlay" style="background: linear-gradient(to right, rgb(139, 23, 71) 0%, rgba(255, 255, 255, 0) 100%);"></span>
                    <span class="Right_GradientOverlay" style="background: linear-gradient(to left, rgb(139, 23, 71) 0%, rgba(255, 255, 255, 0) 100%);"></span>
                </span>
                <div class="PageBookDetail_HeaderMask" style="background-color: rgba(139, 23, 71, 0.93); max-height: 450px; overflow: hidden;">
                    <div class="PageBookDetail_HeaderContent">
                        <div class="PageBookDetail_ThumbnailWrapper">
                            <button class="PageBookDetail_ThumbnailButton">
                                <!-- 책 썸네일 들어가는 부분 -->
                                <img class="PageBookDetail_Thumbnail" src="${book.coverUrl}" alt="${book.title}">
                            </button>
                        </div>
                        <div class="PageBookDetail_Meta">
                            <ul class="PageBookDetail_Categories">
                                <li class="PageBookDetail_CategoryItem"><span>${book.categoryTag}</span></li>
                            </ul>
                            <h1 class="PageBookDetail_BookTitle">${book.title}</h1>
                            <p class="PageBookDetail_BookElements">
                                <span class="PageBookDetail_Authors">${book.author} 저</span>

								<!-- 역자가 null이 아닌 경우에만 출력 -->                                
                                <c:if test="${book.translator != null}">
                                	<span class="PageBookDetail_Publisher"> ·  ${book.translator} 역</span>                                
                                </c:if>
 
                                <span class="PageBookDetail_FileType">${book.publisher} 출판</span>
                                <span class="PageBookDetail_FileSize"> · ${book.isbn}</span>
                            <p class="PageBookDetail_RatingSummary">
                                <span class="StarRating_IconBox dark" style="width: 74px; height: 15px;">
                                    <span class="StarRating_Icon_Background" style="width: 74px; height: 15px;"></span>
                                    <span class="StarRating_Icon_Foreground_Mask" style="width: 63.64px; height: 15px;">
                                        <span class="StarRating_Icon_Foreground" style="width: 74px; height: 15px;"></span>
                                    </span>
                                </span>
                                <!-- 평점이 들어가야 하는데 댓글 별점 평균을 실시간으로 반영해야해서 book객체에 점수를 저장할 수 없다.(아니면 평점 추가될 때마다 매번 reset돼야함..) 비동기로 하는게 낫겠다 -->
                                <span class="PageBookDetail_RatingSummaryAverage">{request로 평점평균 받아오기}</span>
                                <span class="PageBookDetail_RatingSummaryCount"> ( {리뷰 개수} 명 )</span>
                            </p>
                            <div class="PageBookDetail_DownloadWrapper">
                                <!-- 포스트로 이동하는 경로 넣을 부분 -->
                                <!-- <a class="RUIButton RUIButton-color-blue RUIButton-size-large PageBookDetail_DownloadButton PageBookDetail_DownloadButton-large" href="/intro" style="background-color: rgb(255, 255, 255); color: rgb(104, 17, 53); border-style: none;">  
                                    포스트 작성하기
                                </a> -->
                                <a href="PostWriteAction.post?bookSeq=${book.bookSeq}" class="btn btn-rose btn-lg" role="button" aria-disabled="true">포스트 작성하기</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <section class="PageBookDetail_Panel">
                <h2 class="PageBookDetail_PanelTitle"><strong>책소개</strong></h2>
                <div id = "BookDetail_Description" class="PageBookDetail_PanelContent">
                    <div>
                     <c:choose>
                        <c:when test="${fn:length(book.description) > 120}">
                            <c:out value="${fn:substring(book.description,0,120)}"/>...
                        </c:when>
                        <c:otherwise>
                            ${book.description}
                        </c:otherwise>
                    </c:choose>
                    </div>


                    <div class="BookDetail_ContentTruncWrapper">
                        <button id="BookDetail_ContentTruncButton" class="BookDetail_ContentTruncButton">
                            계속 읽기
                            <svg class="RSGIcon RSGIcon-arrowDown RSGIcon-arrow5Down" viewBox="0 0 36 21" width="36" height="21">
                                <path
                                    d="M36 3c0 .3-.1.6-.3.9L18.9 20.7c-.3.3-.5.3-.9.3-.5 0-.6-.2-.9-.3L.3 3.9C.2 3.6 0 3.3 0 3c0-.3.2-.6.3-.9L2.1.3c.3-.1.6-.3.9-.3.3 0 .6.2.9.3l14.2 14.2L32.4.5c.3-.3.4-.3.9-.3s.6.2.9.3L36 2.3c-.2.1 0 .4 0 .7z">
                                </path>
                            </svg>
                        </button>
                    </div>
                </div>
            </section>


            <section class="PageBookDetail_Panel">
                <h2 class="PageBookDetail_PanelTitle"><strong>포스트</strong></h2>
                
                
	                <div class="PageBookDetail_PanelContent">
	                
	                <c:forEach var="post" items="${requestScope.postList}">
	                    <div class="card text-left col-sm-10" style="border: 1px solid lightgray; margin: 10px auto 20px auto;">
	                        <div class="card-body">
	                            <div class="col-sm-3" style="float: left; width: 100%;">
	                            	<img alt="${book.title}" src="${book.coverUrl}">
	                            </div>
	                            <div class="col-sm-9" style="float: left;">
	                                <h6 class="card-subtitle mt-1 text-muted">${book.title} - 저자 ${book.author}</h6>
	                                <h4 class="PageBookDetail_PanelTitle">${post.post_title}</h4>
	                                
	                                <p class="card-text">${post.post_contents}</p>
	      
	                                <a href="PostDetailView.post?post_seq=${post.post_seq}" class="btn btn-rose btn-round" style="position: relative; margin: 0;"> ${post.user_id} 님의 포스트 읽으러 가기</a>
	                            </div>
	                        </div>
	                    </div>
	                 </c:forEach>
	                </div>
                
            </section>


            <section class="PageBookDetail_Panel Reviews_Wrapper">
                <div class="Reviews"><span class="a11y">리뷰</span>
                
                    <c:if test="${sessionScope.user_id != null}">
                    
                        <div class="ReviewsHeader" style="margin-bottom: 50px;">
                            <div class="ReviewsHeader_Right" style="text-align: center;">
                                <div class="StarRatingForm" style="display: inline-block;">

                                    <div class="StarRatingForm_Row" style="margin-right: 30px; position: relative;">
                                        <div class="StarRatingForm">
                                            <div class="BuyerRatingSummary">
                                                <p class="AverageRating_Title">리뷰어 별점</p>
                                                <div class="AverageRating_Score">{request로 평점평균 받아오기}<span class="a11y">점</span></div>
                                                <span class="StarRating_IconBox AverageRating_StarRating" style="width: 76px; height: 16px;">
                                                    <span class="StarRating_Icon_Background" style="width: 76px; height: 16px;"></span>
                                                    <span class="StarRating_Icon_Foreground_Mask" style="width: 65.36px; height: 16px;">
                                                        <span class="StarRating_Icon_Foreground" style="width: 76px; height: 16px;"></span>
                                                    </span>
                                                </span>
                                                
                                                <p class="ParticipantCount"><strong class="ParticipantCount_Num">{리뷰 개수}</strong> 명이 평가함</p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="StarRatingForm_Row" style="float: right;">
                                        <div class="StarRatingForm">
                                            <div id="StarRatingForm_text"class="StarRatingForm_Row" style="height: 100px; padding: 30px 0 10px 0;">
                                                
                                                <p class="StarRatingTooltip_Guide" style="padding: 30px auto;">이 책을 평가해주세요!</p>
                                                        
                                            </div>

                                            <!-- 왕별점 부분 -->
                                            <div class="StarRatingForm_Row" style="margin-top: -20px;">
                                                <div id="choiceStarRating" class="StarRatingInput StarRatingForm_Input">
                                                    <label for="MyStarRating1" class="StarRatingInput_Label" data-rating="1">
                                                        <span class="a11y">1점</span>
                                                        <span class="StarRatingInput_Separator"></span>
                                                    </label>
                                                    <input id="MyStarRating1" class="a11y" name="MyStarRating" type="radio" value="1">
                                                    <label for="MyStarRating2" class="StarRatingInput_Label" data-rating="2">
                                                        <span class="a11y">2점</span>
                                                        <span class="StarRatingInput_Separator"></span>
                                                    </label>
                                                    <input id="MyStarRating2" class="a11y" name="MyStarRating" type="radio" value="2">
                                                    <label for="MyStarRating3" class="StarRatingInput_Label" data-rating="3">
                                                        <span class="a11y">3점</span>
                                                        <span class="StarRatingInput_Separator"></span>
                                                    </label>
                                                    <input id="MyStarRating3" class="a11y" name="MyStarRating" type="radio" value="3">
                                                    <label for="MyStarRating4" class="StarRatingInput_Label" data-rating="4">
                                                        <span class="a11y">4점</span>
                                                        <span class="StarRatingInput_Separator"></span>
                                                    </label>
                                                    <input id="MyStarRating4" class="a11y" name="MyStarRating" type="radio" value="4">
                                                    <label for="MyStarRating5" class="StarRatingInput_Label" data-rating="5">
                                                        <span class="a11y">5점</span>
                                                    </label>
                                                    <input id="MyStarRating5" class="a11y" name="MyStarRating" type="radio" value="5">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    



                                </div>
                
                                <div id="ReviewForm" class="ReviewForm" userid="${user_id}" bookSeq="${book.bookSeq}">
                                    <textarea class="ReviewTextarea col-sm-12" id="replyContent" name="replyContent" title="리뷰 입력" placeholder="리뷰를 작성해주세요." style="height: 45.9844px;"></textarea>
                                    <div class="ReviewForm_ButtonsWrapper">
                                        <div style="display: inline-block;"></div>
                                        <button id="reviewWriteBtn" class="btn btn-rose btn-sm center">리뷰 남기기</button>

                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:if>

                    <div class="ReviewListHeader">
                        <!-- 이거 리스트 사라지면 구분선 사라짐 -->
                        <ul class="RSGTab_List" style="margin-top: 40px;">
                            <li class="RSGTab_List_Item"></li>
                            <li class="RSGTab_List_Item"></li>
                        </ul>

                        <ul class="PipeDelimitedList">
                            <li class="PipeDelimitedList_Item active">
                            <button type="button">최신순<span class="a11y">리스트 보기</span>
                            </button>
                            </li>
                        </ul>
                    </div>

                    <div class="ReviewsList_Wrapper" id="replyList_Warpper">
                        <ul id="replyList" class="ReviewList">
                            <!-- 비동기 댓글 자리 -->
                        </ul>

                        <!-- 더보기 버튼 자리 -->
                    </div>
            
                </div>
            </section>


            
        </main>

   </div>

   <script>
       $(function() {

		console.log($('input[name="MyStarRating"]'));

            var userId = $('#ReviewForm').attr('userid');
            var bookSeq = $('#ReviewForm').attr('bookSeq');
    	   
    	   //리뷰 리스트
    	   $.ajax({
    			url:"GetReplyList.ajax",
				type:"POST",
				dataType:"json",
				data:{
					book_seq : $('#ReviewForm').attr('bookSeq')
				},
				success:function(data){
					// console.log("성공");
					// console.log(data);


					$('#replyList_Warpper').empty();
					
					let replyList = '<ul id="replyList" class="ReviewList">';
                    let editAndDelButton = "";

					$.each(data, function(index, item){

						/* if depth ==1 continue?? */
						/* if depth == 0 {... } if depth == 1{...} */

                        if(userId == item.user_id){
                            editAndDelButton = '<button class="ReviewMetadata_ReportButton" id="replyModify" type="button" replySeq="'+item.reply_seq+'" content="'+item.reply_content+'">수정</button>&nbsp;<button id="replyDelete" class="ReviewMetadata_ReportButton" type="button">삭제</button>';
                        }

						replyList += '<li class="ReviewItem"><div class="ReviewItem_Left"><span class="StarRating_IconBox" style="width: 60px; height: 12px;"><span class="StarRating_Icon_Background" style="width: 60px; height: 12px;"></span><span class="StarRating_Icon_Foreground_Mask" style="width: '+item.reply_star_rate*12+'px; height: 12px;"><span class="StarRating_Icon_Foreground" style="width: 60px; height: 12px;"></span></span></span>';
                        
                        replyList += '<ul class="ReviewerMetadata_List"><li class="ReviewerMetadata_UserId">'+item.user_id+'</li><li class="ReviewMetadata_Report">'+editAndDelButton+'</li></ul>';
                        
                        replyList += '<ul class="ReviewMetadata_List"><li class="ReviewMetadata_Date">'+item.reply_date+'</li></ul></div>';
                        
                        replyList += '<div class="ReviewItem_Right"><div class="ReviewItem_Right_Top"><div class="ReviewContent"><div class="reply_content_'+item.reply_seq+'">'+item.reply_content+'</div></div>';
                        
                        replyList += ' </div>';
                        
					});

                    replyList += '</ul>';

					$('#replyList_Warpper').append(replyList);


				},
				error : function(){
					console.log("GetReplyList.ajax 에러");
					}
				});
					
    	   
    	   // 리뷰 남기기
    	$('#reviewWriteBtn').click(function(){

            console.log($('#choiceStarRating').children('input:checked').length);

            if(($('#replyContent').val() == "")||($('#choiceStarRating').children('input:checked').length == 0)){
                alert('리뷰 내용과 별점을 모두 입력해주세요.');
            }else{

                $.ajax({
    			url:"ReplyWrite.ajax",
				type:"POST",
				dataType:"json",
				data:{
					book_seq : $('#ReviewForm').attr('bookSeq'),
					reply_content : $('#replyContent').val(),
					user_id : $('#ReviewForm').attr('userid'),
					reply_star_rate : $('#choiceStarRating').children('input:checked').val()
				},
				success:function(data){

                    

					$('#replyList_Warpper').empty();
					
					let replyList = '<ul id="replyList" class="ReviewList">';
                    let editAndDelButton = "";

					$.each(data, function(index, item){

						/* if depth ==1 continue?? */
						/* if depth == 0 {... } if depth == 1{...} */

                        if(userId == item.user_id){
                            editAndDelButton = '<button class="ReviewMetadata_ReportButton" id="replyModify" type="button" replySeq="'+item.reply_seq+'" content="'+item.reply_content+'">수정</button>&nbsp;<button id="replyDelete" class="ReviewMetadata_ReportButton" type="button">삭제</button>';
                        }

						replyList += '<li class="ReviewItem"><div class="ReviewItem_Left"><span class="StarRating_IconBox" style="width: 60px; height: 12px;"><span class="StarRating_Icon_Background" style="width: 60px; height: 12px;"></span><span class="StarRating_Icon_Foreground_Mask" style="width: '+item.reply_star_rate*12+'px; height: 12px;"><span class="StarRating_Icon_Foreground" style="width: 60px; height: 12px;"></span></span></span>';
                        
                        replyList += '<ul class="ReviewerMetadata_List"><li class="ReviewerMetadata_UserId">'+item.user_id+'</li><li class="ReviewMetadata_Report">'+editAndDelButton+'</li></ul>';
                        
                        replyList += '<ul class="ReviewMetadata_List"><li class="ReviewMetadata_Date">'+item.reply_date+'</li></ul></div>';
                        
                        replyList += '<div class="ReviewItem_Right"><div class="ReviewItem_Right_Top"><div class="ReviewContent"><div class="reply_content_'+item.reply_seq+'">'+item.reply_content+'</div></div>';
                        
                        replyList += ' </div>';
                    
					});

                    replyList += '</ul>';


                    seeMoreButton += '<button class="RUIButton RUIButton-color-gray RUIButton-size-large RUIButton-outline RUIButton-borderWidth-thick ReviewList_ShowMoreButton"><span class="ReviewList_ShowMoreButton_Count">'+'n'+'</span>개 더보기<svg class="RSGIcon RSGIcon-arrowDown RSGIcon-arrow1Down ReviewList_ShowMoreButton_Icon RUIButton_SVGIcon" viewBox="0 0 48 28" width="48" height="28"><path d="M48 .6H0l24 26.8z"></path></svg></button>';


					$('#replyList_Warpper').append(replyList);

                    $('#replyContent').val("");
                    $('input[name="MyStarRating"]').removeAttr('checked');   
                        
                    },
                    error: function(){
                        console.log("에러");
                    }
                });

            }

    	});

                //리뷰 수정 창 띄우기
                $(document).on("click","#replyModify",function(){
                   
                   let modify = "";
                   
                   modify += '<div class="input-group">';
                   modify += '<input type="text" style="background-color:white;width:85%;margin-right:4px;padding:8px 16px 8px 16px;" name="content_'+$(this).attr("replySeq")+'" value="'+$(this).attr("content")+'"/>';
                   modify += '<button style="margin-right:4px;" class="btn btn-rose" type="button" id="updateReply" replySeq="'+$(this).attr("replySeq")+'">&nbsp;&nbsp;수정&nbsp;&nbsp;</button>';
                   modify += '<button class="btn btn-white" type="button" id="updateCancel" replySeq="'+$(this).attr("replySeq")+'" content="'+$(this).attr("content")+'">&nbsp;&nbsp;취소&nbsp;&nbsp;</button>';
                   modify += '</div>';
                   
                   $('.reply_content_'+$(this).attr("replySeq")).html(modify);
               });
               
               //리뷰 수정하기
               $(document).on("click","#updateReply",function(){
                   console.log("수정버튼 클릭");
                   
                   let data = {
                          user_id : userId,
                          reply_seq : $(this).attr("replySeq"),
                          book_seq  : bookSeq,
                          reply_content : $('[name=content_'+$(this).attr("replySeq")+']').val()
                             };
                 console.log(data);
                 $.ajax(
                       {
                          url : "ReplyModify.ajax",  
                          dataType : "JSON",           
                          type : "POST",
                          data : data ,
                          success : function(data){

                            $('#replyList_Warpper').empty();
					
					let replyList = '<ul id="replyList" class="ReviewList">';
                    let editAndDelButton = "";

					$.each(data, function(index, item){

						/* if depth ==1 continue?? */
						/* if depth == 0 {... } if depth == 1{...} */

                        if(userId == item.user_id){
                            editAndDelButton = '<button class="ReviewMetadata_ReportButton" id="replyModify" type="button" replySeq="'+item.reply_seq+'" content="'+item.reply_content+'">수정</button>&nbsp;<button id="replyDelete" class="ReviewMetadata_ReportButton" type="button">삭제</button>';
                        }

						replyList += '<li class="ReviewItem"><div class="ReviewItem_Left"><span class="StarRating_IconBox" style="width: 60px; height: 12px;"><span class="StarRating_Icon_Background" style="width: 60px; height: 12px;"></span><span class="StarRating_Icon_Foreground_Mask" style="width: '+item.reply_star_rate*12+'px; height: 12px;"><span class="StarRating_Icon_Foreground" style="width: 60px; height: 12px;"></span></span></span>';
                        
                        replyList += '<ul class="ReviewerMetadata_List"><li class="ReviewerMetadata_UserId">'+item.user_id+'</li><li class="ReviewMetadata_Report">'+editAndDelButton+'</li></ul>';
                        
                        replyList += '<ul class="ReviewMetadata_List"><li class="ReviewMetadata_Date">'+item.reply_date+'</li></ul></div>';
                        
                        replyList += '<div class="ReviewItem_Right"><div class="ReviewItem_Right_Top"><div class="ReviewContent"><div class="reply_content_'+item.reply_seq+'">'+item.reply_content+'</div></div>';
                        
                        replyList += ' </div>';
                    
					});

                    replyList += '</ul>';


                    seeMoreButton += '<button class="RUIButton RUIButton-color-gray RUIButton-size-large RUIButton-outline RUIButton-borderWidth-thick ReviewList_ShowMoreButton"><span class="ReviewList_ShowMoreButton_Count">'+'n'+'</span>개 더보기<svg class="RSGIcon RSGIcon-arrowDown RSGIcon-arrow1Down ReviewList_ShowMoreButton_Icon RUIButton_SVGIcon" viewBox="0 0 48 28" width="48" height="28"><path d="M48 .6H0l24 26.8z"></path></svg></button>';


					$('#replyList_Warpper').append(replyList);

                    $('#replyContent').val("");
                    $('input[name="MyStarRating"]').removeAttr('checked'); 


                          }
                       });

               });



               //리뷰 삭제도 하기,,
               /* $(document).on("click","#replyDelete"){
                   console.log("삭제 버튼 클릭");
                   let data = {
                           reply_seq : $(this).attr("replySeq")
                   }
                   $.ajax({
                       url : "ReplyDelete.ajax",
                       dataType : "JSON",
                       type : "POST",
                       data : data,
                       success : function(data){
                           
                       }
                   })
               }); */


    	   
        
	        //리뷰 입력창 글자수 한글 150자 제한하기
	        $('#replyContent').keyup(function(){
	            if($('#replyContent').val().length > 150){
	                $('#replyContent').val($('#replyContent').val().substring(0,150));
	            }
	         });
    	   
        
	        //책소개 계속보기
	        $('#BookDetail_ContentTruncButton').click(function(){
	            console.log('클릭 ');
	            $('#BookDetail_Description').empty(); 
	            $('#BookDetail_Description').append('${book.description}');
	        });

    	     
        	$('.StarRatingInput_Label').click(function() {
             //리뷰 왕별 click하면 채워지게 만들기 (댓글에 들어가는 별점 여기서 적용되게 해야함)
             $('.StarRatingInput_Label').removeClass('StarRatingInput_Label-filled');
             $('label:lt('+$(this)[0].dataset.rating+')').addClass('StarRatingInput_Label-filled');
             $('.StarRatingInput_Label').removeAttr('checked');
             $(this).attr('checked', 'checked');


             // 별점 클릭하면 상단에 내가 선택한 점수 출력
            $('#StarRatingForm_text').empty();
            let myRating = '<div class="MyStarRatingStatus">';
                myRating += '<p class="MyStarRatingStatus_Description">내가 남긴 별점 ';
                myRating += '<span class="MyStarRatingStatus_Rating">'+$(this).find('.a11y')[0].innerText+'</span></p>';
                myRating += '<button id="MyStarRatingStatus_CancelButton" class="MyStarRatingStatus_CancelButton" type="button">취소</button></div>';
    
                $('#StarRatingForm_text').append(myRating);

        });

            //별점 취소
        $(document).on("click", "#MyStarRatingStatus_CancelButton", function() {
            $('#StarRatingForm_text').empty();
            $('#StarRatingForm_text').append('<p class="StarRatingTooltip_Guide" style="padding: 30px auto;">이 책을 평가해주세요!</p>');
            $('.StarRatingInput_Label').removeAttr('checked');
            $('.StarRatingInput_Label').removeClass('StarRatingInput_Label-filled');
            
        });

            //리뷰 왕별 hover하면 채워지게 만들기 
        $('.StarRatingInput_Label').hover(function() {
                $('.StarRatingInput_Label').addClass('StarRatingInput_Label-filled');
                $(this).nextAll('label').removeClass('StarRatingInput_Label-filled');
            }, function() {
                $('.StarRatingInput_Label').removeClass('StarRatingInput_Label-filled');
                $('label:lt('+$('label[class=StarRatingInput_Label][checked=checked]')[0].dataset.rating+')').addClass('StarRatingInput_Label-filled');
        });
        
        
       });

   </script>

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



    </body>

</html>
