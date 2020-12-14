<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>      
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번
 
    // 정렬순서  cla변수 값이 안들어오는경우, cla=kor
    String ord="";
    if(request.getParameter("cla")==null)
    	ord="name";
    else 
    {
    	ord=request.getParameter("cla");
    	if(ord.equals("hap"))
    		ord="(kor+eng+mat+sci)";
    	else if(ord.equals("avg"))
    		   ord="(kor+eng+mat+sci)/4";
    }
    // 쿼리 생성
    String sql="select * from sung order by "+ord+" asc";
    // 심부름꾼생성
    Statement stmt=conn.createStatement();
    // 쿼리 실행 => ResultSet
    ResultSet rs=stmt.executeQuery(sql);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   function view(id)
   {
	   window.open("sung3.jsp?id="+id,"","width=400,height=200");
   }
   
   function check(form)
   {
	   if(form.name.value=="")
	   {
		   alert("이름을 입력하세요");
		   form.name.focus();
		   return false;
	   }
	   else if(ischeck(form.kor.value.trim())) //.trim() =>스페이스(빈 문자)를 없애주는 역할
		    {
		       alert("국어점수를 제대로 입력하세요")
		       form.kor.value="";
		       form.kor.focus();
		       return false;
		    }
	        else if(ischeck(form.eng.value.trim()))
		         {
		            alert("영어점수를 제대로 입력하세요")
		            form.eng.value="";
		            form.eng.focus();
	                return false;
		         }
	             else if(ischeck(form.mat.value.trim()))
	                  {
	                     alert("수학점수를 제대로 입력하세요")
                         form.mat.value="";
	                     form.mat.focus();
	                     return false;
	                  }
	                  else if(ischeck(form.sci.value.trim()))
	                       {
	                           alert("과학점수를 제대로 입력하세요")
	                           form.sci.value="";
	                           form.sci.focus();
                               return false;
	                       }
	                       else
	                           return true;
   }
   function ischeck(jumsu)
   {
	   if((jumsu<0 || jumsu > 100)||isNaN(jumsu)||jumsu.length==0)
		   return true;
	   else 
		   return false;
   }
 </script>
</head>
<body>
   <!-- 레코드 내용 출력 -->
   <table width="600" align="center">
     <tr>
      <td colspan="7">
       <form method="post" action="input_ok.jsp" onsubmit="return check(this)">
              성적입력 <p>
               이름 <input type="text" name="name" size="5">  
               국어 <input type="text" name="kor" size="3">  
               영어 <input type="text" name="eng" size="3">  
               수학 <input type="text" name="mat" size="3">  
               과학 <input type="text" name="sci" size="3">  
          <input type="submit" value="성적입력">
        </form>
      </td>
     </tr>
     <tr>
       <td> 이름 </td>
       <td> <a href="sung_view.jsp?cla=kor"> 국어 </a> </td>
       <td> <a href="sung_view.jsp?cla=eng"> 영어 </a></td>
       <td> <a href="sung_view.jsp?cla=mat"> 수학 </a></td>
       <td> <a href="sung_view.jsp?cla=sci"> 과학 </a></td>
       <td> <a href="sung_view.jsp?cla=hap"> 합계 </a></td>
       <td> <a href="sung_view.jsp?cla=avg"> 평균 </a></td>
     </tr>
     <%
      while(rs.next())
      {
        int hap=rs.getInt("kor")+rs.getInt("eng")+rs.getInt("mat")+rs.getInt("sci");
        int avg=hap/4;
     %>
     <tr>
       <td> <a href="javascript:view(<%=rs.getInt("id")%>)"> <%=rs.getString("name")%> </a> </td>
       <td> <%=rs.getInt("kor")%> </td>
       <td> <%=rs.getInt("eng")%> </td>
       <td> <%=rs.getInt("mat")%> </td>
       <td> <%=rs.getInt("sci")%> </td>
       <td> <%=hap%> </td>
       <td> <%=avg%> </td>
     </tr>
    <%
      }
    %>
   </table>
</body>
</html>








