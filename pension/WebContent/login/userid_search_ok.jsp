<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="pension.dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../top.jsp" %>  
<%
	request.setCharacterEncoding("utf-8");
	String name= request.getParameter("name");
	String phone = request.getParameter("phone");

	DAO dao = new DAO();
	String userid=dao.userid_search(name, phone);
	pageContext.setAttribute("userid", userid);
	pageContext.setAttribute("name", name);
%>

<!DOCTYPE html>
<html>
<head>
<style>
  #section {
    width:1100px;
    height:400px;
    margin:auto;
    text-align:center;
  }
  #section #userid {
  	width:600px;
  	margin:auto;
  }
    #section input[type=button] {
    width:150px;
    height:34px;
    background:#f15657;
    color:white;
    font-weight:900;
    border:none;
    margin-top:30px;
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="section">
	 <c:if test="${userid!='0'}">
	 	<div id="userid">${name}님의 아이디는 ${userid} 입니다</div>
	 	<div id="button"> <input type="button" onclick="location='login.jsp'" value="로그인"> </div>
	 </c:if>
	 <c:if test="${userid=='0' }">
	 	<div id="userid">${name} 님의 입력정보가 잘못 되었습니다.</div>
	 	<div id="button"> <input type="button" onclick="location='userid_search.jsp'" value="아이디 찾기"> </div>
	 </c:if>
</div>
</body>
</html>
<%@ include file="../bottom.jsp" %>  