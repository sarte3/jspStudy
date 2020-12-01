<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var a = 100;
	b = 100;
	function aa()
	{
		/* var a = 99;
		var b = 77; */
		a = 99;
		b = 77;
	}
	aa();
	alert(a+" "+b);	
	function bb()
	{
		//var을 붙이면 내가 현재 속한 위치에서 변수를 만든다
		var c = 90;
	}
	bb();
	alert(c);
	// var 은 변수 만들 때 앞에 적는 키워드
	// 함수 밖에서는 있으나 없으나 동일하게 인식
	// 함수 내에서 var이 있으면 함수 내에서만 인식하는 지역 변수, var이 없이 생성되면 전역변수
</script>
</head>
<body>

</body>
</html>