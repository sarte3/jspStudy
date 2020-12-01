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
	
	// request값 읽어오기
	String id=request.getParameter("id");
	
	// 쿼리 생성 => ResultSet 이동
	String sql="select * from board where id="+id;
	
	// 쿼리 실행 => ResultSet 이동
	Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td {
	  border:1px solid #cccccc;
	}
	#del {
		position:absolute;
		visibility:hidden;
	}
</style>
<script>
	function view_del()
	{
		//alert(event.clientX+" "+event.clientY);
		var x=event.clientX;
		var y=event.clientY;
		document.getElementById("del").style.visibility="visible";
		document.getElementById("del").style.left=(x-30)+"px";
		document.getElementById("del").style.top=(y+30)+"px";
	}
</script>
</head>
<body>
    <!-- ResultSet의 내용을 출력  : name,title,content,readnum,writeday-->
	<table width="500" align="center">
		<tr align="center">
			<td> 작성자 </td>
			<td> <%=rs.getString("name")%> </td>
			<td> 조회수 </td>
			<td> <%=rs.getString("readnum")%> </td>
			<td> 작성일 </td>
			<td> <%=rs.getString("writeday")%> </td>
		</tr>
		<tr>
			<td align="center"> 제목 </td>
			<td colspan="5"> <%=rs.getString("title")%> </td>
		</tr>
		<tr height="200">
			<td align="center"> 내용 </td>
			<td colspan="5"> <%=rs.getString("content")%> </td>
		</tr>
		<tr>
			<td colspan="6" align="center">
			<a href ="update.jsp?id=<%=id%>">수정</a>
			<a href="#" onclick = "view_del()">삭제</a>
			<a href="list.jsp">목록</a>
		</tr>
		<%
			if(request.getParameter("chk") != null)
			{
		%>
		<tr>
			<td colspan="6" align="center"> 비번이 틀렸네요</td>
		</tr>
		<%
			}
		%>
	</table>
	<form method="post" action ="delete.jsp" id="del">
		<input type="hidden" name="id" value="<%=id%>">
	비번<input type="password" name="pwd" size="4">
		<input type="submit" value="삭제">
	</form>
</body>
</html>
<%
	stmt.close();
	conn.close();
%>
