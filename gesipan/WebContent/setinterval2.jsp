<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#layer {
		position:absolute;
		left:100px;
		top:100px;
		width:50px;
		height: 50px;
		border: 1px solid red;
	}
</style>
<script>
	//left 값을 변경 => 이동, width, height를 변경
	var n = 50;
	function size_chg() // 1px씩 크기를 크게
	{
		n++;
		document.getElementById('layer').style.width=n+'px';
		document.getElementById('layer').style.height=n+'px';
		if(n>=400)
			clearInterval(si);
	}

	function start() // 가로와 세로의 크기가 400px이 되면 멈춰
	{
		si = setInterval(size_chg, 10);
	}
</script>
</head>
<body>
<input type ="button" onclick="start()" value="크기 변경">
<div id="layer"></div>
</body>
</html>