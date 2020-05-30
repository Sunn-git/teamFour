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
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/material-kit.css?v=2.0.7"
	rel="stylesheet" />
	

</head>
<body>

<c:set var="user_id" value="${sessionScope.user_id}"/>
<c:set var="currentPost" value="${requestScope.CurrentPost}"/>

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
<!-- 게시판 수정 -->
<div style="max-width:1000px; margin:0 auto; padding: 100px 80px 170px 80px;background-color:white;">
<form class="form" method="post" action="PostDetailView.post"
enctype="multipart/form-data" name="postform">
<table cellpadding="0" cellspacing="0" >
	<tr style="color:tomato;">
		<td colspan="5">${currentPost.user_id}님의 포스트 이야기</td>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<h2><b>${currentPost.post_title}</b></h2>
		</td>
	</tr>
	
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=100% style="table-layout:fixed;min-height:280px;">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12;">
						<div style="margin:40px 40px 80px 40px;">${currentPost.post_contents}</div>
					</td>
				</tr>
			</table>
			
		</td>
	</tr>

	<!-- 첨부파일 안나오는거 발견   -->
	<tr>
		<td style="font-family:돋음; font-size:12">
			<c:choose>
				<c:when test="${currentPost.post_upload_file == 'N'}">
					<p style="color:#a7a7a7;">&nbsp;&nbsp;첨부파일이 없습니다</p>
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
			<c:if test="${currentPost.user_id == user_id }">
				<a class="btn btn-rose btn-round" href="PostModify.post?post_seq=${currentPost.post_seq}">
					&nbsp;수정&nbsp;
				</a> 
				<a id="confirmDelete" class="btn btn-white btn-round" href="Delete.post?post_seq=${currentPost.post_seq}">
					&nbsp;삭제&nbsp;
				</a>
			</c:if>
		</td>
		
	</tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<br>
			<a class="btn btn-block btn-gray btn-round" href="Detail.book?bookSeq=${currentPost.book_seq}">
					&nbsp;&nbsp;&nbsp;책으로 돌아가기&nbsp;&nbsp;&nbsp;
				</a>
		</td>
	</tr>
	
	
	
</table>
</div>
</form>
<script>
$('#confirmDelete').click(function() {
	/* var result = confirm('정말로 삭제하시겠습니까?'); 
	if(result) { //yes 
		location.replace('./Delete.post?post_seq='+${currentPost.post_seq}); 
	} else {
		//no 
	}  */
});

</script>
</body>
</html>