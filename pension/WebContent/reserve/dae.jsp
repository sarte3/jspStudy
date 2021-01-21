<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   function test1()
   {
	   document.pkc.sel.options.length=3;
	   document.pkc.sel.options[0].value="0";
	   document.pkc.sel.options[0].text="짜장면";
	   document.pkc.sel.options[1].value="1";
	   document.pkc.sel.options[1].text="짬 뽕";
	   document.pkc.sel.options[2].value="2";
	   document.pkc.sel.options[2].text="탕수육";
	   // DB에 있는 값을 가져와서 select형식을 만들때 많이 사용
   }
   function test2()
   {
	   var sel=document.getElementById("sel");
	   sel.options.length=3;
	   sel.options[0].value="0";
	   sel.options[0].text="짜장면";
	   sel.options[1].value="1";
	   sel.options[1].text="짬 뽕";
	   sel.options[2].value="2";
	   sel.options[2].text="탕수육";
   }
 </script>
</head>
<body>
 <input type="button" onclick="test1()" value="option넣기">
 <form name="pkc">
  <select name="sel">
  </select>
 </form>
 
 <hr>
  <input type="button" onclick="test2()" value="option넣기">
 <select id="sel">
 </select>
</body>
</html>