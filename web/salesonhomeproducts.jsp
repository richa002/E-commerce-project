<%-- 
    Document   : salesonhomeproducts
    Created on : 24 Mar, 2020, 12:07:36 AM
    Author     : Acer
--%>

<%@page import="model.FetchProducts"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                color:black;
                
                font-size: 15px; 
                 text-decoration: line-through;

            }
            .row{width:100%;
            height:350px;
            clear:both;
            margin-top:40px;
            margin-bottom: 40px;
            }
            .separate{
               
                
                text-align: center;
                width:14%;
                float:left;
            margin-left:10%;
            
            
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
       
        </style>
    </head>
    <body>
 
        <br><br><Br><Br><Br><Br>
        <% String image=request.getParameter("image");%>
        <div style="width:80%; height:20%; margin-top:50px; margin-left:100px;">
        <img class="image" src="images/<%=image%>"  style="width:100%; height:400px;">
    
        </div>
        
    
    <br>
    <Br>
     <%
           // List<String> catagories=FetchProducts.distinctCatagories();
           
       
      //  for(String s:catagories){ 
      String catagory=request.getParameter("catagory");
            List<Product> list= FetchProducts.fetchallproducts(catagory);
           
        %>
        
            
        <br>
        
            
            
            <div class="row">       
                <br><br>
                <br><Br><br><br><Br><Br><br><Br>
            <h2 class="pname"> <%=catagory%></h2>
            <%   for(Product p: list) { %>
         
            <div class="separate">
               <%   if(session.getAttribute("adminname")!=null){%>
   <img  style="height:300px;width:80%"src="images/<%=p.getImage()%>" width="25%" height="25%"  align="center" style=" padding-left:5px;">
                <%}else{%>
                <a href="individualproduct.jsp?pid=<%=p.getPid()%>">
                    <img  style="height:300px;width:80%"src="images/<%=p.getImage()%>" width="25%" height="25%"  align="center" style=" padding-left:5px;">
                </a>
                <%}%>
                    <p class="Pname"><%=p.getName()%></p>
                <p> <%=p.getFeature()%></p>
                <%int price=p.getPrice();
                int discount=Integer.parseInt(request.getParameter("discount"));%>
                
                <p class="price"> Rs .<%=price %></p>
               
                <%=discount%>  % off <%=" "%>
                <h3>  Rs. <%=" "+FetchProducts.calculatenewprice(price,discount)%> </h3>
                
                <p>Quantity  :<%=p.getQuantity()%></p>
   <%   if(session.getAttribute("adminname")==null){%>
                        
               <a href="individualproduct.jsp?pid=<%=p.getPid()%>"> <button STYLE="color:green;">ADD TO CART </button> </a>           
                <%}%>
                <br><br><br><Br>
            </div> 
              <% }  %>    
              <hr>
        </div>
              <br><Br><br><Br><Br><br><br><br><br><Br>
      
    </body>
</html>
