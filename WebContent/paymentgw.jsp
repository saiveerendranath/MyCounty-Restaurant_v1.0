<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<!-- Required meta tags always come first -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="css/dattastyles.css">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="bootstrap-social/bootstrap-social.css">

<head>
    <title>Payment Gateway</title>
</head>

<body>
    <nav class="navbar navbar-dark navbar-expand-sm fixed-top" >
        <div class="container">
            <a class="navbar-brand mr-auto" href="#"><img src="img/logo.png" height="30" width="41"></a>
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Navbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="Navbar">
                 <ul class="navbar-nav mr-auto">
                   
                </ul> 
            </div>
            <div class="dropdown">
                <span class="fa fa-user fa-lg dropdown-toggle text-white" data-toggle="dropdown"></span>
                <div class="dropdown-menu">
                    
                </div>
            </div>

                           
        </div>
    </nav>
    <header>
        <div id="demo" class="carousel slide" data-ride="carousel">
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
            </ul>

            <div class="carousel-inner">
                <div class="carousel-item active">
                  <img class="img-fluid" src="img/homepage1.jpg" alt="" height="100%" width="100%" style="opacity: 0.7;">
                  <div class="carousel-caption text-white">
                    <h3>Enjoy Your Food</h3>
                    <p>Like Ever Before in MyCounty</p>
                  </div>
                </div>
            </div>

            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </header>

<%
   Class.forName("oracle.jdbc.driver.OracleDriver");
   System.out.println("Driver Classes Loaded");  
   Connection con = null;
   con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "restaurant", "datta");  
   System.out.println("Connection Established");

   String pay= request.getParameter("pay");
   
   if(pay==null || pay.equals("0"))
	{
		%>
		<script>
				alert("You Can't Book Table Without Selecting Food");
				window.location="menu.jsp";
		</script>
		<%
	}
   
   
   %>


		<div class="container">
			<div class="row row-content">
            
	            <div class="col-12 offset-md-3 col-md-6">
	                <div class="card">
	                    
	                    <h3 class="card-header text-white" style="background-color:  #0a0852;">Payment</h3>
	                    <div class="card-body">
	                        <form method="post" action="transaction.jsp">
	                            <div class="form-group row">
	                                <label class="col-3">Name</label>
	                                <div class="col-6">
	                                    <input type="text" class="form-control" id="dummy-name" name="dummy-name" placeholder="Card Holder Name" required>
	                                </div>
	                                
	                            </div>
	
	                            <div class="form-group row">
	                                <label class="col-3">Card Number</label>
	                                <div class="col-6">
	                                    <input type="text" class="form-control" id="dummy-num" name="dummy-num" placeholder="Enter Card Number" required>
	                                </div>
	                            </div>
	                            
	                             <div class="form-group row">
	                                <label class="col-3">CVV</label>
	                                <div class="col-3">
	                                    <input type="text" class="form-control" id="dummy-code" name="dummy-code" placeholder="Code" required>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label class="col-3">Postal</label>
	                                <div class="col-3">
	                                    <input type="text" class="form-control" id="dummy-postal" name="dummy-postal" placeholder="Postal" required>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label class="col-3">Total</label>
	                                <div class="col-6">
	                                    <input type="text" class="form-control" id="pay" name="pay" value="<%=pay%>" placeholder="Pay" readonly="readonly">
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <div class="col-2 offset-3">
	                                	<input class="btn text-white" style="background-color:  #0a0852;" type="submit" value="PAY"> 
	                                    
	                                </div>
	                            </div>
	
	                            
	                        </form>
	                        
	                    </div>
	                </div>
	            </div>
	        </div>
		
		
		</div>
	  
    
    <footer class="footer">
        <div class="container">
            <div class="row">             
                <div class="col-4 offset-1 col-sm-2">
                    
                </div>
                <div class="col-7 col-sm-5">
                    <h5>Our Address</h5>
                    <address>
		              K L University, Vaddeshwaram<br>
		              Green Fields, Guntur<br>
		              Andhra Pradesh<br>
		              Tel.: 852 1234 5678<br>
		              Email: <a href="mailto:confusion@food.net">kluniversity@gmail.com</a>
		           </address>
                </div>
                <div class="col-12 col-sm-4 align-self-center">
                    <div class="text-center">
                        <a class="btn btn-social-icon btn-google" href="http://google.com/+"><i class="fa fa-google-plus"></i></a>
                        <a class="btn btn-social-icon btn-facebook" href="http://www.facebook.com/profile.php?id="><i class="fa fa-facebook"></i></a>
                        <a class="btn btn-social-icon btn-linkedin" href="http://www.linkedin.com/in/"><i class="fa fa-linkedin"></i></a>
                        <a class="btn btn-social-icon btn-twitter" href="http://twitter.com/"><i class="fa fa-twitter"></i></a>
                        <a class="btn btn-social-icon btn-google" href="http://youtube.com/"><i class="fa fa-youtube"></i></a>
                        <a class="btn btn-social-icon" href="mailto:"><i class="fa fa-envelope-o"></i></a>
                    </div>
                </div>
           </div>
           
        </div>
    </footer>

</body>
  <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
  <script src="jquery/dist/jquery.slim.min.js"></script>
  <script src="popper.js/dist/umd/popper.min.js"></script>
  <script src="bootstrap/dist/js/bootstrap.min.js"></script>
</html>