<%@page import="kr.or.book4zo.dto.PostDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String id=(String)session.getAttribute("id");
	request.setCharacterEncoding("UTF-8");
	PostDto postdto = (PostDto)request.getAttribute("postdto");
%>

<html>
<head>
	<title>MVC 게시판</title>
	<script type="text/javascript">
	function modifypost(){
		modifyform.submit();
	}
	</script>
</head>

<body>
<c:set var="user_id" value="${sessionScope.user_id}"/>
<!-- 게시판 수정 -->

<form class="form" method="post" action="PostModifyAction.post"
enctype="multipart/form-data" name="modifyform">
<input type="hidden" name="post_seq" value="<%=postdto.getPost_seq() %>">
<input type="hidden" name="user_id" value="<%=id %>">
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">MVC 게시판</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="BOARD_SUBJECT" size="50" maxlength="100" 
				value="<%=postdto.getPost_title()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="BOARD_CONTENT" cols="67" rows="15">
			<%=postdto.getPost_contents() %></textarea>
		</td>
	</tr>
	<%if(!(postdto.getPost_upload_file()==null)){ %>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			&nbsp;&nbsp;<%=postdto.getPost_upload_file() %>
		</td>
	</tr>
	<%} %>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="javascript:modifyboard()">[임시수정]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[임시뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 수정 -->
</body>
</html>