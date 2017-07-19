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

			<style type="text/css">
				a:link {
					color: white;
					text-decoration: none;
				}

				a:visited {
					color: black;
					text-decoration: none;
				}

				a:hover {
					color: gray;
					text-decoration: none;
				}
			</style>
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
						<a class="navbar-brand" href="main">BringUp</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<jl:if test="${login==true}">
							<ul class="nav navbar-nav">
								<li><a href="lectureAdd">강의추가</a></li>
								<jl:forEach var="lec" items="${teachMap}">
									<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">${lec.value}
									<span class="caret"></span>
							</a>
										<ul class="dropdown-menu" role="menu">
											<jl:forEach var="it" items="${lecture}">
												<jl:if test="${lec.key==it.teach}">
													<li><a href="boardList?boardid=${it.lectureid}">${it.lecture}</a></li>
												</jl:if>
											</jl:forEach>
										</ul>
									</li>
								</jl:forEach>
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
								<td>
									<a href="boardContent?boardid=${board.id}">
										<h4>${board.title}
											<jl:if test="${board.flag==1}">
												<font color="#16962e">v</font>
											</jl:if>
										</h4>
									</a>
								</td>
							</tr>
						</tbody>
					</jl:forEach>
				</table>
			</div>



			<!--  
		<jl:if test="${searchtype == false}">
			<font color="#aaaaaa">현재페이지 : ${page} 총페이지 : ${maxpage}</font>
		</jl:if>


		<br /></br>
		-->
			<!--  검색창s -->
			<!-- 
		<form method="POST" name="form2" action="GalleryView">

			<input type="text" name="searchdata" /> <input type="hidden"
				name="page" /> <input type="submit" value="제목검색" />
		</form>
		 -->

			<!-- Pagination -->
			<!-- 
		<jl:if test="${searchtype == false}">
		
			<div class="row text-center">
				<div class="col-lg-12">
					<ul class="pagination">
						<jl:forEach var="i" begin="1" end="${maxpage}">
							<jl:choose>
								<jl:when test="${i==page}">
									<li class="active"><a href="#">${i}</a></li>
								</jl:when>
								<jl:otherwise>
									<li><a href="GalleryView?page=${i}">${i}</a></li>
								</jl:otherwise>
							</jl:choose>
						</jl:forEach>
					</ul>
				</div>
			</div>
			

		</jl:if>
		 -->
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