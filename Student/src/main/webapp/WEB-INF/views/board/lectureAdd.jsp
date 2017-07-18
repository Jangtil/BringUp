<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Kyungmin University BringUp</title>

<!-- Bootstrap Core CSS -->
<link href="res/css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="res/css/3-col-portfolio.css" rel="stylesheet">


</head>

<body bgcolor="#444444">

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->

			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main">BringUp</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">

				
					<ul class="nav navbar-nav">
						<li><a href="lectureAdd">강의추가</a></li>
						<jl:forEach var="lec" items="${teach}">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">${lec}
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<jl:forEach var="it" items="${lecture}">
										<jl:if test="${lec==it.teach}">
											<li><a href="boardList?boardid=${it.lectureid}">${it.lecture}</a></li>
										</jl:if>
									</jl:forEach>
								</ul></li>
						</jl:forEach>
					</ul>
			
			</div>
			<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
	<!-- Page Content -->
	<div class="container">

		<!-- Page Header -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<font color="#eeeeee"> 강의추가 <small></small>
					</font>
				</h1>

			</div>
		</div>
		<!-- /.row -->

		<!-- Projects Row -->
		<div>
			<h4 class="text-left">
				<font color="#ffffff"> 교수자가 부여한 강의코드를 입력해주세요</font>
			</h4>


			<form name="frm" action="lectureAddInsert" method="POST">
				<input class="form-control" type="text" id="txtCode" name="code"
					placeholder="강의코드" minlength="3"  maxlength="20">

				<jl:if test="${code==true}">
					<font color="red">정상적으로 추가 되었습니다</font>
					&nbsp; <a href="#" onclick="history.go(0)"> 새로고침 </a>
				</jl:if>
				<jl:if test="${code==false}">
					
					<font color="red">강의코드를 확인해 주세요</font>
				</jl:if>
				<br><br>
				<button class="btn btn-primary btn-block btn-lg btn-signin"
					type="submit">강의추가</button>
			</form>
		</div>
		<hr>
		<br /></br>

		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>CopyLeft &copy; KM Website 2017 By Kyungmin
					InterneInformation</p>
			</div>
		</div>
		</footer>
		<!-- /.row -->
	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="res/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="res/js/bootstrap.min.js"></script>

</body>

</html>
