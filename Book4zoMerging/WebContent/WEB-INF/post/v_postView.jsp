<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kr.or.book4zo.dto.PostDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%
//코드구현
request.setCharacterEncoding("UTF-8");
%>

<html>
<head>
	<title>POST</title>

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
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
</head>
<body>

<c:set var="user_id" value="${sessionScope.user_id}"/>
<c:set var="currentPost" value="${requestScope.CurrentPost}"/>
${currentPost }


<!-- 게시판 수정 -->
<form class="form" method="post" action="PostDetailView.post"
enctype="multipart/form-data" name="postform">
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">POST</td>
	</tr>
		
		<!-- sessionScope로 들어왔는데 아래 코드가 있어야하는건가용?? -->
		<tr>
			<td>
			
			<c:if test="${currentPost.user_id == user_id }"><!-- 내가 구현해야하는거란다... -->
				<img> <!-- 땡땡땡 아이콘 넣어야하는 곳 드롭박스로 열리게 해서 아이디값이랑 WRITER가 같으면 수정가능하게 --> 
				<button class="btn btn-rose btn-round" href="postModify.post?num=${currentPost.post_seq}">
				&nbsp;수정&nbsp; <!-- svg를 클릭해서 드롭다운 메뉴가 나온다 -->
				</button> 
				<button class="btn btn-rose btn-round" href="postDelete.post?num=${currentPost.post_seq}">
				&nbsp;삭제&nbsp;
				</button>
			</c:if>
		</td>
	</tr>
	
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
			${currentPost.post_title}
		</td>
	</tr>
	
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
						${currentPost.post_contents}
					</td>
				</tr>
			</table>
			
		</td>
	</tr>
	
	<!-- 첨부파일 안나오는거 발견   -->
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">첨부파일</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
			<c:choose>
				<c:when test="${currentPost.post_upload_file == 'N'}">
					&nbsp;&nbsp;첨부파일이 없습니다
				</c:when>
				<c:otherwise>
					<a href="./postUpload/${currentPost.post_upload_file}">
						${currentPost.post_upload_file}
					</a>
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	
		<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>			
			<a href="./PostModify.post?num=${currentPost.post_seq}">
			[임시수정]
			</a>&nbsp;&nbsp;
			<a href="./Delete.post?num=${currentPost.post_seq}"
			>
			[임시삭제]
			</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-2)">[처음부터]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
	
	
	
</table>

<div class="">
<img alt="" src=""> <!-- 수정되어야함  세션스코프 유저 이미지로 받아오기--> 
회원 프로필 뿌려질 곳


</div>
</form>
</body>
</html>