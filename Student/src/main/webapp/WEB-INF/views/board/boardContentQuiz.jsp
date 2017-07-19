<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jl"%>
		<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
		<html>

		<head>

			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta name="description" content="">
			<meta name="author" content="">

			<title>Kyungmin University BringUp</title>

			<!-- Bootstrap Core CSS -->
			<link href="res/css/bootstrap.min.css" rel="stylesheet">

			<!-- Custom CSS -->
			<link href="res/css/blog-post.css" rel="stylesheet">

			<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
			<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
			<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

			<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
			<style type="text/css">
				a:link {
					color: black;
					text-decoration: none;
				}

				a:visited {
					color: black;
					text-decoration: none;
				}

				a:hover {
					color: gray;
					text-decoration: underline;
				}
			</style>

			<script>
				window.onload = function () {
					$(document).ready(function () {
						//목록버튼
						$("#btnlist").click(function () {
							location.href = "boardList?boardid=${board.lecture_id}";
						});

						/* 학생페이지에서는 필요X
						//삭제버튼
						$("#btndel").click(function () {
							if (confirm("삭제하시겠습니까?") == true) {
								$("#frm").prop("method", "POST");
								$("#frm").attr("action", "boardDelete?id=${board.id}&member_id=${board.member_id}&lecture=${lecture}");
								$("#frm").submit();

							} else {
								alert("삭제가 취소되었습니다");
							}
						});
						//수정버튼
						$("#btnedit").click(function () {
							if (confirm("수정하시겠습니까?") == true) {
								$("#frm").prop("method", "POST");
								$("#frm").attr("action", "GalleryEdit");
								$("#frm").submit();

							} else {
								alert("취소되었습니다");
							}
						});
						*/
					});
				};

			</script>


		</head>

		<body>
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

				<div class="row">

					<!-- Blog Post Content Column -->
					<div class="col-lg-8">

						<!-- Blog Post -->

						<!-- Title -->
						<h1>[${board.lecture}] ${board.title}</h1>
						<!-- Author -->
						<p class="lead" style="text-align: right">
							<small> ${board.member_id}의 조회수: ${board.count}
						&nbsp; &nbsp;
					</small>
						</p>

						<hr>

						<!-- Date/Time -->
						<p>
							<span class="glyphicon glyphicon-time"></span> 작성일 : ${board.date}
						</p>

						<hr>

						<!-- Preview Image -->
						<img class="img-responsive" src="" alt="">

						<hr>

						<!-- Post Content -->
						<p class="lead"></p>
						<p>${board.content}</p>
						<hr>

						<!-- Quiz Contents -->
						<p class="quiz"></p>
						<p>
							<form name="frm">
								<table class="table" id="quiztable">
									<thead>
										<tr>
											<th>
												<h4>
													<font color="#00a0dc">퀴즈번호</font>
												</h4>
												<th>
													<h4>
														<font color="#000000">빈칸정답</font>
													</h4>
												</th>
										</tr>
									</thead>
									<!-- foreach문 -->
									<tbody>
										<tr>
											<td width="80"><input class="form-control" type="text" name="quiznum" value="1" readonly /></td>
											<td colspan="3"><input class="form-control" type="text" name="quizans" placeholder="번호에 해당하는 퀴즈정답" /></td>

										</tr>
									</tbody>
								</table>
								<input type="submit" class="btn btn-primary btn-block btn-lg btn-signin" name="btnAdd" id="btnAdd" value="제출">
							</form>
						</p>
						<hr>


						<!-- Blog Comments -->


						<!-- Posted Comments -->

						<input type="button" class="btn btn-default btn-block btn-lg btn-signin" name="btnlist" id="btnlist" value="목록으로">

						<!-- Blog Sidebar Widgets Column -->
						<div class="col-md-4">


							<!-- /.input-group -->
						</div>


					</div>

				</div>
				<!-- /.row -->

				<hr>

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