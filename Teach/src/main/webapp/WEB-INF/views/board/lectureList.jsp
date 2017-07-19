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

			<script type="text/javascript">
				function del() {

				}

			</script>



		</head>

		<body bgcolor="#444444">

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
				<!-- /.container -->
			</nav>

			<!-- Page Content -->
			<div class="container">

				<!-- Page Header -->
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<font color="#eeeeee"> <small>강의관리</small>

							</font>
						</h1>
					</div>
				</div>
				<!-- /.row -->

				<!-- Projects Row -->
				<form name="frm">
					<table class="table">

						<thead>
							<tr>

								<th>
									<h4>
										<font color="#00a0dc">과목코드</font>
									</h4>
								</th>

								<th>
									<h4>
										<font color="#dddddd">과목명</font>
									</h4>
								</th>


							</tr>

						</thead>

						<jl:forEach var="lecture" items="${lslecture}">
							<tbody>
								<tr>
									<td>
										<font color="#EAEAEA">
											<h4><a href="boardList?lectureid=${lecture.id}">${lecture.code}</a></h4>
										</font>
									</td>
									<td>
										<font color="#EAEAEA">
											<h4>${lecture.name}</h4>
										</font>
									</td>

									<td>
										<font color="black">
											<h4>
												<button id="btnedit" class="btn btn-warning btn-block btn-signin"><b>수 정</button>
											</h4>
										</font>
									</td>
									<td>
										<font color="black">
											<h4>
												<button id="btndel" class="btn btn-danger btn-block btn-signin"><b>삭 제</button>
											</h4>
										</font>
									</td>
								</tr>
							</tbody>
						</jl:forEach>
					</table>
				</form>
			</div>
			<!-- /.row -->
			<!-- Footer -->
			<footer>
				<div class="row">
					<div class="col-lg-12">
						<p>CopyLeft &copy; KM Website 2017 By Kyungmin InterneInformation</p>
					</div>
				</div>
				<!-- /.row -->
			</footer>
			</div>
			<!-- /.container -->

			<!-- jQuery -->
			<script src="res/js/jquery.js"></script>

			<!-- Bootstrap Core JavaScript -->
			<script src="res/js/bootstrap.min.js"></script>

		</body>

		</html>