<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%
	String chk=request.getParameter("chk");
	pageContext.setAttribute("chk", chk);
%>
 <style>
  #section {
    width:1100px;
    height:400px;
    margin:auto;
    text-align:center;
  }
  #form {
    width:400px;
    height:300px;
    margin:auto;
    margin-top:100px;
  }
  #form input{
    width:300px;
    height:40px;
    border:1px solid #f15657;
    margin-top:20px;
    font-size:18px;
  }
  #form input[type=submit] {
    width:306px;
    height:44px;
    background:#f15657;
    color:white;
    font-weight:900;
  }
 </style>
 <div id="section">
  <div id="form">
   <form method="post" action="login_ok.jsp">
    <div id="userid"> <input type="text" name="userid" placeholder="아이디" autocomplete="off"> </div> 
    <div id="pwd"> <input type="password" name="pwd" placeholder="비밀번호"> </div> 
    <c:if test="${chk==1}">
    	<br><span style="color:red;font-size:12px">아이디 혹은 비밀번호가 틀렸습니다</span>
    </c:if>
    <div id="submit"> <input type="submit" value="로그인"> </div>
    <div id="etc" style="margin-top:20px"> <a href="userid_search.jsp">아이디찾기</a> / <a href="pwd_search.jsp">비밀번호찾기</a> / <a href="member.jsp">회원가입</a> </div>
   </form> 
  </div>
 </div>
 
<%@ include file="../bottom.jsp" %> 