<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProductList</title>
</head>
<body>
<table>
<tr><th>제품번호</th><th>제품명</th><th>제품가격</th><th>재고량</th></tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "dbuser";
	String pw = "db1234";
	String sql = "select * from product";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, user, pw);
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
		
	while(rs.next()){
		out.println("<tr>");
        out.println("<td>"+rs.getInt("proNo")+"</td>");
        out.println("<td>"+rs.getString("proName")+"</td>");
        out.println("<td>"+rs.getInt("proPrice")+"</td>");
        out.println("<td>"+rs.getInt("proInv")+"</td>");
        out.println("</tr>");
	}
	rs.close();
	pstmt.close();
	con.close();
%>
</table>
</body>
</html>