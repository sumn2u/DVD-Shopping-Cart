<%@page import="com.admin.DBConnec"%>
<%
  
    
    // Form was submitted.
   String dvdId = request.getParameter("id");
   DBConnec dbDelDVD =new DBConnec();
   dbDelDVD.stmt=dbDelDVD.con.prepareStatement("delete from tbl_category where id=" + dvdId);
  
 //out.println(dbDelCat.stmt);
    dbDelDVD.rs =  dbDelDVD.stmt.executeUpdate();
   if( dbDelDVD.rs == 1){
       //msg = "Successfully Admin Updated";
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Successfully DVD deleted !\n" +
"						<span></span>\n" +
"					</div>");
       
       
       
   }else{
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Sorry! Could not delete DVD !\n" +
"						<span></span>\n" +
"					</div>");
   }
             
    
    
    
    %>