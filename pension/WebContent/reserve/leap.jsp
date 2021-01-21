<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   function check()
   {
 	   /* var mon=[31,28,31,30,31,30,31,31,30,31,30,31]; 
       var yy=document.pkc.year.value;  // 선택된 option태그의 value
       var m=document.pkc.month.value;
       var chong=mon[m-1];  // 배열은 인덱스가 0부터니까  => 1월이 0 ......
       if(m==2) // 2월달이라면
       {	   
	     if((yy%4==0 && yy%100!=0) || yy%400==0)  // 윤년일 경우
	       chong=mon[1]+1;   
	     else
	       chong=mon[1];
       } */
       var yy=document.pkc.year.value;  // 선택된 option태그의 value
       var m=document.pkc.month.value;
       var date = new Date(yy,m,0); // 0을 넣으면 총 일수가 나온다..
       var chong=date.getDate();
       
       // option태그를 넣기
       document.pkc.day.options.length=chong; // option태그의 갯수
       for(i=0;i<chong;i++) // option태그의 index는 0부터입니다...
       {
    	   document.pkc.day.options[i].value=i+1;
    	   document.pkc.day.options[i].text=i+1;
       }	   
   }
 </script>
</head>
<body onload="check()">
   <form name="pkc" method="post" action="view.jsp">
     <h3> 날짜를 입력하고 버튼을 클릭하면  해당 날짜로부터 100일, 1년 , 10년 뒤의 날짜를 보여줍니다.</h3>
     <select name="year" onchange="check()">
      <c:forEach var="i" begin="2000" end="2030">
       <option value="${i}"> ${i} </option>
      </c:forEach>
     </select>
     <select name="month" onchange="check()">
      <c:forEach var="i" begin="1" end="12">
       <option value="${i}"> ${i} </option>
      </c:forEach>
     </select>
     <select name="day">  <!-- 일 -->
     </select>
     <input type="submit" value="확인하기">
   </form>
</body>
</html>