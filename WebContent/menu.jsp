<%@ page import="java.sql.*" %>

<%

Class.forName("oracle.jdbc.driver.OracleDriver");
System.out.println("Driver Classes Loaded");  
Connection con = null;
con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "restaurant", "datta");  
System.out.println("Connection Established");

String email=session.getAttribute("email").toString();
String pwd=session.getAttribute("pwd").toString();







%>
<%
PreparedStatement pstmt=con.prepareStatement("select * from menu");
ResultSet rs=pstmt.executeQuery();


PreparedStatement pstmt2=con.prepareStatement("select * from adminuser where email=? and password=?");
pstmt2.setString(1,email);
pstmt2.setString(2,pwd);
ResultSet rs2=pstmt2.executeQuery();

%>

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
<style>
	.btn-color{
		background-color:white;
		color:#0a0852;
		border:2px solid #0a0852;
	}
	
	.btn-color:hover{
		background-color:#0a0852;
		color:white;
	}
</style>
<head>
    <title>MyCounty Menu</title>
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
                    <li class="nav-item"><a class="nav-link" href="./home.html"><span class="fa fa-home fa-lg"></span> Home</a></li>
                    
                    <li class="nav-item active"><a class="nav-link" href="./menu.jsp"><span class="fa fa-list fa-lg"></span> Menu</a></li>
                    <li class="nav-item"><a class="nav-link" href="./contact.jsp"><span class="fa fa-address-card fa-lg"></span> Contact</a></li>
                </ul> 
            </div>
            <div class="dropdown">
                <span class="fa fa-user fa-lg dropdown-toggle text-white" data-toggle="dropdown"></span>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="profile.jsp">Profile</a>
                    <a class="dropdown-item" href="transaction.jsp">Reservation</a>
                    <a class="dropdown-item" href="logout.jsp">Logout</a>
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

        
        <section id="portfolio">
            
            <div class="container">
                <div class="row">
                    <div class="gallary col-10 mx-auto">
                        <h1 class="galler-title"> Menu</h1>
                    </div>
                    <div class="col-1 align-self-center">
                        <h5 id="money"></h5>
                    </div>
                    <div class="col-1 align-self-center">
                    
                    <button type="button" class="btn btn-color" data-toggle="modal" data-target="#myModal">
					    <span class="fa fa-shopping-cart fa-lg"></span>
					  </button>
					
					  <div class="modal" id="myModal">
					    <div class="modal-dialog">
					      <div class="modal-content">
					      
					        <div class="modal-body">
					         <table class="table">
									   <thead class="thead-dark">
											<tr>
												<th>Name</th>
												<th>Quantity</th>
												<th>Price</th>
											</tr>
											</thead>
											<tbody id="print">
											</tbody>
							</table>
					        </div>
					      </div>
					    </div>
					  </div>
                    
                    </div>
                </div>
                <div class="row">
                	<div class="col-12">
                		<h2 id="item"></h2>
                	</div>
                </div>
                
                <div class="row ">
                    <div class="col-auto">
                        <button class="btn btn-default filter-button" data-filter="all">All</button>
                     </div>
                     <div class="col-auto">
                        <div class="dropdown">
                        	<button class="btn dropdown-toggle" data-toggle="dropdown">Vegitarian</button>
                        	<div class="dropdown-menu">
                        		<a class="dropdown-item filter-button" data-filter="veg-starter">Starter</a>
                        		<a class="dropdown-item filter-button" data-filter="veg-maincourse">Main Course</a>
                        	</div>
                        </div>
                     </div>
                     <div class="col-auto">
                     	<button class="btn dropdown-toggle" data-toggle="dropdown">Non-Vegitarian</button>
                        <div class="dropdown-menu">
                        	<a class="dropdown-item filter-button" data-filter="nonveg-starter">Starter</a>
                        	<a class="dropdown-item filter-button" data-filter="nonveg-maincourse">Main Course</a>
                        </div>
                        
                     </div>
                     <div class="col-auto">
                     	<button class="btn dropdown-toggle" data-toggle="dropdown">Desert</button>
                        <div class="dropdown-menu">
                        	<a class="dropdown-item filter-button" data-filter="desert-icecream">Ice-Cream</a>
                        	<a class="dropdown-item filter-button" data-filter="desert-pastry">Pastry</a>
                        	<a class="dropdown-item filter-button" data-filter="desert-sweet">Sweets</a>
                        </div>
                        
                    </div>
                </div>
                <div class="row row-content">
                	<%
                	if(rs2.next())
                	{%>
                	<%
                	while(rs.next())
            		{
            			String name=rs.getString(1);
            			String price=rs.getString(2);
            			String cat=rs.getString(3);
            			String subcat=rs.getString(4);
            			%>
            			<div class="gallery_product col-4 filter center <%=cat%>-<%=subcat%>" style="padding: 20px 15px 20px 15px">
            				<div class="card card-body">
            					<dl class="row">
            						<dt class="col-10 offset-1 card-col"><img class="img-thumbnail" src="food/<%=name%>.jpg" style="width:250px; heigth:250px"></dt>
            						<dt class="col-12 card-col"><h4><%=name%></h4></dt>
            						<dt class="col-4 offset-1 card-col"><h2><span class="badge badge-pill badge-secondary"><%=price%></span></h2></dt>
            						<%
            							if(cat.equals("veg"))
            							{%>
            								<dt class="col-3 card-col"><h2><span class="badge badge-success">VEG</span></h2></dt>
            							<%
            							}
            							else if(cat.equals("nonveg"))
            							{%>
            								<dt class="col-3 card-col"><h2><span class="badge badge-danger">NON-VEG</span></h2></dt>
            							<%
            							}
            							else
            							{%>
            								<dt class="col-3 card-col"><h2><span class="badge badge-primary">DESERT</span></h2></dt>
            							<%
            							}
            						%>
            						
            						
                            		
            					</dl>
            				</div>
            			</div>
            			<%
            		}

                		
                	}
                	else{
                	
                	
                		while(rs.next())
                		{
                			String name=rs.getString(1);
                			String price=rs.getString(2);
                			String cat=rs.getString(3);
                			String subcat=rs.getString(4);
                			%>
                			<div class="gallery_product col-4 filter center <%=cat%>-<%=subcat%>" style="padding: 20px 15px 20px 15px">
                				<div class="card card-body">
                					<dl class="row">
                						<dt class="col-10 offset-1 card-col"><img class="img-thumbnail" src="food/<%=name%>.jpg" style="width:250px; heigth:250px"></dt>
                						<dt class="col-10 offset-1 card-col"><h4><%=name%></h4></dt>
                						<dt class="col-4 offset-1 card-col"><h2><span class="badge badge-pill badge-secondary"><%=price%></span></h2></dt>
                						<%
                							if(cat.equals("veg"))
                							{%>
                								<dt class="col-3 card-col"><h2><span class="badge badge-success">VEG</span></h2></dt>
                								<%
                								if(subcat.equals("starter")&& !name.equals("Crispy Corn"))
                								{
                								%>
                								<dt class="col-3 offset-2 card-col"><h2><span class="badge badge-success">5 PIECES</span></h2></dt>
                								<dt class="col-auto"></dt>
                								<%} %>
                							<%
                							}
                							else if(cat.equals("nonveg"))
                							{%>
                								<dt class="col-3 card-col"><h2><span class="badge badge-danger">NON-VEG</span></h2></dt>
                								<%
                								if(subcat.equals("starter"))
                								{
                								%>
                								<dt class="col-3 offset-3 card-col"><h2><span class="badge badge-success">5 PIECES</span></h2></dt>
                								<dt class="col-auto"></dt>
                								<%} %>
                							<%
                							}
                							else
                							{%>
                								<dt class="col-3 card-col"><h2><span class="badge badge-primary">DESERT</span></h2></dt>
                								<%
                								if(subcat.equals("icecream"))
                								{
                								%>
                								<dt class="col-3 offset-3 card-col"><h2><span class="badge badge-success">3 SCOOPS</span></h2></dt>
                								<dt class="col-auto"></dt>
                								<%} %>
                								<%
                								if(subcat.equals("pastry"))
                								{
                								%>
                								<dt class="col-3 offset-3 card-col"><h2><span class="badge badge-success">1 PIECE</span></h2></dt>
                								<dt class="col-auto"></dt>
                								<%} %>
                								<%
                								if(subcat.equals("sweet"))
                								{
                								%>
                								<dt class="col-3 offset-3 card-col"><h2><span class="badge badge-success">3 SWEETS</span></h2></dt>
                								<dt class="col-auto"></dt>
                								<%} %>
                							<%
                							}
                						%>
                						
                						<%if(name.equals("Chicken Biryani") ||name.equals("Paneer Biryani") ||name.equals("Egg Biryani")||name.equals("Mutton Biryani")) 
                						{%>
                							<dt class="col-4 offset-2 card-col align-self-center">
                								<div class="dropdown">
                									<button class="btn btn-color dropdown-toggle" data-toggle="dropdown">ADD</button>
                									<div class="dropdown-menu">
                										<% int family=Integer.parseInt(price)+100;
                										  int jumbo=Integer.parseInt(price)+200;
                										%>
                										<button class="dropdown-item btn" id="<%=name%> Single Pack" value="<%=price%>" onclick="addFunction(this.id,this.value)">Single</button>
                										<button class="dropdown-item btn" id="<%=name%> Family Pack" value="<%=family%>" onclick="addFunction(this.id,this.value)">Family Pack</button>
                										<button class="dropdown-item btn" id="<%=name%> Jumbo Pack" value="<%=jumbo%>" onclick="addFunction(this.id,this.value)">Jumbo Pack</button>
                									</div>
                								</div>
                							</dt>
                							<dt class="col-4 card-col align-self-center">
                								<div class="dropdown">
                									<button class="btn btn-color dropdown-toggle" data-toggle="dropdown">Remove</button>
                									<div class="dropdown-menu">
                										
                										<button class="dropdown-item btn" id="<%=name%> Single Pack" value="<%=price%>" onclick="removeFunction(this.id,this.value)">Single</button>
                										<button class="dropdown-item btn" id="<%=name%> Family Pack" value="<%=family%>" onclick="removeFunction(this.id,this.value)">Family Pack</button>
                										<button class="dropdown-item btn" id="<%=name%> Jumbo Pack" value="<%=jumbo%>" onclick="removeFunction(this.id,this.value)">Jumbo Pack</button>
                									</div>
                								</div>
                							</dt>
                						<%}
                						else
                						{%>
                						<dt class="col-4 offset-2 card-col align-self-center"><button class="btn btn-color" id="<%=name%>" value="<%=price%>" onclick="addFunction(this.id,this.value)">ADD</button></dt>
                                		<dt class="col-6 card-col align-self-center"><button class="btn btn-color" id="<%=name%>" value="<%=price%>" onclick="removeFunction(this.id,this.value)">REMOVE</button></dt>
                                		<%}%>
                                		
                					</dl>
                				</div>
                			</div>
                			<%
                		}
                	}
                	%>
                </div>

				
					
                <%
                	PreparedStatement pstmt1=con.prepareStatement("select * from adminuser where email=? and password=?");
                	pstmt1.setString(1,email);
                	pstmt1.setString(2,pwd);
                	ResultSet rs1=pstmt1.executeQuery();
                	if(rs1.next())
                	{
                		%>
                			<div class="row row-content">
                				<div class="col-12" id="accordion">
                					<div class="card">
                						<div class="card-header"><a class="card-link" data-toggle="collapse" href="#collapseOne">Add Item</a></div>
                						<div id="collapseOne" class="collapse" data-parent="#accordion">
                						<div class="card-body">
                        					<form method="post" action="additem.jsp">
                            					<div class="form-group row">
                                					<label class="col-3">Item Name</label>
                                					<div class="col-6">
                                    					<input type="text" class="form-control" id="name" name="name" placeholder="Enter Item Name">
                                					</div>
                                
                            					</div>

					                            <div class="form-group row">
					                                <label class="col-3">Item Price</label>
					                                <div class="col-6">
					                                    <input type="text" class="form-control" id="price" name="price" placeholder="Enter Price">
					                                </div>
					                            </div>
					                            
					                            <div class="form-group row">
					                                <label class="col-3">Item Category</label>
					                                <div class="col-6">
					                                    <input type="text" class="form-control" id="cat" name="cat" placeholder="Enter Category">
					                                </div>
					                            </div>
					                            
					                            <div class="form-group row">
					                                <label class="col-3">Sub Category</label>
					                                <div class="col-6">
					                                    <input type="text" class="form-control" id="subcat" name="subcat" placeholder="Enter Sub Category">
					                                </div>
					                            </div>
                            
					                            <div class="form-group row">
					                                <div class="col-2 offset-3">
					                                	<input class="btn text-white" style="background-color:  #0a0852;" type="submit" value="Add"> 
					                                    
					                                </div>
					                            </div>

					                            
                        					</form>
                        
                    					</div>
                    					</div>
                					</div>
                					
                					<div class="card">
                						<div class="card-header"><a class="card-link" data-toggle="collapse" href="#collapseTwo">Change Item Price</a></div>
                						<div id="collapseTwo" class="collapse" data-parent="#accordion">
                						<div class="card-body">
                        					<form method="post" action="changeprice.jsp">
                            					<div class="form-group row">
                                					<label class="col-3">Item Name</label>
                                					<div class="col-6">
                                    					<input type="text" class="form-control" id="name" name="name" placeholder="Enter Item Name">
                                					</div>
                                
                            					</div>

					                            <div class="form-group row">
					                                <label class="col-3">New Price</label>
					                                <div class="col-6">
					                                    <input type="text" class="form-control" id="price" name="price" placeholder="Enter New Price">
					                                </div>
					                            </div>
                            
					                            <div class="form-group row">
					                                <div class="col-2 offset-3">
					                                	<input class="btn text-white" style="background-color:  #0a0852;" type="submit" value="Change"> 
					                                    
					                                </div>
					                            </div>

					                            
                        					</form>
                        
                    					</div>
                    					</div>
                					</div>
                					
                				</div>
                			</div>
                		<%
                	}
                	else
                	{
                		PreparedStatement pstmt4=con.prepareStatement("select * from transaction where email=?");
                		pstmt4.setString(1, email);
                		ResultSet rs4=pstmt4.executeQuery();
                		if(rs4.next())
                		{
                		
                		}
                		else
                		{
                		%>
                			<div class="row row-content">
                				<div class="col-3 offset-5">
                					<form onSubmit="assignValue()" method="post" action="paymentgw.jsp">
                						<button class="btn btn-color btn-block" type="submit" id="pay" name="pay" value="Pay">Pay</button>
                					</form>
                				</div>
                			</div>
                		<%
                		}
                	}
                %>

            </div>
        </section>

    <footer class="footer">
        <div class="container">
            <div class="row">             
                <div class="col-4 offset-1 col-sm-2">
                    <h5>Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Menu</a></li>
                        <li><a href="#">Contact</a></li>
                    </ul>
                </div>
                <div class="col-7 col-sm-5">
                    <h5>Our Address</h5>
                    <address>
		              121, Clear Water Bay Road<br>
		              Clear Water Bay, Kowloon<br>
		              HONG KONG<br>
		              Tel.: +852 1234 5678<br>
		              Fax: +852 8765 4321<br>
		              Email: <a href="mailto:confusion@food.net">confusion@food.net</a>
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
           <div class="row justify-content-center">             
                <div class="col-auto">
                    <p>© Copyright 2018 Ristorante Con Fusion</p>
                </div>
           </div>
        </div>
    </footer>

</body>
  <!-- jQuery first, then Popper.js, then Bootstrap JS. -->
  <script src="jquery/dist/jquery.slim.min.js"></script>
  <script src="popper.js/dist/umd/popper.min.js"></script>
  <script src="bootstrap/dist/js/bootstrap.min.js"></script>
  <script>
    sum=0;
    var quantity=new Map();
    var price=new Map();
    
    function addFunction(id,value)
    {
    	sum=sum+parseInt(value);
    	var str="";
    	if(quantity.has(id))
        {
        	
            
            n=quantity.get(id);
            n=n+1;
            p=price.get(id);
            p=p+parseInt(value);
            quantity.set(id,n);
            price.set(id,p);
            
        }
    	else{
    	
    	quantity.set(id,1);
        price.set(id,parseInt(value));
        
    	}
        for(var key of quantity.keys())
        {
        	str=str+"<tr><td>"+key+"</td><td>"+quantity.get(key)+"</td><td>"+price.get(key)+"</td></tr>";
        }
        
            document.getElementById("print").innerHTML=str;

    	
    }
    
    function removeFunction(id,value)
    {
    	sum=sum-parseInt(value);
    	var str="";
    	if(quantity.has(id))
        {
        	
            
            n=quantity.get(id);
            n=n-1;
            p=price.get(id);
            p=p-parseInt(value);
            
            if(n==0)
            {
            	quantity.delete(id);
                price.delete(id);
            }
            else
            {
            	quantity.delete(id);
                price.delete(id);
                quantity.set(id,n);
                price.set(id,p);
            }
            
        }
        for(var key of quantity.keys())
        {
        	str=str+"<tr><td>"+key+"</td><td>"+quantity.get(key)+"</td><td>"+price.get(key)+"</td></tr>";
        }
        
         document.getElementById("print").innerHTML=str;
    }
    
    function assignValue()
    {
        document.getElementById("pay").value=sum;
        alert(price);
        alert(quantity);
        alert(document.getElementById("pay").value);

    }
    
</script>
  <script>
      $(document).ready(function(){

        $(".filter-button").click(function(){
            var value = $(this).attr('data-filter');
            if(value=="all")
            {
                $('.filter').show('1000');
            }
            else
            {
                $(".filter").not('.'+value).hide('3000');
                $(".filter").filter('.'+value).show('3000');
            }
        });
            if($(".filter-button").removeClass("active")){
                $(this).removeClass("active");
            }
            $(this).addClass("active");
      });
  </script>

 

</html>
