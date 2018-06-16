<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderList</title>
</head>
<body>
<table>
<tr><th>주문번호</th><th>주문고객</th><th>주문제품</th><th>주문날짜</th><th>주문수량</th><th>예약날짜</th><th>예약시간</th></tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:ORCL";
	String user = "dbuser";
	String pw = "db1234";
	String sql = "select * from orderManage order by ordNo desc";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, user, pw);
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
		
	while(rs.next()){		
		out.println("<tr>");
        out.println("<td>"+rs.getInt("ordNo")+"</td>");
        out.println("<td>"+rs.getString("ordCus")+"</td>");
        out.println("<td>"+rs.getString("ordPro")+"</td>");
        out.println("<td>"+rs.getString("ordDate")+"</td>");
        out.println("<td>"+rs.getInt("ordNum")+"</td>");
        out.println("<td>"+rs.getString("ordPreDate")+"</td>");
        out.println("<td>"+rs.getString("ordPreTime")+"</td>");
        out.println("</tr>");
	}
	rs.close();
	pstmt.close();
	con.close();
%>
</table>
</body>
</html>