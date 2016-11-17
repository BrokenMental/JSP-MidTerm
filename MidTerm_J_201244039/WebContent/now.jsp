<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>now.jsp</title>
</head>
<body align="center">
	<%
		ResultSet rs = null;

		int[] count = new int[4];
		String[] favo = { "Programming", "Travel", "Shopping", "Movie" };

		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/jspdb_j?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";
		Class.forName(jdbc_driver);

		try {
			Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			Statement stmt = conn.createStatement();
			for (int i = 0; i < favo.length; i++) {
				String sql = "SELECT COUNT FROM FAVOR WHERE FAV='" + favo[i] + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					if (favo[i] == "Programming") {
						count[i] = rs.getInt(1);
					} else if (favo[i] == "Travel") {
						count[i] = rs.getInt(1);
					} else if (favo[i] == "Shopping") {
						count[i] = rs.getInt(1);
					} else {
						count[i] = rs.getInt(1);
					}
				}
			}
	%>
	<%=id%>님이 로그인 하셨습니다
	<a href=Login.jsp>로그아웃</a>

	<h2>취미 생활 선택 현황</h2>
	<form>
		<table border="1" align="center" style="border-collapse: collapse;">
			<tr>
				<td width="100">취미 생활</td>
				<td width="100">투표 인원</td>
			</tr>
			<tr>
				<td width="100">Programming</td>
				<td><%=count[0]%></td>
			</tr>
			<tr>
				<td width="100">Travel</td>
				<td><%=count[1]%></td>
			</tr>
			<tr>
				<td width="100">Shopping</td>
				<td><%=count[2]%></td>
			</tr>
			<tr>
				<td width="100">Movie</td>
				<td><%=count[3]%></td>
			</tr>
			<%
				rs.close();
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</form>
	<a href=favor.jsp>취미 생활 선택</a>
</body>
</html>