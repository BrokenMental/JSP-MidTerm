<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
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
<%
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb_j?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";

	request.setCharacterEncoding("UTF-8");
	Class.forName(jdbc_driver);

	String name = request.getParameter("name");
	String numb = request.getParameter("num");
	String favo = request.getParameter("favo");
	int count = 0;

	try {
		Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");
		Statement stmt = conn.createStatement();
		String sql = "SELECT COUNT FROM FAVOR WHERE FAV='" + favo + "'";
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			count = rs.getInt(1);
			count++;
		}

		sql = "UPDATE FAVOR SET COUNT='" + count + "'" + "WHERE FAV='" + favo + "'";
		stmt.executeUpdate(sql);
		rs.close();
		stmt.close();
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>result.jsp</title>
</head>

<body align="center">
	<%=id%>님이 로그인 하셨습니다
	<a href=Login.jsp>로그아웃</a>

	<h2>취미 생활 결과</h2>
	<form>
		<table border="1" align="center" style="border-collapse: collapse;">
			<tr>
				<td width="100">이름</td>
				<td width="380"><%=name%></td>
			</tr>
			<tr>
				<td width="100">학번</td>
				<td width="380"><%=numb%></td>
			</tr>
			<tr>
				<td width="100">취미 생활</td>
				<td width="380"><%=favo%></td>
			</tr>
		</table>
	</form>
	<a href=favor.jsp>취미 생활 선택</a>
	<p>
		<a href=now.jsp>전체 취미 생활 선택 현황</a>
</body>
</html>