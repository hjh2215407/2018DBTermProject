<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String cusId = request.getParameter("cusId");
	String cusName = request.getParameter("cusName");
	String cusTel = request.getParameter("cusTel");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:localhost:1521:ORCL";
	String user = "dbuser";
	String pw = "db1234";
	String sql = "insert into customer(cusId, cusName, cusTel) values (?, ?, ?)";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, user, pw);
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, cusId);
	pstmt.setString(2, cusName);
	pstmt.setString(3, cusTel);
	pstmt.executeUpdate();
	
	out.println("회원 등록 완료!");

	pstmt.close();
	con.close();
%>
<form action="Main.jsp" method="post">
<input type="submit" value="메인으로 가기" /><br />
</form>
</body>
</html>