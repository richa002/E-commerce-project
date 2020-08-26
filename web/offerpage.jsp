<%-- 
    Document   : offerpage
    Created on : 1 Apr, 2020, 5:15:12 AM
    Author     : Acer
--%>
<%@page import="java.util.ArrayList"%>
       
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.*"%> 

 
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

      
        <title>JSP Page</title>
    </head>
    <body>
    
        <% 
      
    ArrayList<Offerbean> offerlist=FetchProducts.checkoffer();
if((request.getParameter("gotoofferpage")!=null)&&(offerlist.size()==0)){
 %> <script type="text/javascript">
    var msg = "<%="No offers currently"%>";
    alert(msg);
</script>
  <%

}
if(offerlist.size()!=0){ out.println("<br><Br><Br><center><h2>Currently  "+offerlist.size()+" offers</h2></center>");
%>
<br><br><br><br>
   <%
    out.println("<center><h2>"+ FetchProducts.getofferperiod(offerlist.get(0).getOfferid())+"</h2></center>");%>
         
<div class="container">  
  <div id="myCarousel" class="carousel slide" data-ride="carousel"style="">
    <!-- Indicators -->
    <ol class="carousel-indicators">
     <% for(int y=0;y<offerlist.size();y++) 
         { %>
                 <% if(y==0){%>
                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                   <% } else {%>
                      <li data-target="#myCarousel" data-slide-to="<%=y%>"></li>
                          <% } %>
     <%  } %>  
    </ol>
        
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
            <%String image1=offerlist.get(0).getImage();
             //out.println(image1);
             int k=0;
             for(Offerbean offerbean:offerlist){
                   
            // out.println(offerbean.getImage());
               if(k==0) {         
               %>          
            <div class="item active">
             <% }else {%>   <div class="item"><%}%>
            
             <a href="salesonhomeproducts.jsp?discount=<%=offerbean.getDiscount()%>&image=<%=offerbean.getImage()%>&catagory=<%=offerbean.getCatagory()%>"> <img  style="height:500px;width:100%"src="images/<%=offerbean.getImage()%>" ></a>  
             </div>
         
        <%   k=k+1; } %>             
      </div>
    
      

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
      </div>
</div>
<% }%>
<br><br><br><Br>
    </body>
</html>
