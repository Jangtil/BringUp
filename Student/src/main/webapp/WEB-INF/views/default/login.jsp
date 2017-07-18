<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>로그인 페이지</h1>

	<form action="login_select" method="post">
	<br>id
		<input type="text" name="id">
	<br>pw 
		<input type="text" name="pw">

	<br>로그인
		 <br><input type="submit">
	</form>
	<a href="join"> 회원가입 </a>

</body>
</html>
