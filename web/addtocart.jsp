<%-- 
    Document   : gotocart
    Created on : 16 Mar, 2020, 5:49:55 AM
    Author     : Acer
--%>

<%@page import="java.sql.*"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "menu.jsp" %>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!DOCTYPE html>
<html>
    <head><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
       <style>
            .images,.text{
             float:left;  
               
            }
            img{
                height:300px;
                width:50%;
            }
        </style>
     
    </head>
    <body>
        <br><Br><Br><Br>
        
                <% Product p=new Product();
       
         String pid=request.getParameter("pid");
       // if(session.isNew())
     // if (session.getAttribute("cname") == null) 
     session.setAttribute("pid", pid);
    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from products  where productid=?");
            ps.setString(1,request.getParameter("pid").toString());
           ResultSet rs= ps.executeQuery();
    
       while(rs.next())
       {
                p.setCatagory(rs.getString(2));
          p.setName(rs.getString(3));
          p.setQuantity(rs.getInt(4));
          p.setPrice(rs.getInt(5));
          p.setImage(rs.getString(6));
          p.setFeature(rs.getString(7));
          p.setImage1(rs.getString(8));
          p.setImage2(rs.getString(9));
          p.setPid(rs.getString(1));
          p.setDiscount(rs.getInt(11));
          p.setNewprice(rs.getInt(5)-(rs.getInt(5)*rs.getInt(11)/100));
       } }catch(Exception e){} 
int i;
        %>

        <div>
                   
            <div class="images" >
              <img src="images/<%=p.getImage()%>" height="20%" width="10%" style="padding-left:100px;">
              <br>
           
                <img src="images/<%=p.getImage1()%>" height="50%" width="30%" style="padding-left:100px;">
                <br>
             
                   <img src="images/<%=p.getImage2()%>" height="5%" width="10%" style="padding-left:100px;">
        </div>
        
             <div class="text" >
       <br><h2 style="color:red;margin-left:10px;"><%=p.getName()%></h2>
       <% if(p.getDiscount()==0) { %>
       <h1 style="margin-left:10px;"><b>Rs.<%= p.getPrice()%><b></h1>
                   <% } else {%>
          <p class="oldprice" style="text-decoration:line-through;margin-left:10px;"> Rs .<%=p.getPrice()%></p>
                 <p  style="margin-left:10px;"> <%=p.getDiscount()%> % off </p>
                 <h1 style="margin-left:10px;"><b> Rs .<%=p.getNewprice()%></b></h1>
                     <% } %>
        <h3 style="margin-left:10px;"><%= p.getFeature()%></h3>
        <br>
        <p style="margin-left:10px;">Quantity added :<%=Integer.parseInt(request.getParameter("quantity"))%> </p> 
        </div>
        
        
        
        <br><br><Br><Br> 
        <BR><BR><Br><Br>
        <br><Br><Br><Br><br><br><br><br><Br>
        <div style=" margin-left:420px;padding-left:60px; ">
            <p> Item added successfully in cart</p><br>
        <a href="gotocart.jsp"><button>Go to cart</button></a>&nbsp;&nbsp;
        <a href="index.jsp"> <button>Continue Shopping</button></a>
        </div>
        </div>
    </body>
</html>
