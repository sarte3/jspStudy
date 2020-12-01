<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
 <script>
   function init()
   {
	   // db에 age 필드의 값이 2
	   var age = 2;
	   document.pkc.age[age].checked=true;
	   
   }
 </script>
</head>
<body onload="init()">
   <form name="pkc">
     <input type="radio" name="age" value="0"> 10대
     <input type="radio" name="age" value="1"> 20대
     <input type="radio" name="age" value="2"> 30대
     <input type="radio" name="age" value="3"> 40대
     <input type="radio" name="age" value="4"> 50대
   </form>
</body>
</html>