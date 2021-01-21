<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<style>
#section {
   width: 1100px;
   height: 400px;
   margin: auto;
   text-align: center;
}
#section #form{
   width:400px;
   height:300px;
   margin:auto;
   margin-top:100px;
}
#section #form input{
   width:300px;
   height:40px;
   border:1px solid #f15657;
   margin-top:20px;
   font-size:18px;
}
#section #form input[type=submit]{
   width:306px;
   height:44px;
   background:#f15657;
   color:white;
   font-weight:900;
}
</style>
<script>
//아이디는 8자이상12자 이내
//비밀번호는 4자이상 10자이내
//비밀번호입력칸 두개의 값이 일치하는지 비교
//이름,아이디,비밀번호,전화번호는 필히 입력
function check(){
   if(document.frm.userid.value.length<8)
   {
      alert("아이디는 8자이상 12자이내입니다 ")
      document.frm.userid.focus();
      return false;
   }
   if(document.frm.userid.value.length>12){
      alert("아이디는 8자이상 12자이내입니다 ")
      document.frm.userid.focus();
      return false;
   }
   return true;
}
</script>
<div id="section">
   <div id="form">
      <form method="post" name="frm" action="member_ok.jsp" onsubmit="return check()">
      <div id="name"><input type="text" name="name" placeholder="이름" required></div>
      <div id="userid"><input type="text" name="userid" placeholder="아이디" required></div>
      <div id="pwd"><input type="password" name="pwd" placeholder="비밀번호" required></div>
      <div id="pwd1"><input type="password" name="pwd1" placeholder="비밀번호 확인" required></div>
      <div id="phone"><input type="text" name="phone" placeholder="전화번호" required></div>
      <div id="submit"><input type="submit" value="회원가입"></div>
      </form>
   </div>
</div>
<%@ include file="../bottom.jsp"%>