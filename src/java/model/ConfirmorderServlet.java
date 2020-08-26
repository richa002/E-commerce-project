/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Acer
 */
public class ConfirmorderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session=request.getSession();
        try (PrintWriter out = response.getWriter()) {
             try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
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
      // out.println(pids);
       //out.println(quantities);
                    
    // session.setAttribute("pidlist", pidlist);
    // session.setAttribute("quantites", quantities);

         //  Random rand=new Random();
          //  HttpSession session = req.getSession();       // this is how to get a session object  
 
  /* Integer orderNumber = (Integer) session.getAttribute("count");  // retrieving value from session object
	
    if(orderNumber == null)  
    {
      orderNumber = new Integer(1000);
    }
    else  
    {
      orderNumber = new Integer(orderNumber.intValue()+1) ;
    }                         
 
    session.setAttribute("count", orderNumber);              // storing the value with session object
 
    */       
           String Pids="";
           String Quantities="";
                     //List pidlist=(List)session.getAttribute("pids");
          //List quantitylist=(List)session.getAttribute("quantites");
         // Date udate=new Date(Calender.getInstance().getTime());
         // java.util.Date currentDate = Calendar.getInstance().getTime();
         Calendar calendar=Calendar.getInstance();
java.sql.Date sqldate = new java.sql.Date(calendar.getTime().getTime());
    
          for(int j=0;j<pids.size();j++)
           Pids=Pids+" "+pids.get(j);
          for( int k=0;k<quantities.size();k++)
          Quantities=Quantities+" "+quantities.get(k);
           String billingaddress=(String)session.getAttribute("billingaddress");
           
     /*    if(request.getParameter("billingaddress").equals(""))
          {
             billingaddress=request.getParameter("billinghouseno2")+"  Street No.  " +request.getParameter("billingstreetno2")+" "+request.getParameter("billinglocality2")+" "+request.getParameter("billingdistrict2")+" "+request.getParameter("billingcity2")+" "+request.getParameter("billingpincode2");
          }
         else{ billingaddress=request.getParameter("billingaddress");}
       
       */       
         ps=con.prepareStatement("INSERT INTO `ordersbooked`(`orderid`, `cname`, `cid`, `mobile`, `amount`, `modeofpayment`, `address`, `pids`, `quanities`, orderdate,cardnumber,expirydate,nameoncard) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?) ");
          //  ps.setInt(1,rand.nextInt(1000));
          ps.setInt(1,0);
            
         // ps.setInt(1,(Integer)session.getAttribute("count"));
          Integer amount= (Integer)session.getAttribute("amount");
            ps.setString(2,(String)session.getAttribute("cname"));
            ps.setString(3,(String)session.getAttribute("cid"));
            ps.setString(4,request.getParameter("billingphone"));
            ps.setInt(5,amount);
                   ps.setString(6,request.getParameter("mop"));
       
              ps.setString(7,billingaddress);
         ps.setString(8,Pids);
         ps.setString(9,Quantities);
         ps.setDate(10,sqldate);
         ps.setString(11,request.getParameter("bcardnumber"));
         ps.setString(12,request.getParameter("bexpirydate"));
         ps.setString(13,request.getParameter("bnameoncard"));
         
         int i= ps.executeUpdate();
         if(i>0){
         ps=con.prepareStatement("delete from mycart where cid=?");
        
           cid=(String)session.getAttribute("cid");
          ps.setString(1, cid);
           int j=ps.executeUpdate();
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
         RequestDispatcher rd=request.getRequestDispatcher("orderconfirmed.jsp");
          rd.forward(request,response);
       
         }
         else{ out.println("Order not confirmed..some error happened..Try after some time..");}
      
        con.close();     }catch(Exception e){}                
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
