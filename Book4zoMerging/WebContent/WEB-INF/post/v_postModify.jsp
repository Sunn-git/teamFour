<<<<<<< HEAD
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
<c:set var="currentPost" value="${requestScope.CurrentPost}"/>
${postdto }
<!-- 게시판 수정 -->
									<!--PostModifyView_s.post  -->
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
			
			 <a href="./PostModifyAction.post?num=${postdto.post_seq}"> 
			[임시수정]
			</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[임시뒤로]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>


<div class="">
<img alt="" src=""> <!-- 수정되어야함  세션스코프 유저 이미지로 받아오기--> 
회원 프로필 뿌려질 곳


<!-- 게시판 수정 -->

</div>
</form>
=======
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>게시판</title>
<script language="javascript">
		function addpost(){
			postform.submit();
		}
</script>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/material-kit.css?v=2.0.7"
	rel="stylesheet" />
</head>
<!-- 게시판 등록 -->
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
	<div style="height: 10px;"></div>
	<div class="row">
	<div class= "col-md-9 ml-auto mr-auto">
	<form class="form form-row" method="post" action="PostModifyAction.post?post_seq=${currentPost.post_seq}"
		enctype="multipart/form-data" name="postform">
		<table class="col" >
			<tr>
				<td> 
					<input type="text" class="form-control" name="user_id" size="10" maxlength="10" placeholder="글쓴이" value="${user_id}" hidden />
               		<input type="text" name="bookSeq" value="${param.bookSeq}" hidden/>
               </td>
			</tr>
			<tr>
				
				<td>
					<div style="margin-bottom:8px;">
						<input type="text" class="form-control" name="post_title"
							 value="${currentPost.post_title }" required />
					</div>
				</td>
			</tr>
			<tr>
				
				<td><textarea id="summernote" name="post_contents" cols="67"
						rows="20" value=""  required>${currentPost.post_contents}</textarea>
				</td>
			</tr>
			<tr>
				
				<td><input name="file" type="file"/><br> 수정 전 업로드한 파일 명 : ${currentPost.post_upload_file} </td>
			</tr>
			<tr bgcolor="cccccc">
				<td colspan="2" style="height: 1px;"></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td align="center">
					<a href="javascript:history.go(-1)" class="btn btn-round btn-white">&nbsp;&nbsp;뒤로&nbsp;&nbsp;</a>
					<button type="submit" class="btn btn-round btn-rose">&nbsp;&nbsp;수정&nbsp;&nbsp;</button>
				</td>
			</tr>
		</table><br>
	</form>
	</div>
	</div>
	<!-- 게시판 등록 -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$('#summernote').summernote({
				height : 500,
				minHeight : null,
				maxHeight : null,
				focus : true
			});
		});
	</script>
>>>>>>> s_after_j
</body>
</html>