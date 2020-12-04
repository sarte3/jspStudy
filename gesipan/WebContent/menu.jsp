<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul {
		position:absolute;
		left:10px;
		top:10px;
		visibility: hidden;
	}
	
	#first{
		position:relative;
		width:800px;
		height:30px;
		margin:auto;
	}
</style>
<script>
	function view()
	{
		document.getElementById('sub').style.visibility = "visible";
	}
	
	function hide()
	{
		document.getElementById('sub').style.visibility = "hidden";
	}
</script>
</head>
<body>
	<div id="first" onmouseenter="view()" onmouseleave="hide()">수산물
	<ul id="sub">
		<li>횟감</li>
		<li>어패류</li>
		<li>두족류</li>
		<li>기타등등</li>
	</ul>
	</div>
</body>
</html>