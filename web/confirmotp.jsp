<%-- 
    Document   : confirmotp
    Created on : 17 Apr, 2020, 1:03:38 AM
    Author     : Acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
               .form-popup {
  display: BLOCK;
   top:50%;
   left:40%;
 
 
  position: fixed;
  
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
 top:50%;
   left:40%;
 
  text-align: center;
  background-color: white;
}

        </style>
    
    </head>
    <body>
        
     
     

        
        <%if(request.getAttribute("otpsent")!=null){
       //out.println(request.getParameter("bname"));
        String bname=request.getParameter("bname");
      String baddress=request.getParameter("baddress");
      //out.println(baddress);
       String bphone=request.getParameter("bphone");
      String bemail=request.getParameter("bemail");
     
        %>
      <div class="form-popup" id="form-popup">
           <%=session.getAttribute("otp")%>
    
  <form action="checkotpServlet" class="form-container">
      
     <p>An OTP IS SENT TO YOUR EMAIL.KINDLY VERIFY</P>
                 
        <input type="hidden" name="mop" value="Credit/Debit Card"/>
         <input type="hidden" name="bname" value="<%=bname%>"/>
         <input type="hidden" name="baddress" value="<%=baddress%>"/>
        <input type="hidden" name="bemail" value="<%=bemail%>"/>
        
         <input type="hidden" name="bphone" value="<%=bphone%>"/>
          <input type="hidden" name="bcardnumber" value="<%=request.getParameter("cardnumber")%>"/>
          <input type="hidden" name="bexpirydate" value="<%=request.getParameter("expirydate")%>"/>
          <input type="hidden" name="bnameoncard" value="<%=request.getParameter("nameoncard")%>"/>
          
         
    <label for="OTP"><b>OTP:</b></label>
    <input type="NUMBER" placeholder="Enter OTP" name="otpentered" required>

    
    <button type="submit" class="btn">Submit</button>
    <button type="submit" class="btn cancel" onclick="closeForm()">Close</button>
  </form>
</div>
<%}%>

    
    
    </body>
</html>
