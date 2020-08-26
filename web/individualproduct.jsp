<%-- 
    Document   : individualproduct
    Created on : 14 Mar, 2020, 10:59:05 AM
    Author     : Acer
--%>
<%@page import="java.util.*"%>
       
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*"%> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<%@ include file = "menu.jsp" %>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<%@page import="java.sql.*"%>


 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <title>JSP Page</title>
        <style>
            .images,.text{
             float:left;  
               
            }
            img{
                height:400px;
                width:50%;
            }
        </style>
    </head>
    <body>
        
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

        <br><Br><br><Br>
        <div>
           
            <div class="images" >
              <img src="images/<%=p.getImage()%>" height="20%" width="10%" style="padding-left:100px;">
              <br>
           
                <img src="images/<%=p.getImage1()%>" height="50%" width="30%" style="padding-left:100px;">
                <br>
             
                   <img src="images/<%=p.getImage2()%>" height="5%" width="10%" style="padding-left:100px;">
        </div>
        
             <div class="text" >
       <br><h2 style="color:red;padding-left:60px;"><%=p.getName()%></h2>
       <% if(p.getDiscount()==0) { %>
       <h1 style="padding-left:60px;"><b>Rs.<%= p.getPrice()%><b></h1>
                   <% } else {%>
          <p class="oldprice" style="text-decoration:line-through;padding-left:60px;"> Rs .<%=p.getPrice()%></p>
                 <p  style="padding-left:60px;"> <%=p.getDiscount()%> % off </p>
                 <h1 style="padding-left:60px;"><b> Rs .<%=p.getNewprice()%></b></h1>
                     <% } %>
        <h3 style="padding-left:60px;"><%= p.getFeature()%></h3>
        <form action="login.jsp">
            <input type="hidden" name="pid" value="<%=pid%>"/>
        <p style="margin-left:60px;">Select quantity:
        <select id="quantity" name="quantity" >
            <% for(i=1;i<=p.getQuantity();i++) {%>
            <option value="<%=i%>"><%=i%></option>
         <%} %>
        </select>
        </p>
        <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>"/>
         <input type="hidden" name="itemaddedtocart" value="yes"/>
         <br><br>
        <input  style="margin-left:70px;" type="submit" value="ADD TO CART" name="addtocartbutton"/>
        
        </form></div>
        </div></body>
</html>
