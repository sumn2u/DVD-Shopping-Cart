<%@page import="com.admin.DBConnec"%>
<%
  
    
    // Form was submitted.
   String userId = request.getParameter("id");
   DBConnec dbDelAdmin =new DBConnec();
   dbDelAdmin.stmt=dbDelAdmin.con.prepareStatement("delete from user where id=" + userId);
  
 //out.println(dbDelCat.stmt);
    dbDelAdmin.rs =  dbDelAdmin.stmt.executeUpdate();
   if( dbDelAdmin.rs == 1){
       //msg = "Successfully Admin Updated";
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Successfully Admin deleted !\n" +
"						<span></span>\n" +
"					</div>");
       
       
       
   }else{
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Sorry! Could not delete Admin !\n" +
"						<span></span>\n" +
"					</div>");
   }
             
    
    
    
    %>