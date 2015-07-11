<%@page import="com.admin.DBConnec"%>
<%
  
    
    // Form was submitted.
   String dvdId = request.getParameter("id");
   DBConnec dbDelDVD =new DBConnec();
   dbDelDVD.stmt=dbDelDVD.con.prepareStatement("delete from products where id=" + dvdId);
  
 //out.println(dbDelCat.stmt);
    dbDelDVD.rs =  dbDelDVD.stmt.executeUpdate();
   if( dbDelDVD.rs == 1){
       //msg = "Successfully Admin Updated";
                                 out.println("<div class=\"well well-sm text-center\" id=\"copied-msg\" style=\"color:red\">\n" +
"	    			 Successfully DVD deleted.\n" +
"    			</div>");
       
       
       
   }else{
                                        out.println("<div class=\"well well-sm text-center\" id=\"copied-msg\" style=\"color:red\">\n" +
"	    			Sorry! Could not delete DVD.\n" +
"    			</div>");

   }
             
    
    
    
    %>