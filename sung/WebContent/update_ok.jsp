<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
	//DB 연결
	Class.forName("com.mysql.jdbc.Driver");
	String db="jdbc:mysql://localhost:3306/pkc";
	String userid="root";
	String pw="1234";
	Connection conn=DriverManager.getConnection(db,userid,pw); // db정보,아이디,비번

	request.setCharacterEncoding("utf-8");
	String id=request.getParameter("id");
	String kor=request.getParameter("kor");
	String eng=request.getParameter("eng");
	String mat=request.getParameter("mat");
	String sci=request.getParameter("sci");
	
	String sql="update sung set kor=?, eng=?, mat=?, sci=? where id=?";
	
	PreparedStatement pstmt=conn.prepareStatement(sql);
	
	pstmt.setDouble(1, Double.parseDouble(kor));
	pstmt.setDouble(2, Double.parseDouble(eng));
	pstmt.setDouble(3, Double.parseDouble(mat));
	pstmt.setDouble(4, Double.parseDouble(sci));
	pstmt.setString(5, id);
	
	pstmt.executeUpdate();
	
	response.sendRedirect("sung_view.jsp");
%>