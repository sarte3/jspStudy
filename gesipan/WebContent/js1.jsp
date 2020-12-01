<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	 function test()
	{
		document.getElementById("pkc").style.color="blue";
	} 
	/* window.onload=function()
	{
		document.getElementById("pkc").style.color="blue";
	} */
</script>
<body onload="test()"> <!-- 문서를 읽을 때 하하하라는 글자를 파란색으로 -->
	<span id="pkc">하하하</span>

</body>
</html>