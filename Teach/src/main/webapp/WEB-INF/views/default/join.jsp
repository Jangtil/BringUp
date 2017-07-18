<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>회원가입 페이지</h1>



	<form action="join_insert" method="post">
	<br>id
		<input type="text" name="id">
	<br>pw 
		<input type="text" name="pw">
	<br>name
		<input type="text" name="name">
	<br>가입하기
		 <br><input type="submit">
	</form>

</body>
</html>
