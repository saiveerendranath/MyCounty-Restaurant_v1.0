<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("email");
String password = request.getParameter("pwd");



try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "restaurant", "datta");  
	 System.out.println("Connection Established");
	  
	 PreparedStatement pstmt = con.prepareStatement("select * from customer where email=? and password=?");
	 pstmt.setString(1,email);
	 pstmt.setString(2,password);
	 
	 PreparedStatement pstmt1 = con.prepareStatement("select * from adminuser where email=? and password=?");
	 pstmt1.setString(1,email);
	 pstmt1.setString(2,password);
	 
	 ResultSet rs= pstmt.executeQuery();
	 
	 ResultSet rs1= pstmt1.executeQuery();
	 if(rs.next())
	 {
		 session.setAttribute("email",email);
		 session.setAttribute("pwd",password);
		 response.sendRedirect("home.html");
	 }
	 if(rs1.next())
	 {
		 session.setAttribute("email",email);
		 session.setAttribute("pwd",password);
		 response.sendRedirect("home.html");
	 }
	 else
	 {
		 %>
			<script>
					alert("Wrong Login Username or Password");
					window.location="index.html#login";
			</script>
			<%
	 }
          
	  
}
catch(Exception e)
{
	out.println(e);
}
%>