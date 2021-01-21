<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

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
   <form method="post" action="userid_search_ok.jsp">
    <div id="name"> <input type="text" name="name" placeholder="이름" autocomplete="off"> </div> 
    <div id="phone"> <input type="text" name="phone" placeholder="전화번호"> </div> 
    <div id="submit"> <input type="submit" value="아이디 찾기"> </div>
   </form> 
  </div>
 </div>
 
<%@ include file="../bottom.jsp" %> 