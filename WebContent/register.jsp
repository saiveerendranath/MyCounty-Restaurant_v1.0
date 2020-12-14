<%@ page import="java.sql.*" %>
<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String password = request.getParameter("pwd");
String pnum = request.getParameter("phonenum");


try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 System.out.println("Driver Classes Loaded");  
	 Connection con = null;
	 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "restaurant", "datta");  
	 System.out.println("Connection Established");
	  
	 PreparedStatement pstmt = con.prepareStatement("insert into customer values(?,?,?,?,?)");
	 pstmt.setString(1,fname);
	 pstmt.setString(2,lname);
	 pstmt.setString(3,email);
	 pstmt.setString(4,pnum);
	 pstmt.setString(5,password);
	 int n= pstmt.executeUpdate();
	 if(n==1)
	 {
		 %>
		 <script>
				alert("Registered Sucessfully");
				window.location="index.html#login";
		</script>
		 <%
	 }
	 else
	 {
		 %>
		 <script>
				alert("Registeration Failed");
				window.location="register.html";
		</script>
		 <%
	 }
	  
}
catch(Exception e)
{
	out.println(e);
}
%>