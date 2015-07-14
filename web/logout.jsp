<%-- 
    Document   : logout
    Created on : Jul 13, 2015, 10:20:11 PM
    Author     : suman
--%>
<%

        
            
             session.invalidate();
            // session.removeAttribute("username");
             response.sendRedirect("login.jsp");
             response.flushBuffer();
              %>

%>