<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="600" align="center" border="1">
	<tr>
		<td>����</td>
		<td><input type="text" name="title" size="40"></td>
	</tr>
	<tr>
		<td>�Ⱓ</td>
		<td>
		<select name="period">
			<option value="1m">1����</option>
			<option value="3m">3����</option>
			<option value="6m">6����</option>
			<option value="9m">9����</option>
			<option value="12m">12����</option>
		</select>
		</td>
	</tr>
	<tr>
		<td>�ο���</td>
		<td>
		<input type="text" name="number" size="3">��
		</td>
	</tr>
	<tr>
		<td>�������</td>
		<td><input type="text" name="title" size="40"></td>
	</tr>
	<tr>
		<td>����</td>
		<td><input type="text" name="title" size="40"></td>
	</tr>
	<tr>
		<td>����̹���</td>
		<td><input type="file" name="backgroundimg"></td>
	</tr>
	<tr>
		<td>ī�װ�</td>
		<td><select name="category">
			<option value="study">����</option>
			<option value="study">�</option>
			<option value="study">���</option>
			<option value="study">�Ĵ�</option>
			<option value="study">���</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>��������</td>
		<td>
		<input type="radio" name="condition" value="yes">����
		<input type="radio" name="condition" checked value="no">����
		</td>
	</tr>
	<tr>
		<td>������üũ</td>
		<td>
		<input type="radio" name="deposit" value="5w">5000��
		<input type="radio" name="deposit" value="10w">10000��
		<input type="radio" name="deposit" value="15w">15000��
		<input type="radio" name="deposit" value="20w">20000��
		</td>
	</tr>
	<tr>
		<td>�г�Ƽ</td>
		<td>
		<input type="radio" name="penalty" value="100p">100%
		<input type="radio" name="penalty" value="80p">80%
		<input type="radio" name="penalty" value="50p">50%
		<input type="radio" name="penalty" value="30p">30%
		</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="�游���">
	<input type="reset" value="���">
	</td>
	</tr>
</table>
</body>
</html>