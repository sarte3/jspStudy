<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>   
<%@page import="java.util.*" %> 
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("name");
	String birth=request.getParameter("birth");
	String phone=request.getParameter("phone");
	String zip=request.getParameter("zip");
	String juso=request.getParameter("juso");
	String juso_etc=request.getParameter("juso_etc");
	
	String sql = "insert into student(name, birth, phone, zip, juso, juso_etc, writeday) values(?, ?, ?, ?, ?, ?, now())";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, birth);
	pstmt.setString(3, phone);
	pstmt.setString(4, zip);
	pstmt.setString(5, juso);
	pstmt.setString(6, juso_etc);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("stu_input.jsp");
	
%>