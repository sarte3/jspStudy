<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#layer{
		position:absolute;
		left:10px;
		top:100px;
		width:80px;
		height: 40px;
		background: yellow;
	}
</style>
<script>
	var n = 10;
	function move() 
	{
		n++;
		document.getElementById('layer').style.left=n+"px";
		if(n>=500)
			clearInterval(ss);
	}
	
	function start() // left의 값이 500px이 되면 멈추고 싶다 => clearInterval(객체명)
	{
		ss = setInterval(move, 10); // 꼭 다른 함수에서 ss 객체명을 사용할 경우, 무조건 var 생략
		
	}
</script>
</head>
<body>
	<input type="button" onclick="move()" value="클릭">
	<input type="button" onclick="start()" value="계속 이동">
	<div id = "layer">
	광고	
	</div>
</body>
</html>