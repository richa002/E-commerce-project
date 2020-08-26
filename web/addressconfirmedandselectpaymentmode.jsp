<%-- 
    Document   : 
    Created on : 16 Apr, 2020, 12:26:59 AM
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>    
    .myForm2,.otp{ 
                
  display:none;

  margin-top:30px;
  margin-left:400px;
            }
   .otp{ 
                
  display:none;

  margin-top:30px;
  margin-left:300px;
            }         
         
</style>
    </head>
    <body>
        
        <div style="margin:100px;"> 
         <h4>  Select Mode of Payment :</h4><br>
   <% 
       String billingaddress;
       if(request.getParameter("billingaddress").equals("")&&(request.getParameter("billingcity2").equals(""))){
     
                 
                 RequestDispatcher rd=request.getRequestDispatcher("placeorder.jsp?addressadded=no");
                 rd.forward(request, response);
             }
          
       
           
         if(request.getParameter("billingaddress").equals(""))
          {
             billingaddress=request.getParameter("billinghouseno2")+"  " +request.getParameter("billingstreetno2")+" "+request.getParameter("billinglocality2")+" "+request.getParameter("billingdistrict2")+" "+request.getParameter("billingcity2")+" "+request.getParameter("billingpincode2");
            
          }
         else{ billingaddress=request.getParameter("billingaddress");}
        
       session.setAttribute("billingaddress",billingaddress);
        %>          
        <form action="Confirmorder.jsp">
                  <input type="hidden" name="bname" value="<%=request.getParameter("billingname")%>"/>
                          <input type="hidden" name="nameoncard" value=""/>
                  <input type="hidden" name="expirydate" value=""/>
                  <input type="hidden" name="cardnumber" value=""/>

                  <input type="hidden" name="baddress" value="<%=request.getAttribute("billingaddress")%>"/>
         <input type="hidden" name="bphone" value="<%=request.getParameter("billingphone")%>"/>
          <input type="hidden" name="bemail" value="<%=request.getParameter("billingemail")%>"/>
          
                  

            
            <input type="radio" onclick="myfunc1()" id="cod" name="mop" value="COD">
<label for="cod">COD</label>&nbsp&nbsp&&nbsp&nbsp&nbsp         

<input type="radio" onclick="myfunc()" id="card" name="mop" value="Credit/Debit Card">
<label for="card">Credit Card/Debit Card</label><br><Br><Br><BR>
<button type="submit" id="confirmorderbutton">Confirm Order
</button>
        </form>
<script>
          function myfunc() {
  var x = document.getElementById("myForm2");
  x.style.display = "block";
   x = document.getElementById("otp");
  x.style.display = "block";
    x = document.getElementById("confirmorderbutton");
  x.style.display = "none";
 

}   
   function myfunc1() {
  var x = document.getElementById("myForm2");
  x.style.display = "none";
   x = document.getElementById("otp");
  x.style.display = "none";
   x = document.getElementById("confirmorderbutton");
  x.style.display = "block";
  
   }</script>

          <div id="myForm2"   class="myForm2"  > 
              <form action="verifyotpServlet?cid=<%=session.getAttribute("cid")%>"> 
                  <input type="hidden" name="bname" value="<%=request.getParameter("billingname")%>"/>
        <input type="hidden" name="mop" value="Credit/Debit Card"/>
        
                  <input type="hidden" name="baddress" value="<%=billingaddress%>"/>
         <input type="hidden" name="bphone" value="<%=request.getParameter("billingphone")%>"/>
          <input type="hidden" name="bemail" value="<%=request.getParameter("billingemail")%>"/>
          
                  
                  Enter card number.<input type="text" style="margin-left:30px;" name="cardnumber" /><br><br>
          Enter expiry date:<input type="text" style="margin-left:38px;" name="expirydate" /><br><br>
          
          Enter name on card : <input type="text" style="margin-left:15px;"  name="nameoncard"/><br><br>
          
          Enter CVV   :<input type="password" style="margin-left:78px;" placeholder="****"  name="cvv"/><br><br>
          <br><Br> 
          <button class="otp" id="otp" style="margin-left:65px;" type="submit"> Generate OTP</button>
              </form>
          </div>     
           
          
        
        </div>
    </body>
</html>
