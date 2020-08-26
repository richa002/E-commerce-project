/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FetchProducts;
import model.Product;

/**
 *
 * @author Acer
 */
public class adminupdateServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            Product p=new Product();
           String pid= request.getParameter("pid");
            p.setPid(pid);
            p.setCatagory(request.getParameter("pcatagory"));
        p.setName(request.getParameter("pname"));
        p.setQuantity(Integer.parseInt(request.getParameter("pquantity")));
        p.setPrice(Integer.parseInt(request.getParameter("pprice")));
        p.setImage(request.getParameter("pimage"));
        p.setImage1(request.getParameter("pimage1"));
        p.setImage2(request.getParameter("pimage2"));
        p.setFeature(request.getParameter("pfeature"));
        p.setHomepage(request.getParameter("phomepage"));
       
      
        int i=FetchProducts.updateproductbyadmin(pid, p);
        if(i>0){
             request.setAttribute("alertMsg", "Product detail updated successfully.");
           request.setAttribute("update", "yes");
           
            //out.println("<h4 style='margin-top:100px; position:absolute;'>Product details updated successfully</h4>");
        
        }
        else 
             request.setAttribute("alertMsg", "Some error occured..Product detail could not be updated.");
           
            //out.println("<h4 style='margin-top:100px; position:absolute;'>Some error occurred..Products details not updated</h4>");
        RequestDispatcher rd=request.getRequestDispatcher("admindeleteupdateproducts.jsp?page=1&update=yes");
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
