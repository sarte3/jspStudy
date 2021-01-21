<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<style>
#section {
	width :1100px;
	height: 400px;
	margin: auto;
	text-align: center;
}
#section #form 
{
	width: 400px;
	height:300px;
	margin:auto;
	margin-top:100px;
}
#section #form input {
	width : 300px;
	height: 40px;
	border:1px solid #f15657;
	margin-top : 20px;
	font-size:18px;
}
#section #form input[type=submit]{
	width:306px;
	height: 44px;
	background: #f15657;
	color:white;
	font-weight: 900;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	//아이디는 8자이상 12자 이내
	//비밀번호는 4자이상 10자 이내
	// 비밀번호 입력칸 2개의 값이 일치하는지 비교
	// 이름, 아이디, 비밀번호, 전화번호는 필히 입력
	var uid = 0;
	
	function check()
	{
		if(document.getElementById('iuserid').value.length<8||document.getElementById('iuserid').value.length>12)
		{
			alert('아이디는 8자 이상 12자 이내로!');
			return false;
		}
		
		if(document.getElementById('ipwd').value.length<4||document.getElementById('ipwd').value.length>10)
		{
			alert('비밀번호는 4자 이상 10자 이내로!');
			return false;
		}
		
		if(document.getElementById('ipwd').value!=document.getElementById('ipwd1').value)
		{
			alert('비밀번호가 일치하지 않습니다!');
			return false;
		}
		
		if(uid==1)
		{
			alert('사용 불가능한 아이디입니다. 아이디를 확인해주세요')
			return false;
		}
		
		return true;
		
	}
	
	var pkc = new XMLHttpRequest(); 

	
	function id_check(userid)
	{
		pkc.open("get", "id_check.jsp?userid="+userid);
		pkc.send();
		
		pkc.onreadystatechange=function()
		{
			if(pkc.readyState==4)
			{
				//alert(pkc.responseText);
				if(pkc.responseText==0)
				{
					document.getElementById('uid').innerHTML="<span style='color:blue'>사용 가능 아이디</span>";
					uid=0;
				}
				else
				{
					document.getElementById('uid').innerHTML="<span style='color:red'>사용 불가능 아이디</span>";
					uid=1;
				}
			}
		}
	}
</script>
</head>
<body>
	<div id="section">
		<div id ="form">
			<form method="post" action="member_ok.jsp" onsubmit="return check()">
				<div id="name"><input type="text" name="name" placeholder="이름" id="iname" required="required"></div>
				<div id="userid"><input type="text" name="userid" placeholder="아이디" id="iuserid" onblur="id_check(this.value)" required="required">
				<div id="uid"></div>
				</div>
				
				<div id="pwd"><input type="password" name="pwd" placeholder="비밀번호" id="ipwd" required="required"></div>
				<div id="pwd1"><input type="password" name="pwd1" placeholder="비밀번호 확인" id="ipwd1"></div>
				<div id="phone"><input type="text" name="phone" placeholder="핸드폰" id="iphone" required="required"></div>
				<div id="submit"><input type="submit" value="회원 가입"></div>
			</form>
		</div>
	</div>
</body>
</html>
<%@ include file="../bottom.jsp" %>