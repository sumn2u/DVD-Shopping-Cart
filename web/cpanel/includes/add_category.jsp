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
      DBConnec dbAddAdmin =new DBConnec();
     dbAddAdmin.stmt=dbAddAdmin.con.prepareStatement("INSERT INTO tbl_category (cat_name,publish)VALUES (? ,? )");
     dbAddAdmin.stmt.setString(1, catName);
     dbAddAdmin.stmt.setString(2, active);
//  //out.println(dbEdit.stmt);
     dbAddAdmin.rs = dbAddAdmin.stmt.executeUpdate();
   if(dbAddAdmin.rs == 1){
       //msg = "Successfully Admin Updated";
           out.println("<div class=\"well well-sm text-center\" id=\"copied-msg\" style=\"color:green\">\n" +
"	    			Category added successfully.\n" +
"    			</div>");
       
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
       clas ="three";
   }
             
        }
   
}
    %>

<div class="form-elements">
<form name="" action="" method="post">
					<h1>ADD A NEW CATEGORY</h1>
					<div class="hr"></div>

<!--                    <div class="notice-<?php echo $clas; ?>"> 
                  <div class="notice-four"> 
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
							<input type="text" name="catname" value="" />
							<div class="rad-el">YES<input class="rad" type="radio" name="publish" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="publish" value="0" /> </div>
							<div style="clear:both"></div>
							<input class="sub button-grey arrow" name="add_category" type="submit" value="Submit">
						</div>
					</div>					
</form>
</div>
