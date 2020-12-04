<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#first{
		width:800px;
		height:50px;
		margin:auto;
	}

	#first #aa > li{ /*주 메뉴에 대한 스타일*/
	 	list-style-type:none;
	 	display:inline-block; 
	 	/*inline을 주면 block형이 가지고 있는 가로, 세로같은 값을 부여하지 못한다.*/
	 	border:1px solid red;
	 	width:120px;
	 	height:35px;
	 	text-align: center;
	 	padding-top: 8px;
	 	margin-left: 20px;
	 	position: relative;	 
	}
	
	#first .sub { /*서브 메뉴를 가지는 ul태그*/
		position:absolute;
		border: 1px solid blue;
		padding-left:0px;
		width:120px;
		top:50px;
	} 
	
	#first .sub li{
		list-style-type:none;
		
	}
	 
</style>
</head>
<body>
	<!-- 메뉴 만드는 태그 => 모든 태그가 가능(div, ul) -->
	<!-- li 태그는 block => 한 행을 차지 , inline => 자기 공간만 차지-->
	<div id="first">
	<ul id="aa">
		<li>수산물
			<ul class="sub">
				<li>돔 류</li>
				<li>조개류</li>
				<li>잡어</li>
				<li>그 외</li>
			</ul>
		</li>
		<li>농산물
			<ul class="sub">
				<li>쌀</li>
				<li>잡곡류</li>
				<li>야채류</li>
				<li>과일류</li>
			</ul>
		</li>
		<li>장난감
			<ul class="sub">
				<li>헬로 카봇</li>
				<li>뽀로로</li>
				<li>터닝메카드</li>
				<li>타요</li>
			</ul>
		</li>
		<li>안주류
			<ul class="sub">
				<li>연어회</li>
				<li>해물탕</li>
				<li>순대국</li>
				<li>곱창</li>
			</ul>
		</li>
	</ul>
	</div>
</body>
</html>