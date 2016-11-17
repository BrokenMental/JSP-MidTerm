<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = null;
	if (session.getAttribute("id") != null) {
		id = (String) session.getAttribute("id");
	} else {
		out.println("<script>");
		out.println("alert('로그인 정보를 확인하세요');");
		out.println("location.href='Login.jsp'");
		out.println("</script>");
	}
%>
<script language="javascript">
	function writeCheck() {
		var form = document.dataInput;

		if (!form.name.value) {
			alert("이름을 적어주세요");
			form.text.focus();
			return;
		}
		if (!form.num.value) {
			alert("학번을 적어주세요");
			form.url.focus();
			return;
		}
		if (!form.favo.value) {
			alert("취미생활을 선택해주세요");
			form.url.focus();
			return;
		}

		form.submit();
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>favor.jsp</title>
</head>
<body align="center">

	<%=id%>님이 로그인 하셨습니다
	<a href=Login.jsp>로그아웃</a>

	<h2>취미생활</h2>
	<form name="dataInput" method="post" action="result.jsp">
		<table border="1" align="center" style="border-collapse: collapse;">
			<tr>
				<td width="100">이름</td>
				<td><input style="border: none" type="text" name="name"
					size="50" /></td>
			</tr>
			<tr>
				<td width="100">학번</td>
				<td><input style="border: none" type="text" name="num"
					size="50" /></td>
			</tr>
			<tr>
				<td width="100">취미 생활</td>
				<td><input type="radio" name="favo" value="Programming" />Programming
					<input type="radio" name="favo" value="Travel" />Travel <input
					type="radio" name="favo" value="Shopping" />Shopping <input
					type="radio" name="favo" value="Movie" />Movie</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="투표하기"
					Onclick="javascript:writeCheck();" /> <input type="reset"
					value="투표취소" /></td>
			</tr>
		</table>
	</form>
	<p>
		<a href=now.jsp>전체 취미 생활 선택 현황</a>
</body>
</html>