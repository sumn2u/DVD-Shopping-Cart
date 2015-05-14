<%@page import="com.admin.DBConnec"%>
<!--<?php
 $clas="";
if(isset($_POST['add_category'])){
	$catname = $_POST['catname'];
	$publish = $_POST['publish'];
	if(empty($catname )){
		$msg = "Category Name is Required!!!";
		$clas = "three";
		}
		else{
			$query = mysql_query("insert into tbl_category (cat_name, publish) values('$catname','$publish')");
			if($query){
				$msg = "Successfully Category Added.";
				$clas = "four";
				}
			else{
				$msg = mysql_error();
				$clas = "three";
				}
			}
	}

?>-->
<%
    String msg ="" ;
    String clas = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
   // Form was submitted.
        String userId = request.getParameter("id");
        String catName = request.getParameter("catname").trim();
        String active = request.getParameter("publish");
      DBConnec dbAddAdmin =new DBConnec();
     dbAddAdmin.stmt=dbAddAdmin.con.prepareStatement("INSERT INTO tbl_category (cat_name,publish)VALUES (? ,? )");
     dbAddAdmin.stmt.setString(1, catName);
     dbAddAdmin.stmt.setString(2, active);
//  //out.println(dbEdit.stmt);
     dbAddAdmin.rs = dbAddAdmin.stmt.executeUpdate();
   if(dbAddAdmin.rs == 1){
       //msg = "Successfully Admin Updated";
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Successfully added category!\n" +
"						<span></span>\n" +
"					</div>");
       
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
       clas ="three";
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
