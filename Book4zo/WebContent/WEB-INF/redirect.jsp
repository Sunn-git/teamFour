<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String msg = (String)request.getAttribute("msg");
  String url = (String)request.getAttribute("url");
  String user_image = (String)request.getAttribute("user_image");
  request.setAttribute("user_image", user_image);
  if(msg != null && url != null){
%>
	<script>
		alert('<%= msg %>');		
	    location.href='<%=url%>';
	</script>
	
<%	  
  }
%>