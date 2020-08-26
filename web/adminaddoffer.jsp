<%-- 
    Document   : adminaddoffer
    Created on : 7 Apr, 2020, 1:35:06 AM
    Author     : Acer
--%>

<%@page import="java.util.List"%>
<%@page import="model.FetchProducts"%>
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

        <div style="margin-left:40px; ">
            
            <h2> <u>ENTER DETAILS OF NEW OFFER TO BE ADDED</u></h2><br><br><br>
        
        <form action="adminaddofferServlet">
            Offer id: <input style=" margin-left:80px;" type="text" name="offerid"><br><Br>
            Start Date : <input style="margin-left:80px; position:absolute;" type="date" placeholder="yyyy-mm-dd"name="startdate"><br><Br>
         End Date: <input style="margin-left:80px; position:absolute;" type="date" placeholder="yyyy-mm-dd"name="enddate"><br><Br>
         Offer Name: <input style="margin-left:80px; position:absolute;"type="text" name="offername"><br><Br>
         Discount(%): <input style="margin-left:80px; position:absolute;" type="number" name="discount"><br><Br>
         Catagory: <select name="catagory" style="margin-left:80px;">
              <option value="Catagory not selected"> Select</option>
                                     
             <%List<String> catagories=FetchProducts.distinctCatagories();
                        
                           for(String s:catagories){
                        %>
                        <option value="<%=s%>"> <%=s%></option>
                        <%}%>
         </select>    <br><Br>   
Image: <input style="margin-left:80px; position:absolute;"type="text" name="image"><br><Br>
         <br><br><Br><button type="submit">Add</button>&nbsp;&nbsp;</form><br><a href="admin.jsp"><button >Back</button></a>
        
        </div>
</body>
</html>
