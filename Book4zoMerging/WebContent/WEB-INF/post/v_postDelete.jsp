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
<body>
<c:set var="currentPost" value="${requestScope.CurrentPost}"/>
<form name="deleteForm" action="DeleteAction.post?post_seq=${currentPost.post_seq}" 
	method="post">
<table border=1>
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
</table>
</form>
</body>
</html>