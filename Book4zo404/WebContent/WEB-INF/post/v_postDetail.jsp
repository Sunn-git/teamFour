<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//코드구현
//  request.setCharacterEncoding("UTF-8");
//  BoardDto board=  (BoardDto)request.getAttribute("boarddata");
//String sFilePath = sDownLoadPath + "\\" + filename;

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<!-- 
<style type="text/css">
	* {
		border : 1px solid black;
	}
</style>
 -->
 
</head>
<body>
<!--  
	<c:set var="userid" value="${sessionScope.userid}"/>

	<c:choose>
		<c:when test="${fn:contains(userid, 'admin')==true}">
			<c:import url="/WEB-INF/include/headerforAdmin.jsp"/>
		</c:when>
		<c:otherwise>
			<c:import url="/WEB-INF/include/header.jsp"/>
		</c:otherwise>
	</c:choose>
 -->
<!-- 게시판 수정 -->
<!-- <form id="replyForm" action="CommentWrite.board" method="post"> -->

<table>
	<tr align="center" valign="middle">
		<td colspan="5">게시글 보기</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td colspan="4" style="font-family:돋음; font-size:12">
		
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="5" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td colspan="4" style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
					
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">첨부파일</div>
		</td>
		<td colspan="4" style="font-family:돋음; font-size:12">
		
		 <br>
		 	<div>
		 		<img alt="" src="postUpload/"  style="height: 200px">
		 	</div>
		<br>
		 	<a href="FileDown.post?file_name=">
		 </a>		 
		  <br>
		</td>
	</tr>

	
	<tr bgcolor="cccccc">
		<td colspan="5" style="height:1px;"></td>
	</tr>
	<tr><td colspan="5">&nbsp;</td></tr>
	
	<tr valign="middle">
	
		
		<td> 작성자 : <input type="text" name="USER_ID" id="reply_writer" size="10" maxlength="20" 
				value="" required/>
		</td>
		<td> 댓글 내용 : <input type="text" name="REPLY_CONTENT" id="reply_content" boardNum="" size="40" maxlength="200" 
				value="" required/>
		</td>
		<!--   
		<td> 비밀번호 : 		
			<input type="password" name="reply_pass" id="reply_pass" size="10" maxlength="20" 
				value="" required/>
		</td> 
		-->
		<td>
			<a href="#" id="replySubmit">[댓글 등록]</a>		
		</td>
	</tr>		
	<tr><td colspan="5">&nbsp;</td></tr>
	
	<tr bgcolor="cccccc">
		<td colspan="5" style="height:1px;"></td>
	</tr>
	<tr><td colspan="5">&nbsp;</td></tr>
	<tr>
		<td colspan="5">
			<table id="replyListTable" style="width: 100%">
				<thead id="replyListTable">
					<tr>
						<th>작성자</th>
						<th style="width:40%;">내용</th>
						<th>작성일</th>
						<th>비밀번호</th>
						<th></th>
					</tr>
					
				</thead>
				<tbody id="tbody">
					
				</tbody>
			</table>
		</td>
	</tr>
	<tr><td colspan="5">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="#.post?num= ">
			[답변]
			</a>&nbsp;&nbsp;
			<a href="#.post?num= ">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="#.post?num= ">
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="#.post">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>



<script>
	/*
	
	$(function(){
		
		function ajaxSuccess(data){ // ajax success 에 들어갈 함수
			console.log("기능 시도 후 리스트 받아옴");
			
			$('#tbody').empty();

			let reply = "";
			$.each(data, function(index, item){
				reply += "<tr replyNum='"+item.reply_num+"'>";
				reply += "<td>"+item.reply_writer+"</td>";
				reply += "<td>"+item.reply_content+"</td>";
				reply += "<td>"+item.reply_date+"</td>";
				reply += "<td><input type='password' name='reply_edit_pass' class='reply_edit_pass' size='10' maxlength='20' value='' /></td>";
				reply += "<td><a href='#' class='replyDelete'>삭제</a></td>";				
				reply += "</tr>";
			});		
				$('#tbody').append(reply);	
				
				deleteReply($('.replyDelete'));

		}
		
		
		function deleteReply(element){ // 하나의 메소드로 여러가지를 하고싶은데 아직 정리가 안됨
					
			element.click(function(){

				//console.log(">"+$(this).closest("tr").find("input").val()+"<"); // 댓글 각각의 비밀번호에 접근하기
				let editPass = $(this).closest("tr").find("input");
				let r_board_num = $('#reply_content').attr("boardNum");
				let r_num = $(this).closest("tr").attr("replyNum");
				
				$.ajax({
					type: "post",
					url: "GetCommentInfo.board",
					data:{
						reply_board_num : r_board_num,
						reply_num : r_num
					},
					success:function(data){
						
						if((data[0].reply_pass) == (editPass.val().trim())){
							console.log("일치");
							editPass.val("");
							
							let result = confirm("댓글을 정말 삭제하시겠습니까?");
							
							if(result){ // yes 댓글 삭제하기
								
								$.ajax({
									type:"post",
									url:"DeleteComment.board",
									data:{
										reply_board_num : r_board_num,
										reply_num : r_num
									},
									success:function(data){
										ajaxSuccess(data);
									},
									error:function(){
										console.log("deleteReply 에러");
									}
								});	
							}
							
						}else{
							editPass.val("");
							alert("비밀번호가 일치하지 않습니다");
							
						}
						
					},
					error:function(){
						console.log("댓글정보 가져오기 에러");
					}
					
				});			
			});
		}

			
		$.ajax({
			type:"post",
			url:"GetCommentsList.board",
			data:{
				reply_board_num : $('#reply_content').attr("boardNum")
			},
			success:function(data){		
				ajaxSuccess(data);
			},
			error:function(){
				console.log("GetCommentsList.board ajax 에러");
			}	
		});
		

		
		$('#replySubmit').click(function(){
			$.ajax({
				type:"post",
				url:"CommentWrite.board",
				data:{
					reply_board_num : $('#reply_content').attr("boardNum"),
					reply_writer : $('#reply_writer').val(),
					reply_pass : $('#reply_pass').val(),
					reply_content : $('#reply_content').val()
				},
				success:function(data){	
					ajaxSuccess(data);
					
					$('#reply_content').val("");
					$('#reply_pass').val("");
					$('#reply_writer').val("");
					
						
				},
				error:function(){
					console.log("CommentWrite.boar ajax 에러");
				}
				
			});
		});	
	});
	
	*/
</script>

</body>
</html>