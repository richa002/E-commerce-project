/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class adminaddofferServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
        Offerbean p=new Offerbean();
        String d1=request.getParameter("startdate");
 out.println(d1);
 String d2=request.getParameter("enddate");
 out.println(d2);
 
 try{
  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       Date date1 = formatter.parse(d1);
    
      p.setStartdate(date1);
    out.println(p.getStartdate());
       Date date2 = formatter.parse(d2);
 p.setLastdate(date2);
 out.println(p.getLastdate());
    
 } 
      catch(Exception e){out.println(e);}
 
       p.setOfferid(request.getParameter("offerid"));
          p.setOffername(request.getParameter("offername"));
          p.setDiscount(Integer.parseInt(request.getParameter("discount")));
          p.setCatagory(request.getParameter("catagory"));
          p.setImage(request.getParameter("image"));
       int i=FetchProducts.insertOffer(p);
        if(i>0){
            
            request.setAttribute("alertMsg", "Offer detail added successfully.");
        }else request.setAttribute("alertMsg", " Some error occured..Offer detail could not be added..");

        RequestDispatcher rd=request.getRequestDispatcher("adminaddoffer.jsp?add=yes");  
        rd.include(request, response);
       
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
