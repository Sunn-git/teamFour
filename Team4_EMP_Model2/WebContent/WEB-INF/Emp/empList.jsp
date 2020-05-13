<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class=""> 
    <h2>Emplist</h2>
		<hr>
		<table class="" style="">
				
				 <tr>
				 	<th>EMPNO</th>
				 	<th>MGR</th>
				 	<th>SAL</th>
				 	<th>COMM</th>
				 	<th>DEPTNO</th>
				 	<th>ENAME</th>
				 	<th>JOB</th>
				 	<th>HIREDATE</th>
				 	<th></th>
				 	<th></th>
				 	<th></th>
				 </tr>				 
				 <c:forEach var="emp" items="${requestScope.empList}">
 					 <tr>
					 	<td>${emp.empno}</td>
					 	<td>${emp.mgr}</td>
					 	<td>${emp.sal}</td>
					 	<td>${emp.comm}</td>
					 	<td>${emp.deptno}</td>
					 	<td>${emp.ename}</td>
					 	<td>${emp.job}</td>
					 	<td>${emp.hiredate}</td>
					 	<td></td>					 	
					 	<td><a>수정</a></td>
					 	<td><a>삭제</a></td>					 	
 					 </tr>
				 </c:forEach>


		</table>

		<hr>					
			
        </div>
    </div>


</body>
</html>