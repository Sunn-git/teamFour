<%@page import="kr.or.book4zo.dto.PostDto"%>
<%@page import="kr.or.book4zo.dao.PostDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
	List postlist  =(List)request.getAttribute("postlist"); //
	int listcount  =(Integer)request.getAttribute("listcount"); //
	int nowpage    =(Integer)request.getAttribute("page"); //현재 페이지
	int maxpage    =(Integer)request.getAttribute("maxpage"); //페이지 마지막 번호
    int startpage  =(Integer)request.getAttribute("startpage"); //
	int endpage    =(Integer)request.getAttribute("endpage"); //
	
	//새글 표시
	SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
	Date d = new Date();
	
	Date d2 = df.parse(df.format(d));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post LIST</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>
	<c:set var="userid" value="${sessionScope.userid}"/>

	<c:choose>
		<c:when test="${fn:contains(userid, 'admin')==true}">
			<c:import url="/WEB-INF/include/#.jsp"/>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/include/#.jsp"/>
		</c:otherwise>
	</c:choose>
<!-- 게시판 리스트 -->

<div align="center">
	<table width=80% border="0" cellpadding="0" cellspacing="0">
<%
if(listcount > 0){
%>
	<tr align="center" valign="middle">
		<td colspan="4"><h2>Post LIST</h2></td>
		<td align=right>
			<font size=2>글 개수 : ${listcount }</font>
		</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
			<div align="center">번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%">
			<div align="center">제목</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="14%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="17%">
			<div align="center">날짜</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="11%">
			<div align="center">조회수</div>
		</td> 

	</tr>
	
	<%
		PostDao postdao = new PostDao();
		for(int i=0;i<postlist.size();i++){
			PostDto bl = (PostDto)postlist.get(i);
			int commentCount = postdao.getCommentCount(bl.getPost_Seq());
	%>
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<%=bl.getPost_Seq()%>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			
			<a href="BoardDetail.board?num=<%=bl.getPost_Seq()%>">
				<%=bl.getBoard_subject()%> 
				<% if(commentCount != 0){ %> 
				[<%=commentCount  %>]
				<%} %>
			</a>
			<%-- <%System.out.print(df.parse(bl.getBoard_date())); %> --%>
			<%
			
			//new 마크 띄우는 코드 
			Date d3 = df.parse(bl.getBoard_date());
			if(d2.getDay() - d3.getDay() == 0){ %>
				<img alt="new" src="imgs/new.gif">
			<%} %>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_name() %></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_date() %></div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_readcount() %></div>
		</td>
	</tr>
	<%} %>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%if(nowpage<=1){ %>
			[이전]&nbsp;
			<%}else{ %>
			<a href="Postlist.Post?page=<%=nowpage-1 %>">[이전]</a>&nbsp;
			<%} %>
			
			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="Postlist.Post?page=<%=a %>">[<%=a %>]</a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowpage>=maxpage){ %>
			[다음]
			<%}else{ %>
			<a href="Postlist.Post?page=<%=nowpage+1 %>">[다음]</a>
			<%} %>
		</td>
	</tr>
	<%
    }
	else
	{
	%>
	<tr align="center" valign="middle">
		<td colspan="4">Post LIST</td>
		<td align=right>
			<font size=2>등록된 글이 없습니다.</font>
		</td>
	</tr>
	<%
	}
	%>
	<tr align="right">
		<td colspan="5">
	   		<a href="PostWrite.post">[글쓰기]</a>
		</td>
	</tr>
</table>
	
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

</body>
</html>