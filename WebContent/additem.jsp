<%@ page import="java.sql.*" %>
<%

String name = request.getParameter("name");
String price = request.getParameter("price");
String cat = request.getParameter("cat");
String subcat = request.getParameter("subcat");


try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "restaurant", "datta");  
	 System.out.println("Connection Established");
	  
	 PreparedStatement pstmt = con.prepareStatement("insert into menu values(?,?,?,?)");
	 pstmt.setString(1,name);
	 pstmt.setString(2,price);
	 pstmt.setString(3,cat);
	 pstmt.setString(4,subcat);
	 int n=pstmt.executeUpdate();
	 if(n==1)
	 {
		 response.sendRedirect("menu.jsp");
	 }
	 else
	 {
		 out.println("Failed To Enter Values");
	 }
          
	  
}
catch(Exception e)
{
	out.println(e);
}
%>