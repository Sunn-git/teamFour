<<<<<<< HEAD
<%@page import="kr.or.book4zo.dto.PostDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
//코드구현
  PostDto postdto=  (PostDto)request.getAttribute("postdto");

//String sFilePath = sDownLoadPath + "\\" + filename;
%>
=======
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

>>>>>>> d82360678ed6dd85f9c03fd50978ed93b719cbc2

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
<c:set var="userid" value="${sessionScope.userid}"/>
<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">POST</td>
	</tr>
	<tr class="subject">
		<td><h3>제목 들어갈 곳</h3></td> <!-- 수정되어야함 -->
<<<<<<< HEAD

=======
>>>>>>> d82360678ed6dd85f9c03fd50978ed93b719cbc2
		<td>
			
			<c:if test="${'.writer' == userid }"><!-- 수정되어야함 -->
				<img> <!-- 땡땡땡 아이콘 넣어야하는 곳 드롭박스로 열리게 해서 아이디값이랑 WRITER가 같으면 수정가능하게 --> 
				<button class="btn btn-rose btn-round" href="postModify.post?num=">
				&nbsp;수정&nbsp;
				</button>
				<button class="btn btn-rose btn-round" href="postDelete.post?num=">
				&nbsp;삭제&nbsp;
				</button>
			</c:if>
		</td>
	</tr>
	<tr>
		<td class="writer">글쓴이</td> <!-- 수정되어야함 -->
<<<<<<< HEAD

=======
>>>>>>> d82360678ed6dd85f9c03fd50978ed93b719cbc2
		<td class="write_date">몇년 몇월 몇일</td><!-- 수정되어야함 -->
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
<<<<<<< HEAD
		
=======

>>>>>>> d82360678ed6dd85f9c03fd50978ed93b719cbc2
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>

		<td>
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top">
						내용 뿌려줄 곳
<<<<<<< HEAD
					
=======
>>>>>>> d82360678ed6dd85f9c03fd50978ed93b719cbc2
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
</table>

<div class="">
<img alt="" src=""> <!-- 수정되어야함 / 삭제가능성 있음 --> 
회원 프로필 뿌려질 곳
<<<<<<< HEAD


=======
>>>>>>> d82360678ed6dd85f9c03fd50978ed93b719cbc2
</div>

</body>
</html>