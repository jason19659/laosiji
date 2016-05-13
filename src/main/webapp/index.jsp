<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jason19659's encrypt</title>
<link rel="stylesheet" type="text/css" href="css/normalize.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />
<link rel="stylesheet" type="text/css" href="css/tabs.css" />
<link rel="stylesheet" type="text/css" href="css/tabstyles.css" />
<script src="js/modernizr.custom.js"></script>
<script src="js/jquery.min.js"></script>
<style type="text/css">
.mainframe {
	margin: 0px auto;
	width: 800px;
	overflow: hidden;
	display: block;
	font-size: 12px;
}

.decodeMsg, .encodeMsg {
	width: 600px;
	overflow-y: auto;
	display: block;
	resize: none;
	margin: 0 100px;
}

.decodeMsg {
	height: 80px;
}

.encodeMsg {
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
		$("#abcdInput").click(function() {
			$.post("abcdToQwer", {
				code : $("#abcdMsg").val()
			}, function(data) {
				$("#qwerMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
		$("#qwerInput").click(function() {
			$.post("qwerToAbcd", {
				code : $("#qwerMsg").val()
			}, function(data) {
				$("#abcdMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
		$("#zhalanInput").click(function() {
			$.post("zhalan", {
				code : $("#zhalanMsg").val(),
				number : $("#zhanlanNumber").val()
			}, function(data) {
				$("#deZhalanMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
		$("#deZhalanInput").click(function() {
			$.post("deZhalan", {
				code : $("#deZhalanMsg").val(),
				number : $("#zhanlanNumber").val()
			}, function(data) {
				$("#zhalanMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
		$("#offestInput").click(function() {
			$.post("offest", {
				code : $("#offestMsg").val(),
				number : $("#offestNumber").val()
			}, function(data) {
				$("#offestedMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
		
		$("#alphaInput").click(function() {
			$.post("alphabetToMorse", {
				code : $("#alphaMsg").val(),
				spilt : $("#spilt").val()
			}, function(data) {
				$("#morseMsg").val(data.code); 
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
  
		$("#morseInput").click(function() {
			$.post("morseToAlphabet", {
				code : $("#morseMsg").val(),
				spilt : $("#spilt").val()
			}, function(data) {
				$("#alphaMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
		$("#oriInput").click(function() {
			$.post("alphabetToPhone", {
				code : $("#oriMsg").val()
			}, function(data) {
				$("#phoneMsg").val(data.code); 
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
  
		$("#phoneInput").click(function() {
			$.post("phoneToAlphabet", {
				code : $("#phoneMsg").val()
			}, function(data) {
				$("#oriMsg").val(data.code);
			}, "json"//设置了获取数据的类型，所以得到的数据格式为json类型的
			);
		});
	});

	
</script>
</head>
<body>
	<a href="http://jason19659.pw">返回首页 jason's blog</a>
	<div id="esu" style="font-family: fantasy; font-style: italic;"></div>
	<svg class="hidden">
			<defs>
				<path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z" />
			</defs>
		</svg>
	
	<div class="container">
		<section>
			<div class="tabs tabs-style-flip">
				<nav>
					<ul>
						<li><a href="#section-flip-5" class="icon icon-plane"><span>URL</span></a></li>
						<li><a href="#section-flip-4" class="icon icon-date"><span>QWERtoABCD</span></a></li>
						<li><a href="#section-flip-2" class="icon icon-gift"><span>栅栏</span></a></li>
						<li><a href="#section-flip-3" class="icon icon-coffee"><span>字母位移</span></a></li> 
						<li><a href="#section-flip-6" class="icon icon-coffee"><span>摩斯电码</span></a></li>
						<li><a href="#section-flip-1" class="icon icon-tools"><span>手机键盘</span></a></li>
							<li><a href="#section-flip-1" class="icon icon-tools"><span>说明和更新</span></a></li>
					</ul>
				</nav>
				<div class="content-wrap">
					<section id="section-flip-1">
						<div id="mainframe" class="mainframe">
							<p class="title" id="FoTitle">老司机发车啦~</p>

							<br />
							<textarea id="decodeMsg" class="decodeMsg" placeholder="加密前"
								rows="5"></textarea>
							<div class="centerBlk">
								<input class="Btn" type="button" id="encodeInput"
									value="↓给我变成乱码↓" /> <input class="Btn" type="button"
									id="decodeInput" value="↑准备好迅雷~解密↑" />
							</div>
							<textarea id="encodeMsg" class="encodeMsg" placeholder="加密后"
								rows="5"></textarea>
							<p>
						</div>
					</section>
					<section id="section-flip-2">
						<div id="mainframe" class="mainframe">
							<p class="title" id="FoTitle">QWERtoABCD</p>
							键盘上的 qwer 转换为 abcd，abcd转换为qwer。
							<br />
							<textarea id="abcdMsg" class="decodeMsg" placeholder="abcd明文"
								rows="5"></textarea>
							<div class="centerBlk">
								<input class="Btn" type="button" id="abcdInput"
									value="↓ABCD->QWER↓" /> <input class="Btn" type="button"
									id="qwerInput" value="↑QWER->ABCD↑" />
							</div>
							<textarea id="qwerMsg" class="encodeMsg" placeholder="qwer密文"
								rows="5"></textarea>
							<p>
						</div>
					</section>
					<section id="section-flip-3">
						<div id="mainframe" class="mainframe">
							<p class="title" id="FoTitle">栅栏</p>
							将原文分组后组合，如 abcd 栅栏数为2 转换为 ac bd。
							<br />
							<textarea id="zhalanMsg" class="decodeMsg" placeholder="加密前"
								rows="5"></textarea>
							<div class="centerBlk">
								栅栏数:<input type="text" size="3" id="zhanlanNumber"> <input
									class="Btn" type="button" id="zhalanInput" value="↓加密↓" /> <input
									class="Btn" type="button" id="deZhalanInput" value="↑解密↑" />
							</div>
							<textarea id="deZhalanMsg" class="encodeMsg" placeholder="加密后"
								rows="5"></textarea>
							<p>
						</div>
					</section>
					<section id="section-flip-4">
						<div id="mainframe" class="mainframe">
							<p class="title" id="FoTitle">字母位移</p>
							位移字母表数字的字母，如位移为2 az -> cb
							<br />
							<textarea id="offestMsg" class="decodeMsg" placeholder="位移前"
								rows="5"></textarea>
							<div class="centerBlk">
								位移数:<input type="text" size="3" id="offestNumber"> <input
									class="Btn" type="button" id="offestInput" value="↓位移↓" />
							</div>
							<textarea id="offestedMsg" class="encodeMsg" placeholder="位移后"
								rows="5"></textarea>
							<p>
						</div>
					</section>
					<section id="section-flip-6">
						<div id="mainframe" class="mainframe">
							<p class="title" id="FoTitle">摩斯电码</p>
							摩斯电码 请使用 . 和 - 表示
							<br />
							<textarea id="alphaMsg" class="decodeMsg" placeholder="加密前"
								rows="5"></textarea>
							<div class="centerBlk">
								分隔符 默认空格:<input type="text" size="3" id="spilt"> <input
									class="Btn" type="button" id="alphaInput" value="↓转换成电码↓" /> <input
									class="Btn" type="button" id="morseInput" value="↑电码解密↑" />
							</div>
							<textarea id="morseMsg" class="encodeMsg" placeholder="加密后"
								rows="5"></textarea>
							<p> 
						</div>
					</section>
					<section id="section-flip-5">
						<div id="mainframe" class="mainframe">
							<p class="title" id="FoTitle">手机键盘转换</p>
							转换成手机键盘上的数字 如 a z -> 21 94
							<br />
							<textarea id="oriMsg" class="decodeMsg" placeholder="原文"
								rows="5"></textarea>
							<div class="centerBlk">
								<input class="Btn" type="button" id="oriInput"
									value="↓转换成手机键盘↓" /> <input class="Btn" type="button"
									id="phoneInput" value="↑转换为明文↑" />
							</div>
							<textarea id="phoneMsg" class="encodeMsg" placeholder="手机键盘"
								rows="5"></textarea>
							<p>
						</div>
					</section>
					<section id="section-flip-5">
						<div id="mainframe" class="mainframe">
							<p class="title" id="FoTitle">说明</p>
							加密：在上边栏输入文字，点击左边按钮加密。
							解密：在下边栏输入文件，点击右边按钮解密。
							<p class="title" id="FoTitle">更新日志</p>
							--16-05-18
								修正大写字母无法转换的问题
						</div>
					</section>
				</div> 
				<!-- /content -->
			</div>
			<!-- /tabs -->
		</section>
© 2016 <a href="http://jason19659.pw">Jason's Blog</a>, all rights reserved.
<div style="display: none;"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1258983852'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/stat.php%3Fid%3D1258983852%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script></div>
	</div>   
	<!-- /container -->
	<script src="js/cbpFWTabs.js"></script>
	<script>
		(function() {

			[].slice.call(document.querySelectorAll('.tabs')).forEach(
					function(el) {
						new CBPFWTabs(el);
					});

		})();
	</script>
	
</body>
</html>