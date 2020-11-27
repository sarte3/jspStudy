<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	//DB연결
  	Class.forName("com.mysql.jdbc.Driver");
  	
  	String db = "jdbc:mysql://localhost:3306/pkc";
  	String userid = "root";
  	String pw = "1234";
  	Connection conn = DriverManager.getConnection(db, userid, pw); //db정보, 아이디, 비번

  	// request값 읽어오기
  	request.setCharacterEncoding("utf-8");
  	String id = request.getParameter("id");
  	String name = request.getParameter("name");
  	String title = request.getParameter("title");
  	String content = request.getParameter("content");
  	String pwd = request.getParameter("pwd");
  	
  	String sql = "select pwd from board where id="+id;
  	
  	Statement stmt = conn.createStatement();
  	
  	ResultSet rs = stmt.executeQuery(sql);
  	
  	rs.next();
  	
  	if(pwd.equals(rs.getString("pwd")))
  	{
	  	// 쿼리 생성
	  	sql = "update board set name=?, title=?, content=? where id=?";
	  	
	  	PreparedStatement pstmt = conn.prepareStatement(sql);
	  	pstmt.setString(1, name);
	  	pstmt.setString(2, title);
	  	pstmt.setString(3, content);
	  	pstmt.setString(4, id);
	  	
	  	pstmt.executeUpdate();
	  	pstmt.close();
	  	response.sendRedirect("content.jsp?id="+id);
  	}
  	else
  	{
  		response.sendRedirect("update.jsp?id="+id+"&chk=1");
  	}
  	
  	rs.close();
  	stmt.close();
  	conn.close();
%>