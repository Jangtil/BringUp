<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
		<link href="res/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
		 rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
		 rel='stylesheet' type='text/css'>

		<!-- Plugin CSS -->
		<link href="res/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

		<!-- Theme CSS -->
		<link href="res/css/creative.min.css" rel="stylesheet">



	</head>

	<body id="page-top" style="background-color:#000000">

		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->

				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
					<a class="navbar-brand" href="main">BringUp_교수자</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<jl:if test="${login==true}">
						<ul class="nav navbar-nav">
							<li><a href="lectureAdd">강의추가</a></li>
							<li><a href="lectureList">강의관리</a></li>
						</ul>
					</jl:if>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</nav>
		<header>
			<div class="header-content">
				<div class="centered">
					<div class="login-card" style="background-color: rgb(251, 251, 251); width: 339px; height: 413px; padding: 44px;">
						<h1 class="text-center">
							<font color="black">로그인_교수자</font>
						</h1>
						<font style="color:a10303">${code}</font>
						<!-- 로그인 실패시 에러 코드 -->
						<p class="profile-name-card"></p>
						<form class="form-signin" action="login_select" method="post">
							<span class="reauth-email"> </span> <input class="form-control" type="text" name="id" placeholder="ID">

							<br>
							<input class="form-control" type="password" name="pw" required="" placeholder="Password" id="inputPassword"> <br>
							<button class="btn btn-primary btn-block btn-lg btn-signin" type="submit">로 그 인</button>
						</form>
						<a href="join" class="forgot-password">회 원 가 입</a>
					</div>
					<script src="res/assets/js/jquery.min.js"></script>
					<script src="res/assets/bootstrap/js/bootstrap.min.js"></script>
				</div>
			</div>
		</header>

		<!-- jQuery -->
		<script src="res/vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="res/vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Plugin JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
		<script src="res/vendor/scrollreveal/scrollreveal.min.js"></script>
		<script src="res/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

		<!-- Theme JavaScript -->
		<script src="res/js/creative.min.js"></script>

	</body>

	</html>