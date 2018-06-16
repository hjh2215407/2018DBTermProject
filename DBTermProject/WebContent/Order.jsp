<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderComplete</title>
</head>
<body>
<%
	PreparedStatement check = null;

	request.setCharacterEncoding("utf-8");
	String ordCus=request.getParameter("ordCus");
	int ordPro= Integer.parseInt(request.getParameter("ordPro"));
	int ordNum= Integer.parseInt(request.getParameter("ordNum"));
	String ordPreDate=request.getParameter("ordPreDate");
	String ordPreTime=request.getParameter("ordPreTime");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMdd");
	String ordDate = formatter.format(new java.util.Date());
	
	
	Connection con = null;
	PreparedStatement pstmt = null;
	
	String url = "jdbc:oracle:thin:localhost:1521:ORCL";
	String user = "dbuser";
	String pw = "db1234";
	String sql = "insert into orderManage(ordNo, ordCus, ordPro, ordDate, ordNum, ordPreDate, ordPreTime) values ((select max(ordNo)+1 from orderManage), ?, ?, ?, ?, ?, ?)";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, user, pw);
	
	PreparedStatement complete = null;
	ResultSet rs = null;
	check = con.prepareStatement("select proInv from product where proNo ="+ordPro);
	rs = check.executeQuery();
	rs.next();
	int a = rs.getInt("proInv");
	if(a<=0){
		out.println("재고가 부족합니다.");
	}
	else{		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, ordCus);
		pstmt.setInt(2, ordPro);
		pstmt.setString(3, ordDate);
		pstmt.setInt(4, ordNum);
		pstmt.setString(5, ordPreDate);
		pstmt.setString(6, ordPreTime);
		pstmt.executeUpdate();
		
		out.println("주문이 완료되었습니다!");
		
		complete = con.prepareStatement("update product set proInv = proInv -"+ ordNum +"where proNo = "+ordPro);
		complete.executeUpdate();
		
		complete.close();
		pstmt.close();
		con.close();
	}
%>
<form action="Main.jsp" method="post">
<input type="submit" value="메인으로 가기" /><br />
</form>
</body>
</html>