<!DOCTYPE html>
<html>
<head>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
}

.navbar {
  overflow: hidden;
  background-color: #333;
}

.navbar a {
  float: left;
  font-size: 16px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: black;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color: #ddd;
}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>

<div class="navbar">
    <h3 style="float:left; color:white; margin:10px 20px;"> Shopcart.in</h3>
  <a href="index.jsp">Home</a>
  
  <div class="dropdown">
    <button class="dropbtn">Shop by Catagory 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="catagorypage.jsp?catagory=Mobiles">Mobiles</a>
      <a href="catagorypage.jsp?catagory=Electronics">Electronics</a>
      <a href="catagorypage.jsp?catagory=Home Products">Home Products</a>
      <a href="catagorypage.jsp?catagory=Women Fashion Wear">Women Fashion Wear</a>
         
    </div>
  </div>
   <% if (session.getAttribute("cname") == null) 
           { %>
      
  <a  style="float:right; " href="admin.jsp">Admin</a>
  <a style="float:right; " href="register.jsp">Sign Up</a>
  <a style="float:right;"href="login.jsp">Login</a>
  
  <%} else {%>
    <a style="float:right; " href="vieworder.jsp">View your orders</a>
  <a style="float:right; " href="gotocart.jsp">Cart</a>
  <a style="float:right;" href="logoutServlet">Log Out</a>
   <%}%>
</div>


</body>
</html>
