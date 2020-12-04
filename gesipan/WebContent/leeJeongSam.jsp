<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	margin : 0px;
}
#container{
	width:1400px;
	margin:0 auto;
}
.main {
	list-style-type:none;
	display:inline-block;
	width:200px;
	height:50px;
	padding:0px;
	line-height: 50px;
	background: tomato;
	color:white;
	position:relative;
	text-align: center;
}

.sub{
	padding:0px;
	position: absolute;
	width:200px;
	top:50px;
	left:0px;
	border:1px solid tomato;
	display:none;
}
.sub li{
	list-style-type:none;
	color:tomato;
	padding:0px;
	line-height: 50px;
}

</style>
<script>
	function show(n)
	{
		document.getElementsByClassName('sub')[n].style.display='block';	
		
	}
	function hide(n)
	{
		document.getElementsByClassName('sub')[n].style.display='none';	
		
	}
	
</script>
<body>
<div id="container">
	<ul>
		<li class="main" onmouseover="show(0)" onmouseout="hide(0)">TV
			<ul class="sub">
				<li>올레드 TV</li>
				<li>나노셀 TV</li>
				<li>울트라 HD TV</li>
				<li>일반 LED TV</li>
			</ul>
		</li>
		<li class="main" onmouseover="show(1)" onmouseout="hide(1)">AV
			<ul class="sub">
				<li>사운드바</li>
				<li>무선 스피커</li>
				<li>블루투스 이어폰(톤 프리)</li>
				<li>오디오/플레이어</li>
			</ul>
		</li>
		<li class="main" onmouseover="show(2)" onmouseout="hide(2)">PC
			<ul class="sub">
				<li>그램</li>
				<li>울트라기어</li>
				<li>울트라 PC</li>
			</ul>
		</li>
		<li class="main" onmouseover="show(3)" onmouseout="hide(3)">모니터
			<ul class="sub">
				<li>울트라기어 게이밍 모니터</li>
				<li>울트라와이드 모니터</li>
				<li>울트라HD 모니터</li>
				<li>PC모니터</li>
				<li>TV모니터</li>
				<li>IPTV모니터</li>
			</ul>
		</li>
		<li class="main" onmouseover="show(4)" onmouseout="hide(4)">냉장고
			<ul class="sub" >
				<li>정수기형</li>
				<li>상냉장/하냉동</li>
				<li>양문형</li>
				<li>일반형</li>
				<li>비즈니스</li>
				<li>와인셀러</li>
			</ul>
		</li>		
	</ul>
</div>
</body>
</html>