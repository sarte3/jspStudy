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
   
	String id = request.getParameter("id");
    String pager = request.getParameter("pager");
    String cla = request.getParameter("cla");
    String sword = request.getParameter("sword");
    
    String sql = "delete from gesipan where id="+id;
    
    Statement stmt = conn.createStatement();
    
    stmt.executeUpdate(sql);
    
    response.sendRedirect("list.jsp?pager="+pager+"&cla="+cla+"&sword="+sword);
%>