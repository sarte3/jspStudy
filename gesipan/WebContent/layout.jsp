<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> <!-- layout.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 1층 ~ 6층까지의 가로 세로를 정의 */
	body {
		margin: 0px;
	}
	
	#first {
		width:100%;
		height:50px;
		background: purple;
		margin:0px auto;
		color : white;
		text-align: center;
	}
	
	#first a {
		text-decoration: none;
		color:white;
	}
	
	/* left, right의 가로의 합을 1200px */
	#first #inner{
		width:1200px;
		height:50px;
		margin:0px auto;
	}
	
	#first #left{
		width: 1180px;
		height: 50px;
		float:left;
		padding-top:10px;
	}
	
	#first #right{
		width: 20px;
		float:right;
		padding-top: 10px;
	}
	
	#second {
		width:1200px;
		height:50px;
		margin: auto;
	}
	#second #left{
		float:left;
		margin-top:13px;
	}
	
	#second #right{
		float:right;
		margin-top:13px;
	}
	
	#second #bae{
		display:inline-block;
		width:200px;
		height: 30px;
		border: 1px solid #bbbbbb;
		border-radius:20px;
		padding-top: 5px;
		text-align: center;
	}
	
	#third {
		width:1200px;
		height:50px;
		margin:auto;
		text-align: center;
		
	}
	
	#third #logo{
		padding-top: 25px; 
	}
	
	#fourth {
		width:1200px;
		height: 60px;
		margin: auto;
	}
	
	#fourth li {
		list-style-type:none;
		display:inline-block;
		width: 150px;
		padding-top:20px;
	}
	
	#fifth {
		width: 1600px;
		height: 400px;
		background: red;
		margin: auto;
	}
	#sixth {
		width: 1200px;
		height: 450px;
		background: blue;
		margin: auto;
	}
</style>
<script>
	var chk = 0;
	function init()
	{
		if(chk%2 == 0)
			document.getElementById('bae').innerText='서울, 경기, 인천 샛별 배송';
		else
			document.getElementById('bae').innerText='수도권 이외지역 택배배송';
		
		chk++;
		
	}
	
	function start()
	{
		setInterval(init, 1000); // init 함수를 1초에 한번 실행
	}
	
	function hide() 
	{
		document.getElementById('first').style.display='none';	
	}
</script>
</head>
<body onload="start()">
	<div id="first">
		<div id="inner">
		<div id="left">지금 가입하고 인기상품 100원에 받아 가세요!! ></div>
		<div id="right"><a href="javascript:hide()">X</a></div>
		</div>
	</div>
	<div id="second">
		<div id="left"><span id="bae">수도권 이외지역 택배배송</span></div>
		<div id="right">회원가입 로그인 고객센터 배송지역 검색</div>
	</div>
	<div id="third"><div id="logo">로고</div></div>
	<div id="fourth">
		<ul>
			<li>전체카테고리 </li>
			<li>신상품</li>
			<li>베스트</li>
			<li>알뜰쇼핑</li>
			<li>이벤트</li>
			<li>검색창 돋보기</li>
			<li>카트</li>
		</ul>
	</div>
	<div id="fifth"></div>
	<div id="sixth"></div>
</body>
</html>