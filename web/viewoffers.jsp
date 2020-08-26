<%-- 
    Document   : admindeleteupdateproducts
    Created on : 3 Apr, 2020, 11:55:03 PM
    Author     : Acer
--%>

<%@page import="java.util.List"%>
<%@page import="model.*"%>
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
        <center> <h2  style="margin-top:9px;"> <u>Offer List</u></h2></center>

<%
String spageid=request.getParameter("page");  
int pageid=Integer.parseInt(spageid);  
int total=3;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}         
int rows=FetchProducts.getrowsinanytable("offers");
 
           List<Offerbean> list=new ArrayList();
         list=FetchProducts.fetchalloffersforadmin(pageid,total);
         int pg= Integer.parseInt(request.getParameter("page"));
    out.println("Page no. "+pg+"&nbsp  &nbsp&nbsp  &nbsp&nbsp&nbsp                         Total products:"+rows);
    
        %>
         
        <br><br><br><Br>
       <TABLE BORDER="1">
            <TR><TH> S.NO.</TH>
                
                <TH> OFFER ID</TH>
                <TH>START DATE</TH>
                <TH>END DATE</TH>
                <TH>OFFER NAME</TH>
                <TH>DISCOUNT</TH>
                <TH>CATAGORY</TH>
            <TH>IMAGE</TH>
            <th>UPDATE/DELETE</th>
            
            </TR>
            <% 
                int i=(total*(pg-1));%>
            <% for(Offerbean p:list)
            {
                ++i;
            String id=p.getOfferid();%>
            <% if(!id.equals(request.getParameter("id"))){%>
            <TR><td><%=i%></td>
                <TD> <%= p.getOfferid()%></td>
                <TD> <%= p.getStartdate()%></TD>
                <TD> <%= p.getLastdate() %></TD>
                <TD> <%= p.getOffername()%></TD>
                <TD> <%= p.getDiscount()%></TD>
                <TD> <%= p.getCatagory() %></TD>
                <TD> <%= p.getImage() %></TD>
                <td><a href="viewoffers.jsp?id=<%=id%>&page=<%=pg%>">UPDATE</a>/ <a href="admindeleteofferServlet?id=<%=id%>">DELETE</a></td>
            </tr>
            <%} else if(id.equals(request.getParameter("id"))){ %>
          <TR ><td><%=i%></td>
          <form action="adminupdateofferServlet">
                <TD> <input  style="background-color:#f9f9f9 " type="text" name="id" value=<%= p.getOfferid() %>></td>
                <TD><input style="background-color:#f9f9f9 "type="text" name="startdate" value=<%= p.getStartdate()%>></TD>
                <TD> <input style="background-color:#f9f9f9 "type="text" name="enddate" value=<%= p.getLastdate()%>></TD>
                <TD> <input style="background-color:#f9f9f9 " type="text" name="name" value=<%= p.getOffername()%>></TD>
                <TD> <input style="background-color:#f9f9f9 "type="number" name="discount" value=<%= p.getDiscount()%>></TD>
                <TD><select name="catagory"  id="catagory" >
                       <% 
                           
                           List<String>l=new ArrayList();
                              l= FetchProducts.distinctCatagories();
for(String s:l){ if(p.getCatagory().equals(s)){ %>
                       <option  selected value="<%=s%>"><%=s%></option>
                        <%} else{%>
                         <option value="<%=s%>"><%=s%></option>
                      <%}%>
                    <%}%>
                    </select>
                </td>
                     <TD> <input style="background-color:#f9f9f9 " type="text" name="image" value=<%= p.getImage() %>></TD>
           
            <td><button type="submit">SAVE</button></form>
          <a href="viewoffers.jsp?page=1"><button>CANCEL</button></a></td>
          
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
                <a href="viewoffers.jsp?page=<%=k%>"><button style="font:30px;"><%=k%></button></a>&nbsp;  
       <%}%>
        </div>
</body>
</html>
