<%-- 
    Document   : menu.jsp
    Created on : 1 Apr, 2020, 12:19:23 AM
    Author     : Acer
--%>

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
         
          <li><a href="catagorypage.jsp?catagory=Foot Wear">Men's Footwear</a></li>
        </ul>
      </li>
      <li style="padding-top:5px;"><a href="offerpage.jsp">Offers</a></li>
   
    </ul>
    <ul class="nav navbar-nav navbar-right">
         

            
       
      <li><span style="color: white; margin:7px;" >  <h4 style="margin:15px;color:white;">  <%="Welcome     "   +session.getAttribute("adminname")%></h4>  </span></li>
       
        <li style="padding-top:5px; color:white;" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage offers<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="viewoffers.jsp?page=1">View/Update/Delete offers</a></li>
          <li><a href="adminaddoffer.jsp">Add new offer</a></li>
      
       
         
        
        </ul>
      </li>
      

           <li><a  style="margin:5px;"href="adminaddproducts.jsp">Add products</a></li>
       
       
       <li style="padding-top:5px;"><a href="admindeleteupdateproducts.jsp?page=1">Delete/Update products</a></li>
       <li style="padding-top:5px;"><a href="logoutServlet">Logout</a></li>
   
     
     
    </ul>
      
  </div>
</nav>
    <br><Br><Br>
  
