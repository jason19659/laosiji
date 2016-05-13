<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>Jason's Blog «</title>

<link rel="stylesheet" id="dashicons-css"
	href="http://jason19659.pw/wp-includes/css/dashicons.min.css?ver=4.3.3"
	type="text/css" media="all">
<link rel="stylesheet" id="admin-bar-css"
	href="http://jason19659.pw/wp-includes/css/admin-bar.min.css?ver=4.3.3"
	type="text/css" media="all">
<link rel="stylesheet" id="tw-bootstrap-css"
	href="http://jason19659.pw/wp-content/themes/the-bootstrap/css/bootstrap.min.css?ver=2.0.3"
	type="text/css" media="all">
<link rel="stylesheet" id="the-bootstrap-css"
	href="http://jason19659.pw/wp-content/themes/the-bootstrap/style.min.css?ver=2.0.1"
	type="text/css" media="all">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript"
	src="http://jason19659.pw/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.2.1"></script>

<style type="text/css" id="custom-background-css">
body.custom-background {
	background-color: #d5e5e2;
}

#mainframe {
	margin: 0px auto;
	width: 800px;
	overflow: hidden;
	display: block;
	font-size: 12px;
}

#decodeMsg, #encodeMsg {
	width: 600px;
	overflow-y: auto;
	display: block;
	resize: none;
	margin: 0 100px;
}

#decodeMsg {
	height: 80px;
}

#encodeMsg {
	height: 280px;
}

input.Btn {
	cursor: pointer;
	padding: 5px;
	font-size: 15px;
}

body, p, div.centerBlk {
	text-align: center;
}

p.title {
	font-size: 200%;
	font-weight: bold;
	font-family: 微软雅黑, 黑体;
	margin: 15px;
}

textarea {
	padding: 5px;
	font-size: 12px;
	outline: none;
	text-shadow: 0px 1px 0px #fff;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	border: 1px solid #ccc;
	-webkit-transition: .3s ease-in-out;
	-moz-transition: .3s ease-in-out;
	-o-transition: .3s ease-in-out;
}

textarea:focus {
	border: 1px solid #fafafa;
	-webkit-box-shadow: 0px 0px 6px #007eff;
	-moz-box-shadow: 0px 0px 5px #007eff;
	box-shadow: 0px 0px 5px #007eff;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$.get("esu", function(data) {
			$("#esu").text("古人云 : " + data.code);
		}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
		);

		$("#encodeInput").click(function() {
			$.post("encode", {
				code : $("#decodeMsg").val()
			}, function(data) {
				$("#encodeMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
		$("#decodeInput").click(function() {
			$.post("decode", {
				code : $("#encodeMsg").val()
			}, function(data) {
				$("#decodeMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
	});
</script>
</head>

<body
	class="home blog logged-in admin-bar custom-background content-sidebar  customize-support"
	data-gr-c-s-loaded="true">
	<div class="container">
		<div id="page" class="hfeed row">
			<header id="branding" role="banner" class="span12">


				<a id="header-image" href="http://jason19659.pw/"
					title="Jason's Blog" rel="home"> <img
					src="https://jason19659.pw/wp-content/uploads/2015/11/cropped-cropped-6a600c338744ebf809d36635d8f9d72a6059a71d.jpg"
					width="1170" height="250" alt="">
				</a>

				<nav id="access" role="navigation">
					<h3 class="assistive-text">Main menu</h3>
					<div class="skip-link">
						<a class="assistive-text" href="http://jason19659.pw/#content"
							title="Skip to primary content">Skip to primary content</a>
					</div>
					<div class="skip-link">
						<a class="assistive-text" href="http://jason19659.pw/#secondary"
							title="Skip to secondary content">Skip to secondary content</a>
					</div>
					<div class="navbar navbar-inverse">
						<div class="navbar-inner">
							<div class="container">
								<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
								<a class="btn btn-navbar" data-toggle="collapse"
									data-target=".nav-collapse"> <span class="icon-bar"></span>
									<span class="icon-bar"></span> <span class="icon-bar"></span>
								</a>
								<div class="nav-collapse">
									<div class="menu-%e8%8f%9c%e5%8d%951-container">
										<ul id="menu-%e8%8f%9c%e5%8d%951" class="nav">
											<li id="menu-item-7"
												class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-7 active"><a
												href="http://jason19659.pw/">Home</a></li>
											<li id="menu-item-45"
												class="menu-item menu-item-type-custom menu-item-object-custom menu-item-45"><a
												href="https://jason19659.pw/wiki">WIKI</a></li>
											<li id="menu-item-25"
												class="menu-item menu-item-type-custom menu-item-object-custom menu-item-25"><a
												href="https://jason19659.pw/laosiji/">老司机专用加密</a></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
				</nav>
				<!-- #access -->
			</header>
			<!-- #branding -->
			<div id="mainframe">
				<p class="title" id="FoTitle">老司机发车啦～</p> 
				<div id="esu" style="font-family: fantasy; font-style: italic;"></div>
				<br />
				<textarea id="decodeMsg" placeholder="加密前" rows="5"></textarea>
				<div class="centerBlk">
					<input class="Btn" type="button" id="encodeInput" value="↓给我变成乱码↓" />
					<input class="Btn" type="button" id="decodeInput"
						value="↑准备好迅雷~解密↑" />
				</div>
				<textarea id="encodeMsg" placeholder="加密后" rows="5"></textarea>
				<p>
			</div>
			<!-- #secondary .widget-area -->
			<footer id="colophon" role="contentinfo" class="span12">
				<div id="page-footer" class="well clearfix">
					<span class="credits alignleft">© 2016 <a
						href="http://jason19659.pw/">Jason's Blog</a>, all rights
						reserved.
					</span>
					<div id="site-generator"></div>
				</div>
				<!-- #page-footer .well .clearfix -->
			</footer>
			<!-- #colophon -->
		</div>
		<!-- #page -->
	</div>
	<!-- .container -->
	<!-- 19 queries. 0.204 seconds. -->


</body>
</html>