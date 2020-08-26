<%-- 
    Document   : index
    Created on : 14 Mar, 2020, 2:53:01 AM
    Author     : Acer
--%>
<%@page import="java.util.*"%>
       
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>

<%@ page import="model.*"%> 
 
<%@page import="java.sql.*"%>
<%@ include file = "menu.jsp" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



        <style>
            p.Pname{
                color:blue;
                font:bold;
                font-size: 20px; 
            }
            p.price{
                color:green;
                font:bold;
                font-size: 15px; 
            }
            .row{width:100%;
            height:300px;
            clear:both;
            }
            .separate{
                text-align: center;
                width:14%;
                float:left;
            margin-left:10%;
            
            
            }
            .pname{
                margin-top:5%;}
            .offer{
                background-color: buttonface;
                 text-align: center;
               width:80%;
            height:300px;
         
            margin-top:100px;
            margin-left:100px;
            margin-right:100px;
            margin-bottom:5px;
            padding:10px;
            }
            
        </style>
    </head>
    <body>
      <br><Br>
      <%  ArrayList<Offerbean> offerlist=FetchProducts.checkoffer();
      int y=0;
      if((offerlist.size()!=0)){

      %>
      <br><br><Br><Br>
      <div class="container">  
  <div id="myCarousel" class="carousel slide" data-ride="carousel"style="">
    <!-- Indicators -->
    <ol class="carousel-indicators">
     <% for(y=0;y<offerlist.size();y++) 
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
<%}%>
<br>

      
      <%
            List<String> catagories=FetchProducts.distinctCatagories();
            for(String s:catagories){ 
            List<Product> list= FetchProducts.fetchProductsonindex(s);
           
        %>
        
            
        <br>
        
            
        <br><Br><br> 
            <div class="row" style="">       
                <br><br>
                <a href="catagorypage.jsp?catagory=<%=s%>"> <h2 class="pname"> <%=s%></h2><a>    
          
                        <BR><BR><BR><%   for(Product p: list) { %>
         
            <div class="separate">
                  <%  if(session.getAttribute("adminname")==null){%>
           
                <a href="individualproduct.jsp?pid=<%=p.getPid()%>">
                    <img  style="height:300px;width:80%"src="images/<%=p.getImage()%>" width="25%" height="25%"  align="center" style=" padding-left:5px;">
                </a>
                <%}else{%><img  style="height:300px;width:80%"src="images/<%=p.getImage()%>" width="25%" height="25%"  align="center" style=" padding-left:5px;">
                <%}%>
                    <p class="Pname"><%=p.getName()%></p>
                <p> <%=p.getFeature()%></p>
                <%    if(FetchProducts.withinofferperiod(s))
            {
          %>    <p class="oldprice" style="text-decoration:line-through;"> Rs .<%=p.getPrice()%></p>
                 <p > <%=p.getDiscount()%> % off </p>
                 <h4><b> Rs .<%=p.getNewprice()%></b></h4>
           <% }  else {%>
            <h4 class="price"><b> Rs .<%=p.getNewprice()%></b></h4>
                <% } %>
                <p>Quantity  :<%=p.getQuantity()%></p>
             <%  if(session.getAttribute("adminname")==null){%>
                <a href="individualproduct.jsp?pid=<%=p.getPid()%>"> <button STYLE="color:green;">ADD TO CART </button> </a>           
                <%}%>
            </div> 
              <% }  %>
                       <hr>
        </div>
                       <div><a href="catagorypage.jsp?catagory=<%=s%>"> <H4> <U>More</u></h4>
              </a>     </div>
        <br><Br><br><Br><Br><br>
      <%  }  %>  
        </body>
</html>
