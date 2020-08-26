<%-- 
    Document   : menu.jsp
    Created on : 1 Apr, 2020, 12:19:23 AM
    Author     : Acer
--%>

  <%@page import="model.FetchProducts"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
      .glyphicon {
    font-size: 25px;
}
  </style>

<nav class="navbar navbar-inverse navbar-fixed-top" >
  <div class="container-fluid">
    <div style="padding-top:5px;" class="navbar-header">
        <a  class="navbar-brand"  href="index.jsp" >Shopcart.in</a>
    </div>
    <ul class="nav navbar-nav">
      <li style="padding-top:5px;" class="active"><a href="index.jsp">Home</a></li>
      <li style="padding-top:5px;" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Shop by Catagory <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="catagorypage.jsp?catagory=Mobiles">Mobiles</a></li>
          <li><a href="catagorypage.jsp?catagory=Electronics">Electronics</a></li>
           <li><a href="catagorypage.jsp?catagory=Home Products">Home Products</a></li>
          <li><a href="catagorypage.jsp?catagory=Women Fashion Wear">Women Fashion Wear</a></li>
         <li><a href="catagorypage.jsp?catagory=Kitchen Ware">Kitchen Ware</a></li>
         
          <li><a href="catagorypage.jsp?catagory=Foot Wear">Men's Footwear</a></li>
        </ul>
      </li>
      <li style="padding-top:5px;"><a href="offerpage.jsp?gotoofferpage=yes">Offers</a></li>
   
    </ul>
    <ul class="nav navbar-nav navbar-right">
         
  <%if(session.getAttribute("adminname")==null)   { %>
            
       <% if (session.getAttribute("cname") == null) 
           { %>
           <li style="padding-top:5px;"><a href="adminlogin.jsp">Admin</a></li>

           <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
       
      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     <%} else {  
       int items= FetchProducts.getrowsinanytable("mycart");
  %>
      <li><span style="color: white; margin:5px;" >  <h4 style="padding-top:8px; padding-right:20px;color:white;">  <%="Welcome     "   +session.getAttribute("cname")%></h4>  </span></li>
        <li><a href="gotocart.jsp"><span class="glyphicon glyphicon-shopping-cart"><%=items%></span></a></li>
       <li style="padding-top:5px;"><a href="vieworder.jsp">View your Orders</a></li>
       <li style="padding-top:5px;"><a href="logoutServlet">Logout</a></li>
   
     <%}%>
     <%} else{%>
     <li style="margin:5px;"><span style="color: white;  padding-top:5px;margin:10px;" >  <h4 style="padding-top:6px; padding-right:10px;color:white;">  <%="Welcome     "   +session.getAttribute("adminname")%></h4>  </span></li>
        <li style="padding-top:5px; color:white;" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage offers<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="viewoffers.jsp?page=1">View/Update/Delete offers</a></li>
          <li><a href="adminaddoffer.jsp">Add new offer</a></li>
           
       
         
        
        </ul>
      </li>
      
        
     
     <li style="margin:5px;"><a href="adminaddproducts.jsp">Add products</a></li>
       <li style="margin:5px;"><a href="admindeleteupdateproducts.jsp?page=1">Delete/Update products</a></li>
        
       <li style="margin:5px;"><a href="logoutServlet">Logout</a></li>
   <%}%>
    </ul>
      
  </div>
</nav>
    <br><Br><Br>
  
   