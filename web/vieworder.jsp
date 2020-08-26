<%-- 
    Document   : vieworder
    Created on : 20 Mar, 2020, 5:57:58 AM
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

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.FetchProducts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
    <body><% int lastorderid=0;%>
        <div style="margin:50px;">
            <h2><u>Your orders:</u></h2>
        
        <br><Br><%
            int i=0;int orders=1;
        //ArrayList orderids=new ArrayList();
        //ArrayList amounts=new ArrayList();
        int amount=0;
         String pids="";
         String quantities="";
         Product p=new Product();
         int orderid;
         String orderdate;
          int carttotal;
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
         PreparedStatement ps;
          if(request.getParameter("lastorderid")==null)
          {
              ps=con.prepareStatement("select * from ordersbooked  where cid=? order by orderid desc limit 5;");
              ps.setString(1,(String)session.getAttribute("cid"));
               
          }
          else {
              ps=con.prepareStatement("select * from ordersbooked  where cid=? and orderid<? order by orderid desc limit 5;");
              ps.setString(1,(String)session.getAttribute("cid"));
              
              ps.setInt(2,Integer.parseInt(request.getParameter("lastorderid")));
          }
          ResultSet rs=ps.executeQuery();
           if ((request.getParameter("lastorderid")==null)&&(rs.next() == false)) { orders=0;
           %>
             <script >
    
    var msg = "<%="No orders"%>";
    alert(msg);
                 
</script>
  
           <% 
           
           }
           if ((request.getParameter("lastorderid")!=null)&&(rs.next() == false)) {
 
   orders=0;
           %>
             <script >
    
    var msg = "<%="No more orders"%>";
    alert(msg);
               
</script>
  
           <% 
           
           }
           
           else{ 
          rs.last();
          int n=rs.getRow();
         // out.println("row no"+n);
                lastorderid=rs.getInt(1);
           //     out.println("last order id"+lastorderid);
               
          rs.beforeFirst();
          while(rs.next())
          {
              orderid=rs.getInt(1);
         java.util.Date udate= new java.util.Date(rs.getDate(10).getTime());
              carttotal=rs.getInt(5);
           pids=rs.getString(8);
         // out.println(pids);
           //amounts.add(rs.getInt(5));
           //out.println(amount);
           quantities=rs.getString(9);
          // out.println(quantities);
           String[] arrpids = pids.split(" ");
           //out.println("arrpids");
          // out.println("Entry at 0 index"+arrpids[0]);
           //out.println("Entry at 1 index"+arrpids[1]);
          
          // for( int n=0;n<arrpids.length;n++)
            //  out.println(arrpids[n]);
          
            //  out.println(arrpids[m]);
           // out.println("quantites");
          String[] arrquantities = quantities.split(" ");
          //out.println("Entry at 0 index"+arrquantities[0]);
         // out.println("Entry at 1 index"+arrquantities[1]);
          
          //for( int n=0;n<arrquantities.length;n++)
            //  out.println(arrquantities[n]);
           SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
    String strDate= formatter.format(udate);  
           out.println("<h2 style='color:red;'>Order id :"+orderid+"</h2>");
             out.println("<h2>Order Date :"+strDate+"</h2>");
            
          for(int m=1;m<arrpids.length ;m++)
           
          {   
              String q=arrquantities[m];
              // out.println("quantity"+q);
        
             String pid=arrpids[m];
            //out.println("pid :"+pid);
        p = FetchProducts.fetchorderdetails(pid,q);
              %>
            <div class="image" style="float:left;">
                <img src="images/<%=p.getImage()%>"  style="height:180px;width:90%;padding-left:100px; margin-top:50psx;">
              
            </div>
                <div class="text" style="float:left;">
                    <br><h4 style="padding-left:60px;"><%=p.getName()%></h4>
                     <p style="padding-left:60px;"><%= p.getFeature()%></p>
      <p style="padding-left:60px;">Product id: <%= p.getPid()%></h1></p>
        <p style="padding-left:60px;">Quantity: <%= p.getQuantity()%></h1></p>
     
                     <% if(p.getDiscount()==0) { %>
       <h3 style="padding-left:60px;"><b>Rs.<%= p.getPrice()%><b></h3>
                   <% } else {%>
          <p class="oldprice" style="text-decoration:line-through;padding-left:60px;"> Rs .<%=p.getPrice()%></p>
                 <p  style="padding-left:60px;"> <%=p.getDiscount()%> % off </p>
                 <h3 style="padding-left:60px;"><b> Rs .<%=p.getNewprice()%></b></h3>
                     <% } %>
      
                     </div><BR><BR><BR><BR><BR><BR>
    <BR><BR><BR><BR><BR><br><BR><br><br><br><br><br>
                    
                    
                    
                    <%
                } out.println("<h2 style='color:blue;'>Cart Total :"+carttotal+"</h2>"); 
                    %><br><Br><H1><hr color="red" size="10"></h1>
          <br><br><%         
}  
}
        con.close();  }catch(Exception e){}   
      if(orders!=0){
          %>    
      
      <div class="sticky" id="viewpreviousorder"><a href="vieworder.jsp?lastorderid=<%=lastorderid%>"> Click to view previous orders</a></div>
           <%}%> 
        </div>  
    </body>
</html>
