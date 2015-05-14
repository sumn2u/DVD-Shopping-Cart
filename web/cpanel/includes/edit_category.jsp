<%@page import="com.admin.DBConnec"%>
<!--<?php
 $clas="";
if(isset($_POST['upd_category'])){
	$id = $_POST['id'];
	$catname = $_POST['catname'];
	$publish = $_POST['publish'];
	
	$query = mysql_query("update tbl_category set cat_name='$catname', publish= '$publish' where id='$id'");
	if($query){
		$msg = "Successfully Category Updated.";
		$clas = "four";
		}
	else{
		$msg = mysql_error();
		$clas = "three";
		}
	}

?>
<?php
if(isset($_GET['id'])){
	$id = $_GET['id'];
	$qcategory = mysql_query("select * from tbl_category where id='$id'");
	$qcategory1 = mysql_fetch_array($qcategory);
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
      DBConnec dbEdit =new DBConnec();
     dbEdit.stmt=dbEdit.con.prepareStatement("update tbl_category set cat_name=?, publish=? where id=?");
     dbEdit.stmt.setString(1, catName);
     dbEdit.stmt.setString(2, active);
     dbEdit.stmt.setString(3, userId);
//  //out.println(dbEdit.stmt);
     dbEdit.rs = dbEdit.stmt.executeUpdate();
   if(dbEdit.rs == 1){
       //msg = "Successfully Admin Updated";
        out.println(" <div class=\"notice-echo four\">\n" +
"                                            Successfully updated category!\n" +
"						<span></span>\n" +
"					</div>");
       
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
       clas ="three";
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