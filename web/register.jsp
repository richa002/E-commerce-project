<%-- 
    Document   : register.jsp
    Created on : 15 Mar, 2020, 3:14:18 AM
    Author     : Acer
--%>
<%@page import="java.util.ArrayList"%>
       
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*"%> 
<%@ include file = "menu.jsp" %>
 
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
        <h1>Sign Up</h1>
        <form action="registerServlet">
        <h3>  Enter your name :<input type='text' name='cname'/><br></h3>
        <h3>  Enter user id: <input type='email' name='cid' placeholder='Email id'/><br>
        </h3><h3>   Enter your password :<input type='password' name='cpassword'/><Br>
        </h3>
        <h3>   Enter phone no.<input type='number' name='cmobile'/></h3><br>
        <h3> Enter address : <h3><Br>
                *H.No/ Block No.<input type="text" style="margin-left:30px;" name="houseno" required=""/><br><br>
          *Street No. :<input type="text" style="margin-left:30px;" name="streetno" required=""/><br><br>
          
          *Locality : <input type="text" style="margin-left:30px;"  required=""name="locality"/><br><br>
          
          *District :<input type="text" style="margin-left:30px;" required="" name="district"/><br><br>
          
          *City :<input type="text" style="margin-left:30px;" required="" name="city"/><br><br>
          
          *Pincode :<input type="number" style="margin-left:30px;"  required=""name="pincode"/><br><Br>
          
          
        <br>
        <input type="submit" value="Sign Up"/>
        </form>
        
        
    </body>
</html>
