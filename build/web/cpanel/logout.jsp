
<%
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control", "must-revalidate");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session.invalidate();
    
    out.println("<script>window.location='login.jsp'</script>");
    %>

<meta http-equiv="refresh" content="0;index.jsp">