<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>JSP Project _ YS</title>

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
<script type="text/javascript" src="res/tinymce/tinymce.min.js"></script>
<script>




	window.onload = function() {
		$(document).ready(function() {
			//$("#btnAdd").click(function() {
			//	$("#frm").submit();
			//});
			$("#btnlist").click(function() {
				if (confirm("작성중인 내용이 지워집니다 목록으로 이동하시겠습니까") == true) {
					history.back();
				} else {
				}
				
			});
		});
	};
	tinymce
			.init({
				selector : 'textarea',
				theme : 'modern',
				language : 'ko_KR',
				plugins : "autolink autosave code link media image table textcolor autoresize",
				toolbar : "undo redo | styleselect | forecolor bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | table link media custom_image code ",
				setup : function(editor) {
					editor.addButton('custom_image', {
						title : '이미지삽입',
						icon : 'image',
						onclick : function() {
							window.open("boardpopup", 
									"tinymcePop", "width=400,height=350");
							//open주소 절대에서상대로 변경
						}
					});
				}
			});
</script>
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
	<div class="container">

		<div class="row">

			<!-- Blog Post Content Column -->
			<div class="col-lg-8">
				<form id="frm" action="boardWriteInsert?lectureid=${lectureid}"
					method="post">
					<!-- Blog Post -->
					<!-- Author -->
					<p class="lead" style="text-align: left">작성하기</p>
					<!-- Title -->
					<h1>
						<input class="form-control" type="text" name="title" id="title"
							placeholder="제목" minlength="4" maxlength="100" required="필수 항목입니다">
					</h1>

					<hr>
					<!-- Date/Time -->
					<!-- Post Content -->
					<p class="lead">
					<p>
						<textarea class="form-control" name="content"
							placeholder="내용을 입력하세요" rows="20" minlength="4" ></textarea>
					</p>
					<hr>
					<!-- Blog Comments -->
					<!-- Posted Comments -->
					<input type="button" class="btn btn-default btn-block btn-lg btn-signin" name="btnlist" id="btnlist" value="목록으로">
					<input type="submit" class="btn btn-primary btn-block btn-lg btn-signin" name="btnAdd" id="btnAdd" value="등록하기">
					
					 
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
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>CopyLeft &copy; KM Website 2017 By Kyungmin
					InterneInformation</p>
			</div>
		</div>
		<!-- /.row --> </footer>
	</div>
	<!-- /.container -->
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
	<script src="res/js/creative.min.js"></script>
	<script src="res/js/script.join.js"></script>
</body>

</html>
