<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.invalidate();
%>
<html>
<script language="javascript">
	function writeCheck() {
		var form = document.idpw;
		if (!form.id.value) {
			alert("아이디를 입력해주세요");
			form.text.focus();
			return;
		}
		if (!form.pw.value) {
			alert("비밀번호를 입력해주세요");
			form.text.focus();
			return;
		}
		form.submit();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login.jsp</title>
</head>
<body>
	<h2 align="center">로그인</h2>
	<form name="idpw" method="post" action=Login_Process.jsp>
		<table align="center">
			<tr>
				<td>아 이 디 :</td>
				<td><input type="text" name=id /></td>
			</tr>
			<tr>
				<td>패스워드 :</td>
				<td><input type="text" name="pw" /></td>
			</tr>
			<tr align="right">
				<td></td>
				<td><input type="button" value="로그인" Onclick="javascript:writeCheck();"></td>
			</tr>
		</table>
	</form>
</body>
</html>