<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>글내용 페이지</h1>


	<table border=1>
	<tr>
		<td>글쓴이 : ${board.member_id}  </td>
		<td>제목 : ${board.title} </td>	   
		<td>내용 : ${board.content}</td>   
	</tr>

	</table>

	<br>
	<a href="boardList">목록으로</a>


</body>
</html>
