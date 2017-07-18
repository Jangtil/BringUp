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
<link href="res/css/bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="res/css/3-col-portfolio.css" rel="stylesheet">

<script type="text/javascript">
	function boardWrite(lectureid){
	location.href="boardWrite?lectureid="+lectureid;
	}
	function quizWrite(lectureid){
		location.href="quizWrite?lectureid="+lectureid;
		}
	function back(){
		history.back();
	}
</script>



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
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Header -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					<font color="#eeeeee">${title} <small>게시판</small>
					</font>
				</h1>
			</div>
		</div>
		<!-- /.row -->
		
		<!-- Projects Row -->
		<table class="table">
			<!-- 
			<thead>
				<tr>
					<th>test</th>
				</tr>
			</thead>
			-->
			<jl:forEach var="board" items="${lsboard}">
				<tbody>
					<tr>
						<td><a href="boardContent?boardid=${board.id}&lectureid=${lectureid}"> <font
								color="#EAEAEA"><h4>${board.title}</font> 
								</h4>
						</a></td>
					</tr>
				</tbody>
			</jl:forEach>
		</table>
		<hr>
		<input type="button" class="btn btn-default btn-block btn-lg btn-signin" onclick="javascript:back()" value="목 록 으 로">
		<button class="btn btn-primary btn-block btn-lg btn-signin" onclick="javascript:boardWrite(${lectureid})">일 반 등 록</button>
		<button class="btn btn-primary btn-block btn-lg btn-signin" onclick="javascript:quizWrite(${lectureid})">퀴 즈 등 록</button>
		

	</div>
	
	<!-- Footer -->
	<footer>
	<div class="row">
		<div class="col-lg-12">
			<p>CopyLeft &copy; KM Website 2017 By Kyungmin InterneInformation</p>
		</div>
	</div>
	<!-- /.row --> </footer>
	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="res/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="res/js/bootstrap.min.js"></script>

</body>
</html>
