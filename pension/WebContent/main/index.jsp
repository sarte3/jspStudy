<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	#third { /* 큰 사진 3층 */
	width:1100px;
	height: 400px;
	margin: auto;
}

#fourth { /* 아무거나 4층 */
	width:1100px;
	height: 300px;
	margin: auto;
}
</style>
<%@ include file="../top.jsp" %>
<div id="third">
	<img src="../2.jpg" width="1100" height="400"/>
</div>
<div id="fourth">
나중에
</div>		
<%@ include file="../bottom.jsp" %>
