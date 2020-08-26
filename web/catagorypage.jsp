<%-- 
    Document   : catagorypage
    Created on : 31 Mar, 2020, 1:55:29 AM
    Author     : Acer
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*"%> 
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%@page import="java.sql.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


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

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@page import="java.util.List"%>
<%@page import="model.FetchProducts"%>
<%@page import="model.Product"%>

<%@ include file = "menu.jsp" %>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        
        <title>JSP Page</title>
          <style>
            p.Pname{
                color:blue;
                font:bold;
                font-size: 20px; 
            }
            p.price{
                color:green;
                font:bold;
                font-size: 15px; 
            }
            .row{width:100%;
                 margin-top:50px;
                 
            height:300px;
            clear:both;
            }
            .separate{
                text-align: center;
                width:14%;
                float:left;
            margin-left:10%;
            margin-top:6%;
            position:relative;
            
            
            }
            .pname{
                margin-top:5%;}
            .offer{
                background-color: buttonface;
                 text-align: center;
               width:80%;
            height:300px;
         
            margin-top:100px;
            margin-left:100px;
            margin-right:100px;
            margin-bottom:5px;
            padding:10px;
            }
            .image{
                height:100%;
                width:100%;
            }
        </style>

    </head>
    <body>
        <h1>
        
    <%   String s=request.getParameter("catagory");
    out.println(s);%>
       
        </h1>
    <% 
            if(FetchProducts.withinofferperiod(s))
            {     
                FetchProducts.updatediscountpercentage(s);
            } else FetchProducts.setdiscounttozero(s);
            List<Product> list= FetchProducts.fetchallproducts(s);
           
        %>
        
            
        
        
            
            
            <div class="row">       
                
            
            <%  int m=1;
                for(Product p: list) {
                if(m%5==0){ out.println("<br><br><br><br><br><br><br><br><br>");}
           %> <div class="separate">
<%  if(session.getAttribute("adminname")!=null){%>
           <img  style="height:300px;width:80%"src="images/<%=p.getImage()%>" width="25%" height="25%"  align="center" style=" padding-left:5px;">
            <%}else{%>        
               
               
                <a href="individualproduct.jsp?pid=<%=p.getPid()%>">
                    <img  style="height:300px;width:80%"src="images/<%=p.getImage()%>" width="25%" height="25%"  align="center" style=" padding-left:5px;"></a>
                    <%}%>
                   <p class="Pname"><%=p.getName()%></p>
                <p> <%=p.getFeature()%></p>
                <%    if(FetchProducts.withinofferperiod(s))
            {
          %>    <p class="oldprice" style="text-decoration:line-through;"> Rs .<%=p.getPrice()%></p>
                 <p > <%=p.getDiscount()%> % off </p>
                 <h4><b> Rs .<%=p.getNewprice()%></b></h4>
           <% }  else {%>
            <h4 class="price"><b> Rs .<%=p.getNewprice()%></b></h4>
                <% } %>
                <p>Quantity  :<%=p.getQuantity()%></p>
  <%  if(session.getAttribute("adminname")==null){%>
                
                <a href="individualproduct.jsp?pid=<%=p.getPid()%>"> <button STYLE="color:green;">ADD TO CART </button> </a>           
                <%}%>
            </div> 
              <%  m=m+1;}  %>      
              <hr>
        </div>
        <br><Br><br><Br><Br><br>
          
    </body>
</html>
