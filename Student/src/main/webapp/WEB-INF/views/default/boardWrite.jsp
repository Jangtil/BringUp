<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>글쓰기 페이지</h1>

	<form action="boardWriteInsert" method="post">
	<br>제목
		<input type="text" name="title">
	<br>내용
		<textarea  name="content">
		</textarea>

	<br>
		 <br><input value="글쓰기" type="submit">
	</form>

</body>
</html>
