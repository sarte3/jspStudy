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
   
    // request 값 가져오기
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String name = request.getParameter("name");
    String content = request.getParameter("content");
    String sung = request.getParameter("sung");
    String hobby = String.join(",", request.getParameterValues("hobby"));
    String birth = request.getParameter("birth");
    
    // 쿼리 생성
    String sql = "update gesipan set title=?, name=?, content=?, sung=?, hobby=?, birth=? where id=?";
    
    // 심부름꾼 생성
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, name);
    pstmt.setString(3, content);
    pstmt.setString(4, sung);
    pstmt.setString(5, hobby);
    pstmt.setString(6, birth);
    pstmt.setString(7, id);
    
    // 쿼리 실행
    pstmt.executeUpdate();
    
    response.sendRedirect("content.jsp?id="+id);
%>
