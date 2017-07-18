<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>글목록 페이지</h1>


	<table border=1>
	<tr><td>글쓴이</td><td>제목</td></tr>
	<c:forEach items="${lsboard}" var="board">
	<tr>
		<td>${board.member_id}  </td>
		<td><a href="boardContent?id=${board.id}"> ${board.title} </a></td>	   
		   
	</tr>
	</c:forEach>
	</table>



	<br>
	<br>
	<a href="boardWrite">글쓰기</a>


</body>
</html>
