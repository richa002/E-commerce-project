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
public class adminaddproductServlet extends HttpServlet {

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
        Product p=new Product();
        
       p.setCatagory(request.getParameter("pcatagory"));
          p.setName(request.getParameter("pname"));
          p.setQuantity(Integer.parseInt(request.getParameter("pquantity")));
          p.setPrice(Integer.parseInt(request.getParameter("pprice")));
          p.setImage(request.getParameter("pimage"));
          p.setFeature(request.getParameter("pfeature"));
          p.setImage1(request.getParameter("pimage1"));
          p.setImage2(request.getParameter("pimage2"));
          p.setPid(request.getParameter("pid"));
          p.setHomepage(request.getParameter("phomepage"));
         
         int i=FetchProducts.insertProduct(p);
        if(i>0){
            
            request.setAttribute("alertMsg", "Product detail added successfully.");


        RequestDispatcher rd=request.getRequestDispatcher("adminaddproducts.jsp?add=yes");  
        rd.include(request, response);
           // out.println("<h4 style='position:absolute;margin-top:80px;'>Product added successfully..</h4> ");
        // RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
          //     rd.include(request, response);
   }
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
