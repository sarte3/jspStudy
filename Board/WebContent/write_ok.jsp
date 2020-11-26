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

	//입력할 값 가져오기
	request.setCharacterEncoding("utf-8");
  	String title = request.getParameter("title");
  	String name = request.getParameter("name");
  	String content = request.getParameter("content");
  	String pwd = request.getParameter("pwd");
  	
	//쿼리 생성
	String sql="insert into board(title, name, content, pwd, writeday) ";
	sql += " values(?, ?, ?, ?, now())";
		
	//심부름꾼 생성
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, name);
	pstmt.setString(3, content);
	pstmt.setString(4, pwd);
	
	//쿼리 실행
	pstmt.executeUpdate();
	
	//이동하고 싶은 문서
	response.sendRedirect("list.jsp");
	
%>