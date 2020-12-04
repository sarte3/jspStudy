<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	li {
		list-style-type: none;
		
	}
	.main {
		width:100px;
		height: 30px;
		border: 1px solid black;
		text-align: center;
		padding-top: 8px;
	}
	.sub ul{
		padding-left: 20px;
	}
	.sub {
		display:none;
	}
</style>
<script>
	function sub_view(n)
	{
		// 모든 부메뉴를 전부 숨기기
		for(i = 0;i<4;i++){
			document.getElementsByClassName('sub')[i].style.display='none';
		}
		
		// 선택된 부메뉴를 보이기
		document.getElementsByClassName('sub')[n].style.display='block';
	}
</script>
</head>
<body>
	<ul>
		<li class="main" onclick="sub_view(0)">수산물</li>
		<li class="sub">
			<ul>
				<li>생선류</li>
				<li>어패류</li>
				<li>두족류</li>
				<li>가공식품</li>
			</ul>
		</li>
		<li class="main" onclick="sub_view(1)">안주류</li>
		<li class="sub">
			<ul>
				<li>순대국</li>
				<li>낚지볶음</li>
				<li>감자탕</li>
				<li>육개장</li>
			</ul>
		</li>
		<li class="main" onclick="sub_view(2)">과자</li>
		<li class="sub">
			<ul>
				<li>새우깡</li>
				<li>감자깡</li>
				<li>양파깡</li>
				<li>뽀빠이</li>
			</ul>
		</li>
		<li class="main" onclick="sub_view(3)">주류</li>
		<li class="sub">
			<ul>
				<li>소주</li>
				<li>양주</li>
				<li>맥주</li>
				<li>막걸리</li>
			</ul>
		</li>
	</ul>
</body>
</html>