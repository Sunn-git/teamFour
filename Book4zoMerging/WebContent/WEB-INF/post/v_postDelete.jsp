<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
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
</head>
<body style="background-color:#e8eff4">
<c:set var="currentPost" value="${requestScope.CurrentPost}"/>
<form name="deleteForm" action="DeleteAction.post?post_seq=${currentPost.post_seq}" 
	method="post">
<input hidden value="${currentPost.book_seq}" name="bookSeq">
<div class="container" style=" width:480px; margin-top:80px;">
	<div class="card card-body" style="height:480px;padding:80px 60px 60px 60px;">
	<h2>정말로 삭제하시겠습니까?</h2>
	<p style="font-size:18px;"><span style="color:tomato;">${currentPost.post_title}</span> 게시글을 삭제합니다 ㅠ_ㅠ</p>
		<div class="row">
			<div class="input-group col-8" style="margin:160px auto 40px auto;">
				<a class="btn btn-round btn-rose" href="javascript:deleteForm.submit()"style="margin-right:4px; padding:12px 28px 12px 28px;">삭제하기</a>
				<a class="btn btn-round btn-white" href="javascript:history.go(-1)"style=" padding:12px 28px 12px 28px;">돌아가기</a>
			</div>
		</div>
	</div>
</div>
<!-- <table border=1>
<tr>
	<td>
		<font size=2>정말로 삭제하시겠습니까?</font>
	</td>
</tr>
<tr>
	<td colspan=2 align=center>
		<a class="btn btn-round btn-rose" href="javascript:deleteForm.submit()">삭제</a>
		&nbsp;&nbsp;
		<a class="btn btn-round btn-rose" href="javascript:history.go(-1)">돌아가기</a>
	</td>
</tr>
</table> -->
</form>
</body>
</html>