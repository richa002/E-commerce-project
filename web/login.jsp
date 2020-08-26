<%-- 
    Document   : login.jsp
    Created on : 15 Mar, 2020, 2:46:42 AM
    Author     : Acer
--%>
<%@page import="java.util.ArrayList"%>
       
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*"%> 

 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="model.Product"%>

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


<%@ page import =" javax.servlet.*, javax.servlet.http.*"%>

 
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
else {%>
        <div style="margin-left:40px;">
           <% if(request.getParameter("errorinlogin")!=null){%>
           <script>
               alert("Wrong login credentials..Try again..");
              </script>
              <%}%>
            <h1 allign="center"> Login </h1>
        <br>
        <form action="loginServlet" >
            
          
            <%  String pid=request.getParameter("pid");%>
          
            <input type="hidden" name="pid" value="<%= pid%>"/>
        <h2>  Enter UserId :<input type="text"  placeholder="Email id"name="cid"></h2>
        <br>
        <h2>  Enter password :<input type="password"  placeholder="Password" name="cpassword"></h2><br>
       
      
         
        <input type="submit" value="Login"/>&nbsp;&nbsp;&nbsp;&nbsp;
         <a href="register.jsp">Don't have an account? Sign Up</a>
        
        </form>
        <div>
            <%}%>
    </body>
</html>
