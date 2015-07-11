<%@page import="com.admin.DBConnec"%>

<%
    String msg ="" ;
    String clas = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
   // Form was submitted.
        String userId = request.getParameter("id");
        String catName = request.getParameter("catname").trim();
        String active = request.getParameter("publish");
          if(catName == "" || catName == null){
           out.println("<div class=\"well well-sm text-center\" id=\"copied-msg\" style=\"color:red\">\n" +
"	    			Provide category name.\n" +
"    			</div>");
        }else{
      DBConnec dbEdit =new DBConnec();
     dbEdit.stmt=dbEdit.con.prepareStatement("update tbl_category set cat_name=?, publish=? where id=?");
     dbEdit.stmt.setString(1, catName);
     dbEdit.stmt.setString(2, active);
     dbEdit.stmt.setString(3, userId);
//  //out.println(dbEdit.stmt);
     dbEdit.rs = dbEdit.stmt.executeUpdate();
   if(dbEdit.rs == 1){
       //msg = "Successfully Admin Updated";
                  out.println("<div class=\"well well-sm text-center\" id=\"copied-msg\" style=\"color:green\">\n" +
"	    			 Successfully updated category!\n" +
"    			</div>");
       
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
       clas ="three";
   }
             
          }
   
} %>

<%
               String catId = request.getParameter("id");
              
               DBConnec dbEdCat =new DBConnec();
              dbEdCat.stmt=dbEdCat.con.prepareStatement("SELECT * from tbl_category where id="+ catId);
              
              dbEdCat.Rs=dbEdCat.stmt.executeQuery(); 
               while(dbEdCat.Rs.next()){ 
                                               String id = dbEdCat.Rs.getString(1);
                                              String name = dbEdCat.Rs.getString(2);
                                             
%>

<div class="form-elements">
<form name="" action="" method="post">
					<h1>UPDATE A CATEGORY</h1>
					<div class="hr"></div>
<!--                    <div class="notice-<?php echo $clas; ?>">
                    	<?php if(isset($msg)){ echo $msg; } ?>
						<span></span>
					</div>-->
					<div class="fixed form-elements-inputs">
						<div class="col-240">
							<h4>Enter Category Name</h4>
							<h4>Publish</h4>
                            <h4>&nbsp;</h4>
						</div>
						<div class="col-400">
							<input type="hidden" name="id" value="<%= id %>" />
                            <input type="text" name="catname" value="<%= name %>" />
							<div class="rad-el">YES<input class="rad" type="radio" name="publish" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="publish" value="0" /> </div>
							<div style="clear:both"></div>
							<input class="sub button-grey arrow" name="upd_category" type="submit" value="Submit">
						</div>
					</div>					
</form>
</div>
<%}
    
    %>