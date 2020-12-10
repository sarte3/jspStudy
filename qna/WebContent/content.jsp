<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
    // DB 연결
    Class.forName("com.mysql.jdbc.Driver");
    String db="jdbc:mysql://localhost:3306/pkc";
    String userid="root";
    String pw="1234";
    Connection conn= DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

    // id 값 가져오기
    String id = request.getParameter("id");
    
	String sql = "select * from qna where id="+id; //order by는 나중에 처리
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	rs.next();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table width="600" align="center">
		<tr>
			<td>이름</td>
			<td><%=rs.getString("name") %></td>
			<td>작성일</td>
			<td><%=rs.getString("writeday") %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=rs.getString("title") %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><%=rs.getString("content") %></td>
		</tr>
		<tr>
			<td colspan="4">
			수정 
			삭제 
			<a href="list.jsp">목록</a>
			<a href="rewrite.jsp?grp=<%=rs.getInt("grp")%>&seq=<%=rs.getInt("seq")%>&depth=<%=rs.getInt("depth")%>">답글쓰기</a>
			</td>
		</tr>
	</table>
</body>
</html>