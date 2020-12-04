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
	 	/* display:inline-block; */ 
	 	/*inline을 주면 block형이 가지고 있는 가로, 세로같은 값을 부여하지 못한다.*/
	 	border:1px solid red;
	 	width:120px;
	 	height:35px;
	 	text-align: center;
	 	padding-top: 8px;
	 	margin-left: 20px;
	 	position: relative;
	 	margin-top:20px;	 
	}
	
	#first .sub { /*서브 메뉴를 가지는 ul태그*/
		position:absolute;
		padding-left:0px;
		width:120px;
		height:180px;
		left:120px;
		top:-10px;
		visibility: hidden; /*부메뉴를 숨겨라*/
	} 
	
	#first .sub li{
		list-style-type:none;
		margin-top: 10px;
		width: 120px;
		height: 35px;
		padding-top:5px;
		border:1px solid red;
		background: red;
		color: white;
	}
	 
</style>
<script>
	function sub_view(n) // 부메뉴를 보여라
	{	//현재 문서의 모든 부메뉴는 class="sub"로 되어 있다 => 동일한 이름의 클래스는 배열로 처리
		document.getElementsByClassName('sub')[n].style.visibility ="visible";		
	}
	
	function sub_hide(n) // 부메뉴를 숨겨라
	{
		document.getElementsByClassName('sub')[n].style.visibility ="hidden";
	}
</script>
</head>
<body>
	<!-- 메뉴 만드는 태그 => 모든 태그가 가능(div, ul) -->
	<!-- li 태그는 block => 한 행을 차지 , inline => 자기 공간만 차지-->
	<div id="first">
	<ul id="aa">
		<li onmouseenter="sub_view(0)" onmouseleave="sub_hide(0)">수산물
			<ul class="sub">
				<li>돔 류</li>
				<li>조개류</li>
				<li>잡어</li>
				<li>그 외</li>
			</ul>
		</li>
		<li onmouseenter="sub_view(1)" onmouseleave="sub_hide(1)">농산물
			<ul class="sub">
				<li>쌀</li>
				<li>잡곡류</li>
				<li>야채류</li>
				<li>과일류</li>
			</ul>
		</li>
		<li onmouseenter="sub_view(2)" onmouseleave="sub_hide(2)">장난감
			<ul class="sub">
				<li>헬로 카봇</li>
				<li>뽀로로</li>
				<li>터닝메카드</li>
				<li>타요</li>
			</ul>
		</li>
		<li onmouseenter="sub_view(3)" onmouseleave="sub_hide(3)">안주류
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