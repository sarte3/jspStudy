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

	String sql = "select * from qna order by grp desc, seq asc"; //order by는 나중에 처리
	
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
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
			<td>제목</td>
			<td>날짜</td>
			<td>grp</td>
			<td>seq</td>
			<td>depth</td>
		</tr>
		<%
		while(rs.next())
		{
			// 질문일 경우 str에는 값을 안넣어도 된다.
			// 답글일 경우 아이콘 + 간격(&nbsp;)
			String str = "";
			
			for(int i=1;i<rs.getInt("depth");i++)
			{
				str += "&nbsp;&nbsp;";
				if(i==rs.getInt("depth")-1)
				{
					str += "└";
				}
			}
		%>
		<tr>
			<td><%=rs.getString("name") %></td>
			<td>
				<%=str %><a href="content.jsp?id=<%=rs.getInt("id")%>"><%=rs.getString("title") %></a>
			</td>			
			<td><%=rs.getString("writeday") %></td>
			<td><%=rs.getString("grp") %></td>
			<td><%=rs.getString("seq") %></td>
			<td><%=rs.getString("depth") %></td>												
		</tr>
		<%
		}
		%>
		<tr>
			<td colspan="3">
				<a href="write.jsp">질문글 쓰기</a>
			</td>
		</tr>
	</table>
</body>
</html>