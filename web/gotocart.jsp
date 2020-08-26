<%-- 
    Document   : gotocart
    Created on : 16 Mar, 2020, 9:33:15 AM
    Author     : Acer
--%>

<%@page import="model.FetchProducts"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Bean"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file = "menu.jsp" %>




<!DOCTYPE html>
<html>
    <head>
        
        <title>JSP Page</title>
        
        </head>
    <body>
    <center>  <h2> <u>Your Cart</u></h2></center><br><br>
         <% 
            int items= FetchProducts.getrowsinanytable("mycart");
             
            if(items==0)
            {
                %> 
<script type="text/javascript">
    var msg = "<%="Your cart is empty.."%>";
    alert(msg);
</script>

<% 
            } 
else{
            
            Bean bean=new Bean();
        int totalprice=0;
              try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from mycart where cid=? ");
         //  HttpSession session=request.getSession();
           String cid=(String)session.getAttribute("cid");
           
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
        <% 
            session.setAttribute("amount",totalprice);%>
            <div class="image" style="float:left;">
                <img  src="images/<%=bean.getImage()%>"  style="height:180px;width:90%;padding-left:100px; margin-top:50px;">
              
            </div>
                <div class="text" style="float:left;">
                    <br><h4 style="padding-left:60px;"><%=bean.getName()%></h4>
                     <p style="padding-left:60px;"><%= bean.getFeature()%></p>
      <p style="padding-left:60px;">Product id: <%= bean.getPid()%></h1></p>
        <p style="padding-left:60px;">Quantity: <%= bean.getQuantity()%></h1></p>
     
                    <p  style="padding-left:60px;">Rs.<%= bean.getPrice()%></h1></p>
       
                </div>
                    <br><br><br><br><br><br><br><br>
                    <a href="removeitemfromcartServlet?pid=<%=bean.getPid()%>&quantity=<%=bean.getQuantity()%>">  <button>Remove</button></a>   
                    <br><br><br><br>
                    
                    <hr>
                   
                    
                    <% } con.close();
}catch(Exception e){
 out.println(e); }

  %>
<h3 style="margin:30px;">Cart Total : <%=totalprice%></h3>
    
        
        <a href="index.jsp"><button style=" margin-left:100px; margin-top:30px;padding:8px 15px;">Continue Shopping</button></a>
<% if(totalprice>0){%>
<a href="placeorder.jsp?addressadded=yes"><button style=" margin-left:100px; margin-top:30px;padding:8px 15px;">Place Order</button></a>
   <%}}%>
    </body>
</html>
