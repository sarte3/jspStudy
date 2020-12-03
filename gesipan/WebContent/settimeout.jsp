<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	// setTimeout, setInterval => 특정 시간 후에 기능(함수)를 호출하는 메소드
	function show()
	{
		alert('안녕하세요');
	}
	
	//setTimeout(show, 3000); // setTimeout(함수, 시간) => 시간 후에 함수를 실행(1번 실행)
	setInterval(show, 3000); // setInterval(함수, 시간) => 시간 후에 함수를 실행(무한 반복)
</script>
</head>
<body>

</body>
</html>