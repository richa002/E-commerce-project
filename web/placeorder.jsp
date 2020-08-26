<%-- 
    Document   : placeorder.jsp
    Created on : 17 Mar, 2020, 10:45:40 AM
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

<%@page import="model.FetchProducts"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Bean"%>

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
        .
        <style>
            .main {
                margin-top:50px;
                margin-left:100px;
  width: 80%;
  
  clear: both;
}

.main input {
  width: 30%;
  clear: both;
}
             .myForm{ 
                margin-left:0px;
                width:50%;
  display:none;

  margin-top:30px;
  
            }
            .myform input {
  width: 80%;
  clear: both;
}
  
   
            </style>
    </head>
    <body>
      
    <center><h1> Enter a delivery address</h1></center>


       <% 
           if(request.getParameter("addressadded").equals("no")){
           %>
  <script >
    
    var msg = "<%="Please enter a delivery address"%>";
    alert(msg);
                 
</script>
          <%  } 

       
    String cid=(String)session.getAttribute("cid");%>
       
       <div  class="main"> 
       
           
        <form action="addressconfirmedandselectpaymentmode.jsp">
            <br><br><Br><br>
            Enter Billing name :<br><br><input  name="billingname"  type="text" value="<%=session.getAttribute("cname")%>"/><br><br>
            <br>  Email- id:<br><br><input name="billingemail" type="text" size="40"  value="<%=cid%>" /><br><br>
            <br>Phone number :<br><br><input  name="billingphone" tyle="margin-left:50px;position:absolute;"  value="<%=FetchProducts.getregisteredaddressormobile(cid,0)%>" name="billingmobile"/><br><Br>
            <br><p class="p" id="p"> Delivery Address : <br> <br><input size="90" id="address"  name="billingaddress" value="<%=FetchProducts.getregisteredaddressormobile(cid,1)%>"></input>
            </p><br>
           
          <div id="myForm"   class="myForm"  > 
    
              H.No/ Block No.<br><input type="text"  name="billinghouseno2"/><br><br>
              Street No. :<br><input type="text"  name="billingstreetno2" /><br><br>
          
              Locality : <br><input type="text"  name="billinglocality2"/><br><br>
          
              District :<br><input type="text"   name="billingdistrict2"/><br><br>
          
              City :<br><input type="text"   name="billingcity2"/><br><br>
          
          
              Pincode :<br><input type="number" name="billingpincode2"/><br><Br>
          
          </div> 
           
           
          <BR><br><br><Br><br><Br><BR><Br><Br>
          <button type="submit"  style=" position:relative;margin-top:10px;margin-left:80px;">Confirm delivery address</button>
        </form><br><Br>

        <div style="float:left;position:absolute;margin-top:-180px;margin-left:80px;"> 
        <button onclick="myFunction()"  class="changebutton" id="changebutton" style=" positon:absolute;">Change delivery address</button>
          
        </div> 
                    <script>
function myFunction() {
  var x = document.getElementById("myForm");
 document.getElementById("p").style.display="none";
  document.getElementById("changebutton").style.display="none";
 
  document.getElementById("address").value="";
  x.style.display = "block";
}

</script>      
          
        
<br><Br><Br><Br><br>   <br><hr>
                                            <br> <h3><u>Order Summary</u></h3>
         <%   Bean bean=new Bean();
        int totalprice=0;
              try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from mycart where cid=? ");
         //  HttpSession session=request.getSession();
         
           
           ps.setString(1,cid);
           ResultSet rs=ps.executeQuery();
           
            while(rs.next())
            {
                
           
                bean.setPid(rs.getString(2));
                 bean.setName(rs.getString(3));
                bean.setFeature(rs.getString(4));
                bean.setPrice(rs.getInt(5));
                bean.setImage(rs.getString(6));
                bean.setQuantity(rs.getInt(7));
                 totalprice=totalprice+(bean.getPrice()*bean.getQuantity());     

        %>
        <%session.setAttribute("amount",totalprice);%>
            <div class="image" style="float:left;">
                <img src="images/<%=bean.getImage()%>" height="100px" width="100%" style="padding-left:100px; margin-top:50px;">
              
            </div>
                <div class="text" style="float:left;">
                    <br><h4 style="padding-left:60px;"><%=bean.getName()%></h4>
                     <p style="padding-left:60px;"><%= bean.getFeature()%></p>
      <p style="padding-left:60px;">Product id: <%= bean.getPid()%></h1></p>
        <p style="padding-left:60px;">Quantity: <%= bean.getQuantity()%></h1></p>
     
                    <p  style="padding-left:60px;">Rs.<%= bean.getPrice()%></h1></p>
       
                </div>
                                            <br><Br><Br><Br>      <br><br><br><br><Br><br><br><Br><Br>
                    
                    <hr>
                   
                    
                    <% }
 con.close();}catch(Exception e){
 out.println(e); }
%>
<h3 style="margin:30px;">Cart Total : <%=totalprice%></h3>
    
                                            
                                            
           <br><Br>
        <a href="gotocart.jsp"><button style=" margin:10px;padding:8px 15px;"> Back</button></a>
        </form>
 
    </div>

  </body>
</html>
