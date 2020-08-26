<%-- 
    Document   : admindeleteupdateproducts
    Created on : 3 Apr, 2020, 11:55:03 PM
    Author     : Acer
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
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
 
            
  <% if(request.getParameter("update")!=null){
      String message = (String)request.getAttribute("alertMsg");
 %>

<script type="text/javascript">
    var msg = "<%=message%>";
    alert(msg);
</script>
<%}%>   
        <center> <h2  style="margin-top:9px;"> <u>Products List</u></h2></center>

<%
String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid);  
int total=10;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}         
int rows=FetchProducts.getrowsinanytable("products");
 
           List<Product> list=new ArrayList();
         list=FetchProducts.fetchallproductsforadmin(pageid,total);
         int pg= Integer.parseInt(request.getParameter("page"));
    out.println("Page no. "+pg+"&nbsp  &nbsp&nbsp  &nbsp&nbsp&nbsp                         Total products:"+rows);
    
        %>
         
        <br><br><br><Br>
       <TABLE BORDER="1">
            <TR><TH> S.NO.</TH>
                
                <TH> PRODUCT ID</TH>
                <TH>CATAGORY</TH>
                <TH>PRODUCT NAME</TH>
                <TH>QUANTITY</TH>
                <TH>PRICE</TH>
                <TH>IMAGE</TH>
            <TH>IMAGE1</TH>
            <TH>IMAGE2</TH>
            <TH>FEATURE</TH>
            <TH> DISPLAY AT HOMEPAGE </TH>
            
            <th>UPDATE/DELETE</th>
            
            </TR>
            <% 
                int i=(total*(pg-1));%>
            <% for(Product p:list)
            {
                ++i;
            String pid=p.getPid();%>
            <% if(!pid.equals(request.getParameter("id"))){%>
            <TR><td><%=i%></td>
                <TD> <%= p.getPid() %></td>
                <TD> <%= p.getCatagory() %></TD>
                <TD> <%= p.getName() %></TD>
                <TD> <%= p.getQuantity() %></TD>
                <TD> <%= p.getPrice() %></TD>
                <TD> <%= p.getImage() %></TD>
                <TD> <%= p.getImage1() %></TD>
                <TD> <%= p.getImage2() %></TD>
                <TD> <%= p.getFeature() %></TD>
                <TD> <%= p.getHomepage() %></TD>
                 
          
            <td><a href="admindeleteupdateproducts.jsp?id=<%=pid%>&page=<%=pg%>">UPDATE</a>/ <a href="admindeleteServlet?pid=<%=pid%>">DELETE</a></td>
            </tr>
            <%} else if(pid.equals(request.getParameter("id"))){ %>
          <TR ><td><%=i%></td>
          <form action="adminupdateServlet">
                <TD> <input  style="background-color:#f9f9f9 " type="text" name="pid" value=<%= p.getPid() %>></td>
                <TD><input style="background-color:#f9f9f9 "type="text" name="pcatagory" value=<%= p.getCatagory() %>></TD>
                <TD> <input style="background-color:#f9f9f9 "type="text" name="pname" value=<%= p.getName() %>></TD>
                <TD> <input style="background-color:#f9f9f9 " type="number" name="pquantity" value=<%= p.getQuantity() %>></TD>
                <TD> <input style="background-color:#f9f9f9 "type="number" name="pprice" value=<%= p.getPrice() %>></TD>
                <TD><input style="background-color:#f9f9f9 "type="text" name="pimage" value=<%= p.getImage() %>></TD>
            <TD> <input style="background-color:#f9f9f9 " type="text" name="pimage1" value=<%= p.getImage1() %>></TD>
            <TD> <input style="background-color:#f9f9f9 " type="text" name="pimage2" value=<%= p.getImage2() %>></TD>
            <TD> <input style="background-color:#f9f9f9 "type="text" name="pfeature" value=<%= p.getFeature() %>></TD>
            <TD> <input style="background-color:#f9f9f9 "type="text" name="phomepage" value=<%= p.getHomepage() %>></TD>
            
            <td><button type="submit">SAVE</button></form>
          <a href="admindeleteupdateproducts.jsp?page=1"><button>CANCEL</button></a></td>
          
            </TR>
            <%}%>
            <% } %>
        </TABLE> 
        <br><Br><Br>
        <div style="margin:30px;">
        <%  
        int noofpages=0;
        if(rows%total==0)
        noofpages=rows/total;
        else noofpages=rows/total+1;
        
        for(int k=1;k<=noofpages;k++){
                %>
                <a href="admindeleteupdateproducts.jsp?page=<%=k%>"><button style="font:30px;"><%=k%></button></a>&nbsp;  
       <%}%>
        </div>
</body>
</html>
