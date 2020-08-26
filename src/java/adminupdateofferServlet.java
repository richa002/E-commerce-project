/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FetchProducts;
import model.Offerbean;
import model.Product;

/**
 *
 * @author Acer
 */
public class adminupdateofferServlet extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

 Offerbean p=new Offerbean();
           String id= request.getParameter("id");
            p.setOfferid(id);
 String d1=request.getParameter("startdate");
 
 String d2=request.getParameter("enddate");
 
 try{
  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       Date date1 = formatter.parse(d1);
    
      p.setStartdate(date1);
    
       Date date2 = formatter.parse(d2);
 p.setLastdate(date2);
 } 
      //out.println("<h4 style='margin-top:100px; position:absolute;'>Some error occurred..Products details not updated</h4>");
      catch(Exception e){out.println(e);}
       // RequestDispatcher rd=request.getRequestDispatcher("success.jsp");
        //       rd.include(request, response);
   p.setOffername(request.getParameter("name"));
    p.setCatagory(request.getParameter("catagory"));
   p.setDiscount(Integer.parseInt(request.getParameter("discount")));
   p.setImage(request.getParameter("image"));
   int i=FetchProducts.updateofferbyadmin(id, p);
     if(i>0){
             request.setAttribute("alertMsg", "Offer detail updated successfully.");
           
            //out.println("<h4 style='margin-top:100px; position:absolute;'>Product details updated successfully</h4>");
        
        }
        else 
             request.setAttribute("alertMsg", "Some error occured..Offer detail could not be updated.");
           
            //out.println("<h4 style='margin-top:100px; position:absolute;'>Some error occurred..Products details not updated</h4>");
        RequestDispatcher rd=request.getRequestDispatcher("viewoffers.jsp?page=1&update=yes&id=null");
               rd.forward(request, response);
   
       
        
        
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(adminupdateofferServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(adminupdateofferServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
