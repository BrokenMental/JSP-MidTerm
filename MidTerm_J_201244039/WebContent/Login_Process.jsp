<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String idd = request.getParameter("id");
		String pww = request.getParameter("pw");
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/jspdb_j?useSSL=false&jdbcCompliantTruncation=false&characterEncoding=utf8&characterSetResults=utf8";
		Class.forName(jdbc_driver);
		ResultSet rs = null;

		try {
			Connection conn = DriverManager.getConnection(jdbc_url, "root", "1234");
			Statement stmt = conn.createStatement();
			String sql = "SELECT * FROM IDPW";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				if(idd.equals(rs.getString(1)) && pww.equals(rs.getString(2))){
					session.setAttribute("id",idd);
					out.println("<script>");
					out.println("alert('로그인에 성공하셨습니다');");
					out.println("location.href='favor.jsp'");
					out.println("</script>");
				}
			}
			out.println("<script>");
			out.println("alert('아이디 혹은 비밀번호를 확인하세요');");
			out.println("location.href='Login.jsp'");
			out.println("</script>");
			rs.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>

</body>
</html>