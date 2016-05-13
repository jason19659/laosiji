<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="老司机专用解密" />
<meta name="keywords" content="老司机专用解密" />
<script src="js/jquery.min.js"></script>
<style type="text/css">
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
<title>老司机的神秘工具</title>
</head>
<body>
	<div id="mainframe">
		<p class="title" id="FoTitle">老司机发车啦~</p>
		<div id="esu" style="font-family: fantasy; font-style: italic;"></div>
		<br />
		<textarea id="decodeMsg" placeholder="加密前" rows="5"></textarea>
		<div class="centerBlk">
			<input class="Btn" type="button" id="encodeInput" value="↓给我变成乱码↓" />
			<input class="Btn" type="button" id="decodeInput" value="↑准备好迅雷~解密↑" />
		</div>
		<textarea id="encodeMsg" placeholder="加密后" rows="5"></textarea>
		<p>
	</div>
</body>
</html>
