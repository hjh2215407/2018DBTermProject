<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderForm</title>
</head>
<body>
<table>
<tr><th>메뉴</th></tr>
<tr><th>제품번호</th><th>제품명</th><th>제품가격</th></tr>
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
        out.println("</tr>");
	}
	rs.close();
	pstmt.close();
	con.close();
%>
</table>
<br />
<br />
<form action="Order.jsp" method="post">
유저 아이디 : <input type="text" size="20" name="ordCus" /><br />
제품번호 : <input type="text" size="20" name="ordPro" /><br />
수량 : <input type="text" size="20" name="ordNum" /><br />
예약날짜 : <input type="text" size="20" name="ordPreDate" /><br />
예약시간 : <input type="text" size="20" name="ordPreTime" /><br />
<input type="submit" value="주문" /><br />
</form>
</body>
</html>