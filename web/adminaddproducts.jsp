<%-- 
    Document   : adminaddproducts
    Created on : 3 Apr, 2020, 3:49:19 AM
    Author     : Acer
--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <%@ include file = "adminmenu.jsp" %>
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
    </head>
    <body>
  <% if(request.getParameter("add")!=null){
      String message = (String)request.getAttribute("alertMsg");
 %>

<script type="text/javascript">
    var msg = "<%=message%>";
    alert(msg);
</script>
<%}%>   
        
        <div style="margin-left:40px;">
            
            <h2> <u>ENTER DETAILS OF NEW PRODUCT TO BE ADDED</u></h2><br><br><br>
        
        <form action="adminaddproductServlet">
            Product id: <input type="text" name="pid"><br><Br>
             Catagory : <input type="text" name="pcatagory"><br><Br>
         Name: <input type="text" name="pname"><br><Br>
         Quantity: <input type="number" name="pquantity"><br><Br>
         Price: <input type="number" name="pprice"><br><Br>
         Image: <input type="text" name="pimage"><br><Br>
         Feature: <input type="text" name="pfeature"><br><Br>
         Image1: <input type="text" name="pimage1"><br><Br>
         Image2: <input type="text" name="pimage2"><br><Br>
         Whether to be displayed at homepage: <input type="text"  palceholder="yes/no"name="phomepage">
         <br><br><Br><button type="submit">Add</button>&nbsp;&nbsp;</form><a href="admin.jsp"><button >Back</button></a>
        
        </div>
        </body>
</html>
