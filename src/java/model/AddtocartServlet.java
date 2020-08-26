/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class AddtocartServlet extends HttpServlet {

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
         int i;
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            
         //String pid=(String)session.getAttribute("pid");
         //out.println(pid);
         String pid=request.getParameter("pid");
         
     
         int quantity=Integer.parseInt(request.getParameter("quantity"));
           Bean bean=new Bean();
           bean.setPid(pid);
           bean.setQuantity(quantity);
        
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommercepro","root","");
           PreparedStatement ps=con.prepareStatement("select * from products  where productid=?");
            ps.setString(1,pid);
           ResultSet rs= ps.executeQuery();
    
       while(rs.next())
       {
               
          bean.setName(rs.getString(3));
    
       
          bean.setPrice(rs.getInt(5)-(rs.getInt(5)*rs.getInt(11)/100));
          bean.setImage(rs.getString(6));
          bean.setFeature(rs.getString(7));
          
          } 
           HttpSession session=request.getSession(); 
        PreparedStatement    ps1=con.prepareStatement("insert into mycart  values(?,?,?,?,?,?,?)");
        ps1.setString(1,(String)session.getAttribute("cid"));
                
        ps1.setString(2,bean.getPid());
             ps1.setString(3,bean.getName());
           
              ps1.setString(4,bean.getFeature());
            ps1.setInt(5,bean.getPrice());
            ps1.setString(6,bean.getImage());
             ps1.setInt(7,bean.getQuantity());
         
           

           
          i= ps1.executeUpdate();
        
          
            }catch(Exception e){ out.println(e);} 

          //cartproducts.add(bean);
        // out.println(cartproductid.size());
        // session.setAttribute("mycart",cartproducts);
        
        
       RequestDispatcher rd=request.getRequestDispatcher("addtocart.jsp");
           rd.forward(request,response);
        
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
