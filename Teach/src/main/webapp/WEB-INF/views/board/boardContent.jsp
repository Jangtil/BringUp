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
<script>

	window.onload = function() {
		$(document)
		.ready(function() {
			$("#btndel").click(function() {
							if (confirm("삭제하시겠습니까?") == true) {
													$("#frm").prop("method","POST");
													$("#frm")
															.attr(
																	"action",
																	"boardDelete?boardid=${board.id}&member_id=${board.member_id}&lectureid=${lectureid}");
													$("#frm").submit();

												} else {
													alert("삭제가 취소되었습니다");
												}
											});
							$("#btnedit")
									.click(
											function() {
												$("#frm")
														.prop("method", "POST");
												$("#frm")
														.attr(
																"action",
																"boardEdit?boardid=${board.id}&member_id=${board.member_id}&lectureid=${lectureid}");
												$("#frm").submit();

											});
							$("#btnlist").click(function() {
								history.back();
							});

						});
		img_resize();
		/* 
		console.log('윈도우 load 완료');
		var winW=$(window).width();
		var winH=$(window).height();
		imgRs();
		function imgRs(){
			winW=$(window).width();
			winH=$(window).height();
			$('p img').each(function(){
				var obj = $(this);
				if(winW>1200){
					obj.css({'width':800});
				}else if(winW <= 1200 && winW >= 768){
					obj.css({'width':368});
				}else{
					obj.css({'width':'100%'});
				}
			});
		}
		$(window).resize(function(){
			imgRs();
		}); */


/* 		function img_resize() 
		{ 
		var winwidth = document.body.clientWidth;
		var contentwidth = $("#maincontent").width();
		
		console.log($("#maincontent").width());
		 // 이미지 사이즈 조절 폭이 550px보다 크면 550px로 자동 줄이기.

		  if ( eval('document.img' + '.width > '+contentwidth) ) 
		    { 
		    eval('document.img' + '.width = '+contentwidth);

		    } 
		  else{
			  
		  }
		  
		} 
 
		$(window).resize(function(){
		
			img_resize();
		}); */
	};
</script>
<style>
html{
	position:relative;
	min-height:100%;
}
.container.padding{
	padding-bottom:30px;
}
.btn-group-lg>.btn, .btn-lg.size{padding:10px 10px 10px 10px;font-size: 18px; line-height: 1.3333333; border-radius:6px;}
.footer {
  position: absolute;
  bottom: 0;
  width: 100%;
  /* Set the fixed height of the footer here */
  height: 60px;
  background-color: #222222;
}
.con p img{
	max-width:100%;
	height:auto;
}

</style>
</head>
<body>
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
	<div class="container padding" id="maincontent">
		<div class="row">
			<!-- Blog Post Content Column -->
			<div class="col-lg-12">
				<!-- Blog Post -->
				<!-- Title -->
				<h1>[${board.lecture}] ${board.title}</h1>
				<!-- Author -->
				<p class="lead" style="text-align: right">
					<small> &nbsp; &nbsp; </small>
				</p>
				<hr>
				<!-- Date/Time -->
				<p>
					<span class="glyphicon glyphicon-time"></span> 작성일 : 
				</p>

				<hr>
				<!-- Preview Image -->
				<img class="img-responsive" src="" alt="">
				<hr>
				<!-- Post Content -->
				<p class="lead">
				<div class="con">
					<p id="con">${board.content}</p>
				</div>
				<hr>

				<!-- Blog Comments -->


				<!-- Posted Comments -->

				<form id="frm">

					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
						<input type="button" class="btn btn-default btn-lg btn-block size"  id="btnlist" value="목록으로">
					</div>
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
						<input type="button" class="btn btn-danger btn-lg btn-block size"  id="btndel" value="삭제하기">
					</div>
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
						<input type="button" class="btn btn-warning btn-lg btn-block size"  id="btnedit" value="수정하기">
					</div>
					
					<input type="hidden" name="num" value="#">

				</form>


				<!-- Blog Sidebar Widgets Column -->
				<div class="col-md-4">


					<!-- /.input-group -->
				</div>


			</div>

		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		
		<div class="footer">
			<div class="col-lg-12">
				<p>CopyLeft &copy; KM Website 2017 By Kyungmin
					InterneInformation</p>
			</div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="res/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="res/js/bootstrap.min.js"></script>
	<script>
	
	</script>
</body>

</html>
