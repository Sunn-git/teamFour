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
	<form class="form form-row" method="post" action="PostWrite_s.post"
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
							placeholder="제목을 입력하세요" value="" required />
					</div>
				</td>
			</tr>
			<tr>
				
				<td><textarea id="summernote" name="post_contents" cols="67"
						rows="20"  required></textarea>
				</td>
			</tr>
			<tr>
				
				<td><input name="file" type="file"/><br></td>
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
					<a href="javascript:addpost()" class="btn btn-round btn-rose">&nbsp;&nbsp;등록&nbsp;&nbsp;</a>
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
</body>
</html>