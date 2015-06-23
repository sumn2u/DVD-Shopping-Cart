<%@page import="com.admin.DBConnec"%>
<%
  
    
    // Form was submitted.
   String userId = request.getParameter("id");
   DBConnec dbDelCat =new DBConnec();
   dbDelCat.stmt=dbDelCat.con.prepareStatement("delete from tbl_category where id=" + userId);
  
 //out.println(dbDelCat.stmt);
    dbDelCat.rs =  dbDelCat.stmt.executeUpdate();
   if( dbDelCat.rs == 1){
       //msg = "Successfully Admin Updated";
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Successfully deleted !\n" +
"						<span></span>\n" +
"					</div>");
       
       
       
   }else{
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Sorry! Could not delete category !\n" +
"						<span></span>\n" +
"					</div>");
   }
             
    
    
    
    %>