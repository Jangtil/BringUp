<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jl"%>
<head>


<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Kyungmin University BringUp</title>

<!-- Bootstrap Core CSS -->
<link href="res/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="res/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="res/vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Theme CSS -->
<link href="res/css/creative.min.css" rel="stylesheet">



</head>

<body id="page-top" style="background-color:#000000">
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
				<a class="navbar-brand" href="main">BringUp_교수자</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<jl:if test="${login==true}">
					<ul class="nav navbar-nav">
						<li><a href="lectureAdd">강의추가</a></li>
						<li><a href="lectureList">강의관리</a></li>
					</ul>
				</jl:if>
			</div>
			<!-- /.navbar-collapse -->

		</div>
		<!-- /.container -->
	</nav>


	<header>
		<div class="header-content">
			<div class="header-content-inner">
				<h1 id="homeHeading">BringUp_교수자</h1>
				<hr>
				<br>
				<p>Design By Kyungmin University BringUp</p>

				<jl:if test="${login==false}">
					<a href="login" class="btn btn-primary btn-xl page-scroll">로 그
						인</a>
				</jl:if>
				<jl:if test="${login==true}">
					<a href="logout" class="btn btn-primary btn-xl page-scroll">로 그
						아 웃</a>
				</jl:if>
			</div>
		</div>
	</header>


	<!-- jQuery -->
	<script src="res/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="res/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="res/vendor/scrollreveal/scrollreveal.min.js"></script>
	<script src="res/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Theme JavaScript -->
	<!-- 	<script src="res/js/creative.min.js"></script> -->

</body>

</html>
