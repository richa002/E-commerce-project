<%-- 
    Document   : login.jsp
    Created on : 15 Mar, 2020, 2:46:42 AM
    Author     : Acer
--%>
<%@page import="java.util.*"%>
       

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*"%> 
<%@page import="java.sql.*"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<%@ include file = "menu.jsp" %>

 
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

        <title>JSP Page</title>
    </head>
    <body>
        <% if(session.getAttribute("cname")!=null){
            RequestDispatcher rd=request.getRequestDispatcher("AddtocartServlet");
            rd.forward(request,response);
         // response.sendRedirect("addtocart.jsp");  
  
        }
else {%>        <div style="margin-left:40px;">
            <h1 allign="center"> Login </h1>
        <br>
        <form action="adminloginServlet" >
            
          
           
        <h2>  Enter AdminId :<input type="text"  placeholder="Email id"name="adminid"></h2>
        <br>
        <h2>  Enter password :<input type="password"  placeholder="Password" name="adminpassword"></h2><br>
       
      
         
        <input type="submit" value="Login"/>&nbsp;&nbsp;&nbsp;&nbsp;
      
        
        </form>
        <div>
            <%}%>
    </body>
</html>
