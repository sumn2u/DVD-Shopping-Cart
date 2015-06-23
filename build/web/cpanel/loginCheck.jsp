<%-- 
    Document   : loginCheck
    Created on : Apr 6, 2015, 5:33:45 AM
    Author     : suman
--%>

<%@page import="com.admin.DBConnec"%>
<%
    
       String username = request.getParameter("uname").trim();
         String password= request.getParameter("upass").trim();
         try{
    int rs;
                DBConnec db =new DBConnec();
              db.stmt=db.con.prepareStatement("SELECT username, AES_DECRYPT(userpass, 'sumn2u') from user where username='"+username+"'");
               //out.println(db.stmt);
//               db.stmt.setString(1, password);
//               db.stmt.setString(1, username);
              db.Rs=db.stmt.executeQuery(); 
                while(db.Rs.next()){ 
                                               
                                                                
          String user=(db.Rs.getString(1));
          String pass=(db.Rs.getString(2));
           session.setAttribute("username", user);
//           out.println(user);
           
           
           if(user.equals(username) && pass.equals(password)){
//                out.println("passsssss" +pass);
               out.println("<script>window.location='index.jsp'</script>");
//                RequestDispatcher send= request.getRequestDispatcher("cpanel/index.jsp");
//                send.forward(request, response);
                
            }else {
              out.println("Invalid Credientials.");
              //  out.println("<script>window.location='cpanel/login.jsp'</script>");
            } 
            }
               // out.println("Invalid Credientials.");
                
           }catch (Exception ex){
               System.out.println("Exception Occured : "+ ex);
           }
    
    
    
    
    %>

