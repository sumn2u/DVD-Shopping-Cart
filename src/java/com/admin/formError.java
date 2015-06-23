/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author suman
 */
public class formError extends HttpServlet {
private String errorForm;
            public void setError( String error){
            errorForm=error;
        }
             public String getError( ){
             return errorForm;
        }

    public void generateView(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        List errorMsgs=(List)request.getAttribute("errorMsgs");
        PrintWriter out = response.getWriter();
        String check=(String)request.getAttribute("id");
         String address = null;

   
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<link rel=\"stylesheet\" href=\"css/screen.css\" type=\"text/css\" media=\"screen\" title=\"default\" />");
            out.println("<head>");
            out.println("<title>Servlet ErrorList</title>");            
            out.println("</head>");
            out.println("<body>");
          
          //  out.println("<div class=\"page-top-outer\">");
            if(errorMsgs!=null){           
           // out.println("<p>");
            out.println("<h3>");
         // out.println("<div class=\"logo\">");
            out.println("<font color='red'>Please correct the following errors:");
            out.println("<ul>");
            Iterator items=errorMsgs.iterator();
            while(items.hasNext()){
                String message =(String)items.next();
                request.setAttribute("message",message );
                out.println("<li>"+message+"</li>");
                 System.out.println(check);
    
            }
            out.println("</ul>");
            out.println("</font>");
         
           // out.println("</p>");
             out.println("</h3>");
            // out.println("<script>window.location='cpanel/login.jsp'</script>");
             // out.println("</div>");
            // out.println("</div>");
            
            }
   
            
   
    if( check=="login"){ 
      address="cpanel/login.jsp";
    }
   
     RequestDispatcher rd= request.getRequestDispatcher(address);
                rd.include(request, response);
    }
public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       generateView(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       generateView(request, response);
    }

    
   
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
    
}
