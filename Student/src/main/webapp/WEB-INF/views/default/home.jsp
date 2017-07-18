<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>

	<P>The time on the server is</P>
	<c:forEach items="${data}" var="d">
 ${d.name}
</c:forEach>
	<form action="home" method="post">

		<input type="text" name="member_id"> 
		<input type="text" name="name">
		<input type="text" name="address"> <input type="submit">
	</form>
	<a href="boardList">게시판으로</a>
	<a href="test">테스트</a>
	
	<a href="logout">로그아웃</a> 

</body>
</html>
