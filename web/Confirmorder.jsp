<%-- 
    Document   : Confirmorder
    Created on : 17 Apr, 2020, 5:31:38 AM
    Author     : Acer
--%>

<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
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
    <body>
        
        <%  
           // out.println(request.getAttribute("otpverificationresult"));
         if((String)request.getAttribute("otpverificationresult")==("matched")){
       %>
       <script>
           alert("OTP matched..Confirm Payment..");
       </script>
          <script>
           alert("Confirm Payment..");
       </script>
          
     <%}%>
        <% int i;
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
     
           // out.println("connection established");
            PreparedStatement ps=con.prepareStatement("select * from mycart where cid=? ");
         //  HttpSession session=request.getSession();
           String cid=(String)session.getAttribute("cid");
           
           ps.setString(1,cid);
           ResultSet rs=ps.executeQuery();
          List <String>pids=new ArrayList();
           List <Integer>quantities=new ArrayList();
         
          while(rs.next())
            {
                
              pids.add(rs.getString(2));
                quantities.add(rs.getInt(7));
            }
          
         //out.println("hi");
         //// out.println(quantities);
          String Pids="";
           String Quantities="";
         Calendar calendar=Calendar.getInstance();
java.sql.Date sqldate = new java.sql.Date(calendar.getTime().getTime());
    
          for(int j=0;j<pids.size();j++)
           Pids=Pids+" "+pids.get(j);
          //out.println(Pids);
          for( int k=0;k<quantities.size();k++)
          Quantities=Quantities+" "+quantities.get(k);
          //out.println(Quantities);
           String billingaddress=(String)session.getAttribute("billingaddress");
           //out.println(billingaddress);
          if(request.getParameter("mop").equals("Credit/Debit Card"))
          {
             // out.println("card payment case");
         ps=con.prepareStatement("INSERT INTO `ordersbooked`(`orderid`, `cname`, `cid`, `mobile`, `amount`, `modeofpayment`, `address`, `pids`, `quanities`, `orderdate`, `cardnumber`, `expirydate`, `nameoncard`)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)");
         ps.setInt(1,0);
          // out.println("name on card="+request.getParameter("bnameoncard")); 
         // ps.setInt(1,(Integer)session.getAttribute("count"));
          int amount= (Integer)session.getAttribute("amount");
         // out.println(amount);
          //out.println((String)session.getAttribute("cname"));
          //out.println((String)session.getAttribute("cid"));
           ps.setString(2,request.getParameter("bname"));
            ps.setString(3,request.getParameter("bemail"));
            
         // ps.setString(2,(String)session.getAttribute("cname"));
           // ps.setString(3,(String)session.getAttribute("cid"));
            ps.setString(4,request.getParameter("bphone"));
            ps.setInt(5,amount);
          //  out.println(request.getParameter("mop"));
                   ps.setString(6,request.getParameter("mop"));
     //  out.println(sqldate);
              ps.setString(7,billingaddress);
         ps.setString(8,Pids);
         ps.setString(9,Quantities);
         ps.setDate(10,sqldate);
         
         ps.setString(11,request.getParameter("bcardnumber"));
         ps.setString(12,request.getParameter("bexpirydate"));
         ps.setString(13,request.getParameter("bnameoncard"));
         
          i= ps.executeUpdate();
         
          
          
          
          }else {// out.println("cod case");
              ps=con.prepareStatement("INSERT INTO `ordersbooked`(`orderid`, `cname`, `cid`, `mobile`, `amount`, `modeofpayment`, `address`, `pids`, `quanities`, `orderdate`) VALUES (?,?,?,?,?,?,?,?,?,?)");
          
          ps.setInt(1,0);
          // out.println("name on card="+request.getParameter("bnameoncard")); 
         // ps.setInt(1,(Integer)session.getAttribute("count"));
          int amount= (Integer)session.getAttribute("amount");
         // out.println(amount);
          //out.println((String)session.getAttribute("cname"));
          //out.println((String)session.getAttribute("cid"));
           ps.setString(2,request.getParameter("bname"));
            ps.setString(3,request.getParameter("bemail"));
            
         // ps.setString(2,(String)session.getAttribute("cname"));
           // ps.setString(3,(String)session.getAttribute("cid"));
            ps.setString(4,request.getParameter("bphone"));
            ps.setInt(5,amount);
           // out.println(request.getParameter("mop"));
                   ps.setString(6,request.getParameter("mop"));
      // out.println(sqldate);
              ps.setString(7,billingaddress);
         ps.setString(8,Pids);
         ps.setString(9,Quantities);
         ps.setDate(10,sqldate);
        
          }
          i= ps.executeUpdate();
        // out.println(i);
         //out.println("hi");
         if(i>0){
         ps=con.prepareStatement("delete from mycart where cid=?");
        
           cid=(String)session.getAttribute("cid");
          ps.setString(1, cid);
           int j=ps.executeUpdate();
         //  out.println(j);
           
           List<Integer> priorquantities=new ArrayList();
                 for(j=0;j<pids.size();j++)
                 { ps=con.prepareStatement("select quantity from products where productid=?");
                   ps.setString(1,pids.get(j));
                    rs=ps.executeQuery();
                    while(rs.next()){ priorquantities.add(rs.getInt(1));}
                   ps=con.prepareStatement("update products set quantity=? where productid=?");
                 
                   int newquantities=priorquantities.get(j)-quantities.get(j);
                   ps.setInt(1,newquantities);
                   ps.setString(2,pids.get(j));
                 int m= ps.executeUpdate();
                
                 }
                 %>
     <script>
           alert("Thank you for shopping with Shoppingcart.in..Your order is confirmed");
       </script>
       
                <%
                // out.println("<h2>Thank you for shopping with Shoppingcart.in..Your order is confirmed</h2>");
         //RequestDispatcher rd=request.getRequestDispatcher("orderconfirmed.jsp");
          //rd.forward(request,response);
       
         }
         else{ 
      %>  <script>
           alert("Order not confirmed..some error happened..Try after some time.."");
       </script>
     <%
//    // out.println("Order not confirmed..some error happened..Try after some time..");}
}
        con.close();     }catch(Exception e){}                
        
        %>
        
    </body>
</html>
