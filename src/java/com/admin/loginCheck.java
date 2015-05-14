/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author suman
 */
public class loginCheck extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
         String username = request.getParameter("uname").trim();
         String password= request.getParameter("upass").trim();
         
          String id="login";
              request.setAttribute("id",id);
  List errorMsgs=new LinkedList();
       request.setAttribute("errorMsgs", errorMsgs);
       if(username.length()==0){
                errorMsgs.add("Please enter your name.");
            } 
       if(password.length()==0){
                errorMsgs.add("Please enter your password.");
            }
 
         // out.println(username );
        //insert into user (username , userpass) values ('suman', AES_ENCRYPT('suman', 'sumn2u'));
        //SELECT username, AES_DECRYPT( userpass, 'sumn2u' ) FROM user WHERE id =2 LIMIT 0 , 30
        
//          out.println("password" + password);
       // out.println(role);
           try{
    int rs;
                DBConnec db =new DBConnec();
              db.stmt=db.con.prepareStatement("SELECT username, AES_DECRYPT(userpass, 'sumn2u') from user where username='"+username+"'");
               System.out.println(db.stmt);
//               db.stmt.setString(1, password);
//               db.stmt.setString(1, username);
              db.Rs=db.stmt.executeQuery(); 
                while(db.Rs.next()){ 
                                               
                                                                
          String user=(db.Rs.getString(1));
          String pass=(db.Rs.getString(2));
            session.setAttribute("username", user);
//           out.println(user);
           
           if(username.equalsIgnoreCase(user) && password.equalsIgnoreCase(pass)){
//                out.println("passsssss" +pass);
               out.println("<script>window.location='cpanel/index.jsp'</script>");
               
//                RequestDispatcher send= request.getRequestDispatcher("cpanel/index.jsp");
//                send.forward(request, response);
                
            }else {
               errorMsgs.add("Invalid Credientials.");
              //  out.println("<script>window.location='cpanel/login.jsp'</script>");
            } 
            }
                
           }catch (Exception ex){
               System.out.println("Exception Occured : "+ ex);
           }
            if(!errorMsgs.isEmpty()){
               RequestDispatcher view=request.getRequestDispatcher("/formError");
              view.forward(request, response);
             
            } 
           }
}