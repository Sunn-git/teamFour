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
        <c:set var="userid" value="${sessionScope.userid}"/>
		<c:choose>
			<c:when test="${userid != null}">
			<c:if test="${userid == 'admin'}">
				<jsp:include page="/WEB-INF/common/v_navAdmin.jsp"/>
			</c:if>
				<jsp:include page="/WEB-INF/common/v_navMember.jsp"/>
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
                                <a href="PostWriteAction.post" class="btn btn-rose btn-lg" role="button" aria-disabled="true">포스트 작성하기</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <section class="PageBookDetail_Panel">
                <h2 class="PageBookDetail_PanelTitle"><strong>책소개</strong></h2>
                <div class="PageBookDetail_PanelContent">
                	<div id = "BookDetail_Description">
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
                    <div class="card text-left col-sm-10" style="border: 1px solid lightgray; margin: 10px auto 20px auto;">
                        <div class="card-body">
                            <div class="col-sm-3" style="float: left; width: 100%;">썸네일 영역</div>
                            <div class="col-sm-9" style="float: left;">
                                <h6 class="card-subtitle mt-1 text-muted">${book.title} - 저자 ${book.author}</h6>
                                <h4 class="PageBookDetail_PanelTitle">포스트 제목 입니다</h4>
                                
                                <p class="card-text">포스트 내용 입니다. 포스트 내용 입니다. 포스트 내용 입니다.</p>
      
                                <a href="javascript:;" class="btn btn-rose btn-round" style="position: relative; margin: 0;"> {아이디} 님의 포스트 읽으러 가기</a>
                            </div>
                        </div>
                    </div>
                    <div class="card text-left col-sm-10" style="border: 1px solid lightgray; margin: 10px auto 20px auto;">
                        <div class="card-body">
                            <div class="col-sm-3" style="float: left; width: 100%;">썸네일 영역</div>
                            <div class="col-sm-9" style="float: left;">
                                <h6 class="card-subtitle mt-1 text-muted">${book.title} - 저자 ${book.author}</h6>
                                <h4 class="PageBookDetail_PanelTitle">포스트 제목 입니다</h4>
                                
                                <p class="card-text">포스트 내용 입니다. 포스트 내용 입니다. 포스트 내용 입니다.</p>
      
                                <a href="javascript:;" class="btn btn-rose btn-round" style="position: relative; margin: 0;"> {아이디} 님의 포스트 읽으러 가기</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="text-center">
                        <button class="RUIButton RUIButton-color-gray RUIButton-size-large RUIButton-outline RUIButton-borderWidth-thick ReviewList_ShowMoreButton col-sm-10">
                            <span class="ReviewList_ShowMoreButton_Count">n</span>개 더보기
                            <svg class="RSGIcon RSGIcon-arrowDown RSGIcon-arrow1Down ReviewList_ShowMoreButton_Icon RUIButton_SVGIcon" viewBox="0 0 48 28" width="48" height="28">
                                <path d="M48 .6H0l24 26.8z"></path>
                            </svg>
                        </button>
                    </div>


                </div>
            </section>


            <section class="PageBookDetail_Panel Reviews_Wrapper">
                <div class="Reviews"><span class="a11y">리뷰</span>
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
                                                                                        
                                            <!-- 원래 내용 -->
                                            
                                            <p class="StarRatingTooltip_Guide" style="padding: 30px auto;">이 책을 평가해주세요!</p>
                                                    

                                            <!-- 별점 클릭 시 보일 부분 -->
                                            <!--
                                            <div class="MyStarRatingStatus">
                                                <p class="MyStarRatingStatus_Description">내가 남긴 별점
                                                    <span class="MyStarRatingStatus_Rating">3.0</span>
                                                </p>
                                                <button class="MyStarRatingStatus_CancelButton" type="button">취소</button>
                                            </div>
                                           -->
                                        </div>

                                        <!-- 왕별점 부분 mouseover, mouseout 으로 클래스 줘서 별 채우는 이벤트 주기 -->
                                        <!-- StarRatingInput_Label-filled -->
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
            
                            <div class="ReviewForm" userid="${user_id}">
                                <textarea class="ReviewTextarea col-sm-12" id="reviewContent" name="reviewContent" title="리뷰 입력" placeholder="리뷰를 작성해주세요. (최대 150자 까지 작성할 수 있습니다)" style="height: 45.9844px;"></textarea>
                                <div class="ReviewForm_ButtonsWrapper">
                                    <div style="display: inline-block;"></div>
                                    <button id="reviewWriteBtn" class="btn btn-rose btn-sm center">리뷰 남기기</button>

                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="ReviewListHeader">
                        <!-- 이거 리스트 사라지면 구분선 사라짐 -->
                        <ul class="RSGTab_List">
                            <li class="RSGTab_List_Item"></li>
                            <li class="RSGTab_List_Item"></li>
                        </ul>


                        <ul class="PipeDelimitedList">
                            <li class="PipeDelimitedList_Item active"><button type="button">최신순<span class="a11y">리스트
                                        보기</span></button></li>
                            <li class="PipeDelimitedList_Item"><button type="button">별점 높은순<span class="a11y">리스트 보기</span></button>
                            </li>
                        </ul>
                    </div>
                    <div class="ReviewsList_Wrapper">
                        <ul class="ReviewList">
                            <li class="ReviewItem">
                                <div class="ReviewItem_Left"><span class="StarRating_IconBox"
                                        style="width: 60px; height: 12px;"><span class="StarRating_Icon_Background"
                                            style="width: 60px; height: 12px;"></span><span class="StarRating_Icon_Foreground_Mask"
                                            style="width: 60px; height: 12px;"><span class="StarRating_Icon_Foreground"
                                                style="width: 60px; height: 12px;"></span></span></span>
                                    <ul class="ReviewerMetadata_List">
                                        <!-- 유저 아이디 들어가는 부분 -->
                                        <li class="ReviewerMetadata_UserId">nic***</li>
                                    </ul>
                                    <ul class="ReviewMetadata_List">
                                        <!-- 작성 날짜 -->
                                        <li class="ReviewMetadata_Date">2020.04.22.</li>
                                    </ul>
                                </div>
                                <div class="ReviewItem_Right">
                                    <div class="ReviewItem_Right_Top">
                                        <!-- 댓글 작성 내용 -->
                                        <div class="ReviewContent"><span width="0"><span><span>너무 재밌습니다.반전에 반전 결말을
                                                        예측하기어렵네요~</span></span><span
                                                    style="position: fixed; visibility: hidden; top: 0px; left: 0px;"><span
                                                        class="Review_Ellipsis">...<button class="Review_ReadMoreButton">계속
                                                            읽기</button></span></span></span></div>
                                        <ul class="ReviewButtons_List">
                                            <li class="ReviewButtons_OpenCommentsButtonItem">
                                                <button
                                                    class="RUIButton RUIButton-color-gray RUIButton-size-small RUIButton-outline ReviewButtons_OpenCommentsButton">
                                                    <svg
                                                        class="RSGIcon RSGIcon-speechbubble RSGIcon-speechbubble2 ReviewButtons_CommentIcon"
                                                        viewBox="0 0 56 48" width="56" height="48">
                                                        <path
                                                            d="M36.6 0H19.4C8.9 0 .4 8.5.4 18.9c0 9.2 6.7 16.9 15.5 18.5v7.2c0 1.4.8 2.6 2.1 3.2.5.1.9.2 1.4.2.9 0 1.8-.3 2.4-1l9.6-9.3h5.2c10.4 0 18.9-8.5 18.9-18.9C55.6 8.5 47.1 0 36.6 0z">
                                                        </path>
                                                    </svg>
                                                    <span class="ReviewButtons_CommentLabel">댓글</span>
                                                    <!-- 댓글 갯수 > 0 일때 표시되는 부분 -->
                                                    <span class="ReviewButtons_CommentCount">1</span>
                                                </button></li>

                                                    <!-- 좋아요 버튼.. 시간 없으면 빼기  -->
                                            <!-- <li class="ReviewButtons_LikeButtonItem"><button
                                                    class="RUIButton RUIButton-color-gray RUIButton-size-small RUIButton-outline ReviewButtons_LikeButton"><svg
                                                        class="RSGIcon RSGIcon-thumbUp RSGIcon-thumbUp1 ReviewButtons_LikeIcon RUIButton_SVGIcon"
                                                        viewBox="0 0 44 49" width="44" height="49">
                                                        <g>
                                                            <path
                                                                d="M41.7 32.7s2.3-1.3 2.1-4.3c-.1-1.9-2.4-3.7-2.4-3.7s1-1.8 1-2.6 0-2.9-2.1-4-12.1.4-12.1.4 1-5.8 1.1-6.6c.1-.8 1-1.7 1.1-4.4.2-3.5-1.2-7.6-4.2-7.5C23.1.1 24 5 24 5.8c0 .8-2.2 5.8-4.2 9-1.9 3.2-4.2 4.6-4.9 7.8-.6 2.7-3.6 3.8-3.6 3.8-.9.2-.9 1-.8 1.7 1.9 11.7 3.8 18 3.8 18s5 1.1 6.8 1.2c1.8.1 1.5.2 3.3.6 1.8.3 5.5 0 8.5 0s4.2-.7 7.1-2.8c2.9-2.1.8-5 .8-5s2.4-.6 2.4-3.8c0-2.8-1.5-3.6-1.5-3.6zM7.7 28.1c-.2-.9-1.1-1.6-2-1.6H2c-.9 0-1.7.7-1.8 1.6v18c0 .9.8 1.6 1.7 1.6h8.2c.9 0 1.3-1.2 1.1-2.2L7.7 28.1z">
                                                            </path>
                                                        </g>
                                                    </svg><span class="ReviewButtons_LikeCount">0</span></button></li> -->
                                        </ul>
                                    </div>
                                    
                                    <!-- 댓글 버튼 누르면 비동기로 댓글 입력창 뜨게하기 -->
                                    <div class="Comments" style="background-color: rgba(229, 145, 197, 0.192);">
                                        <!-- 대댓 목록 css로 bg color 주기 -->
                                        <ul class="CommentList">
                                            <li class="CommentItem">
                                                <div class="CommentItem_Content">
                                                    <p>내가 이걸 3천원이나 주고 대여했다니ㅠㅠ</p>
                                                </div>
                                                <div class="CommentItem_Metadata">
                                                    <span class="CommentItem_MaskedUId">
                                                        <span class="a11y">작성자</span>ceo***
                                                    </span>
                                                    <span class="CommentItem_CommentDate">
                                                        <span class="a11y">작성일</span>2019.05.10. 19:22
                                                    </span>
                                                </div>
                                            </li>
                                        </ul>

                                        <!-- 대댓 입력 창 -->
                                        <div class="CommentForm_Wrapper">
                                            <div class="CommentForm">
                                                <textarea class="CommentForm_Textarea" name="commentContent" title="댓글 입력" placeholder="이 곳에 댓글을 남겨주세요." style="height: 30px!important;"></textarea>
                                                <button class="btn btn-rose btn-sm" style="margin: auto 10px auto 0;">댓글 달기</button>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </li>

                            <li class="ReviewItem">
                                <div class="ReviewItem_Left"><span class="StarRating_IconBox"
                                        style="width: 60px; height: 12px;"><span class="StarRating_Icon_Background"
                                            style="width: 60px; height: 12px;"></span><span class="StarRating_Icon_Foreground_Mask"
                                            style="width: 60px; height: 12px;"><span class="StarRating_Icon_Foreground"
                                                style="width: 60px; height: 12px;"></span></span></span>
                                    <ul class="ReviewerMetadata_List">
                                        <!-- 유저 아이디 들어가는 부분 -->
                                        <li class="ReviewerMetadata_UserId">nic***</li>
                                    </ul>
                                    <ul class="ReviewMetadata_List">
                                        <!-- 작성 날짜 -->
                                        <li class="ReviewMetadata_Date">2020.04.22.</li>
                                    </ul>
                                </div>
                                <div class="ReviewItem_Right">
                                    <div class="ReviewItem_Right_Top">
                                        <!-- 댓글 작성 내용 -->
                                        <div class="ReviewContent"><span width="0"><span><span>너무 재밌습니다.반전에 반전 결말을
                                                        예측하기어렵네요~</span></span><span
                                                    style="position: fixed; visibility: hidden; top: 0px; left: 0px;"><span
                                                        class="Review_Ellipsis">...<button class="Review_ReadMoreButton">계속
                                                            읽기</button></span></span></span></div>
                                        <ul class="ReviewButtons_List">
                                            <li class="ReviewButtons_OpenCommentsButtonItem">
                                                <button
                                                    class="RUIButton RUIButton-color-gray RUIButton-size-small RUIButton-outline ReviewButtons_OpenCommentsButton">
                                                    <svg
                                                        class="RSGIcon RSGIcon-speechbubble RSGIcon-speechbubble2 ReviewButtons_CommentIcon"
                                                        viewBox="0 0 56 48" width="56" height="48">
                                                        <path
                                                            d="M36.6 0H19.4C8.9 0 .4 8.5.4 18.9c0 9.2 6.7 16.9 15.5 18.5v7.2c0 1.4.8 2.6 2.1 3.2.5.1.9.2 1.4.2.9 0 1.8-.3 2.4-1l9.6-9.3h5.2c10.4 0 18.9-8.5 18.9-18.9C55.6 8.5 47.1 0 36.6 0z">
                                                        </path>
                                                    </svg>
                                                    <span class="ReviewButtons_CommentLabel">댓글</span>
                                                    <!-- 댓글 갯수 > 0 일때 표시되는 부분 -->
                                                    <span class="ReviewButtons_CommentCount">1</span>
                                                </button></li>

                                                    <!-- 좋아요 버튼.. 시간 없으면 빼기  -->
                                            <!-- <li class="ReviewButtons_LikeButtonItem"><button
                                                    class="RUIButton RUIButton-color-gray RUIButton-size-small RUIButton-outline ReviewButtons_LikeButton"><svg
                                                        class="RSGIcon RSGIcon-thumbUp RSGIcon-thumbUp1 ReviewButtons_LikeIcon RUIButton_SVGIcon"
                                                        viewBox="0 0 44 49" width="44" height="49">
                                                        <g>
                                                            <path
                                                                d="M41.7 32.7s2.3-1.3 2.1-4.3c-.1-1.9-2.4-3.7-2.4-3.7s1-1.8 1-2.6 0-2.9-2.1-4-12.1.4-12.1.4 1-5.8 1.1-6.6c.1-.8 1-1.7 1.1-4.4.2-3.5-1.2-7.6-4.2-7.5C23.1.1 24 5 24 5.8c0 .8-2.2 5.8-4.2 9-1.9 3.2-4.2 4.6-4.9 7.8-.6 2.7-3.6 3.8-3.6 3.8-.9.2-.9 1-.8 1.7 1.9 11.7 3.8 18 3.8 18s5 1.1 6.8 1.2c1.8.1 1.5.2 3.3.6 1.8.3 5.5 0 8.5 0s4.2-.7 7.1-2.8c2.9-2.1.8-5 .8-5s2.4-.6 2.4-3.8c0-2.8-1.5-3.6-1.5-3.6zM7.7 28.1c-.2-.9-1.1-1.6-2-1.6H2c-.9 0-1.7.7-1.8 1.6v18c0 .9.8 1.6 1.7 1.6h8.2c.9 0 1.3-1.2 1.1-2.2L7.7 28.1z">
                                                            </path>
                                                        </g>
                                                    </svg><span class="ReviewButtons_LikeCount">0</span></button></li> -->
                                        </ul>
                                    </div>
                                    
                                    <!-- 댓글 버튼 누르면 비동기로 댓글 입력창 뜨게하기 -->
                                    <div class="Comments" style="background-color: rgba(229, 145, 197, 0.192);">
                                        <!-- 대댓 목록 css로 bg color 주기 -->
                                        <ul class="CommentList">
                                            <li class="CommentItem">
                                                <div class="CommentItem_Content">
                                                    <p>내가 이걸 3천원이나 주고 대여했다니ㅠㅠ</p>
                                                </div>
                                                <div class="CommentItem_Metadata">
                                                    <span class="CommentItem_MaskedUId">
                                                        <span class="a11y">작성자</span>ceo***
                                                    </span>
                                                    <span class="CommentItem_CommentDate">
                                                        <span class="a11y">작성일</span>2019.05.10. 19:22
                                                    </span>
                                                </div>
                                            </li>
                                        </ul>

                                        <!-- 대댓 입력 창 -->
                                        <div class="CommentForm_Wrapper">
                                            <div class="CommentForm">
                                                <textarea class="CommentForm_Textarea" name="commentContent" title="댓글 입력" placeholder="이 곳에 댓글을 남겨주세요." style="height: 30px!important;"></textarea>
                                                <button class="btn btn-rose btn-sm" style="margin: auto 10px auto 0;">댓글 달기</button>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </li>
            
                        </ul><button
                            class="RUIButton RUIButton-color-gray RUIButton-size-large RUIButton-outline RUIButton-borderWidth-thick ReviewList_ShowMoreButton"><span
                                class="ReviewList_ShowMoreButton_Count">10</span>개 더보기<svg
                                class="RSGIcon RSGIcon-arrowDown RSGIcon-arrow1Down ReviewList_ShowMoreButton_Icon RUIButton_SVGIcon"
                                viewBox="0 0 48 28" width="48" height="28">
                                <path d="M48 .6H0l24 26.8z"></path>
                            </svg></button>
                    </div>
            
                </div>
            </section>


            
        </main>

   </div>

   <script>
       $(function() {
    	   
    	   // 리뷰 남기기
	       	$('#reviewWriteBtn').click(function(){
	       		console.log($('#replyContent').val());
	       		console.log($('.ReviewForm').attr('userid'));
	       		console.log($('#choiceStarRating').children('input:checked').val());
	       		$.ajax({
	       			url:"ReplyWrite.ajax",
	   				type:"POST",
	   				dataType:"json",
	   				data:{
	   					book_seq : 171,
	   					reply_content : $('#replyContent').val(),
	   					user_id : $('.ReviewForm').attr('userid'),
	   					reply_star_rate : $('#choiceStarRating').children('input:checked').val()
	   				},
	   				success:function(){
	   					console.log("성공");
	   					/* 확실치 않은데 해야할거같아서 일단 넣어놓음 */
	   					window.opener.location.reload();
	   		            self.close();
	   				},
	   				error: function(){
	   					console.log("에러");
	   				}
	       		});
	       	});
    	   
    	   
    	   
    	   
    	   //책소개 계속보기. 근데 리디에는 접기가 없다. 안해도 될까?
    	   $('#BookDetail_ContentTruncButton').click(function(){
    		   $('#BookDetail_Description').empty();
    		   $('#BookDetail_Description').append('${book.description}');
    	   	});
    	   
    	   
    	   //리뷰 입력창 글자수 한글 150자 제한하기
    	   $('#reviewContent').keyup(function(){
    		   if($('#reviewContent').val().length > 150){
    			   $('#reviewContent').val($('#reviewContent').val().substring(0,150));
    		   }
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
