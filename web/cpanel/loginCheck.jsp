<%-- 
    Document   : loginCheck
    Created on : Apr 6, 2015, 5:33:45 AM
    Author     : suman
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="com.admin.DBConnec"%>
<%
         Gson gson = new Gson();
         String username = request.getParameter("uname").trim();
         String password= request.getParameter("upass").trim();
         try{
              DBConnec db =new DBConnec();
              db.stmt=db.con.prepareStatement("SELECT username, AES_DECRYPT(userpass, 'sumn2u') from user where username='"+username+"'");
              db.Rs=db.stmt.executeQuery(); 
                while(db.Rs.next()){ 
                                                                                
          String user=(db.Rs.getString(1));
          String pass=(db.Rs.getString(2));
           session.setAttribute("username", user);

           if(user.equals(username) && pass.equals(password)){
                out.println("success");
                out.flush();
                
            }else {
              
             out.println("error");
             out.flush();
//          response.getWriter().write(gson.toJson("err"));
            } 
            }
                
           }catch (Exception ex){
               System.out.println("Exception Occured : "+ ex);
           }     
    
    %>

