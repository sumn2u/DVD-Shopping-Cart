<%@page import="com.admin.DBConnec"%>
<!--<?php
if(isset($_POST['edit_ads'])){
	$id = $_POST['id'];
	$ad_cat = $_POST['category'];
	$ad_title = $_POST['ad_title'];
	$ad_link = $_POST['ad_link'];
	$ad_desc = $_POST['editor1'];
	$publish = $_POST['publish'];
	$ad_created = date("Y-m-d");
	
	if(!empty($_FILES["image"]["name"])){
	//this delete the previous image
	$query = mysql_query("select * from tbl_product where ad_id='$id'");
	$query2 = mysql_fetch_array($query);
	$image = $query2['ad_image'];
	$image2 = '/adlisting/uploads/'.$image;
	unlink($_SERVER['DOCUMENT_ROOT'].$image2);
	
	$ad_image = $_FILES["image"]["name"];
	$tmp_name = $_FILES["image"]["tmp_name"];
	
	move_uploaded_file($_FILES["image"]["tmp_name"],
      "../uploads/" . $_FILES["image"]["name"]);
	$query3 = mysql_query("update tbl_product set  
	  ad_image = '$ad_image'
	  where ad_id='$id'"); 
	}
	
	$query = mysql_query("update tbl_product set
			ad_cat = '$ad_cat', 
			ad_title = '$ad_title', 
			ad_link = '$ad_link', 
			ad_desc = '$ad_desc', 
			ad_created = '$ad_created', 
			publish = '$publish' 
			where ad_id = '$id'");
	if($query){
		echo "<script>window.location='index.php?page=ads'</script>";
		}
	else{
		echo "<script>window.location='index.php?page=ads'</script>";		}
	}

?>
<?php
if(isset($_GET['id'])){
	$id = $_GET['id'];
	$query = mysql_query("select * from tbl_product where ad_id='$id'");
	$query3 = mysql_fetch_array($query);
	}
?>-->
<%
    String msg ="" ;
    String clas = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
   // Form was submitted.
        String movId = request.getParameter("id").trim();
        String dvdNames = request.getParameter("dvdName").trim();
        String price  = request.getParameter("dvd_price").trim();
        String quantity = request.getParameter("quantity").trim();
        String catName = request.getParameter("category").trim();
        String active = request.getParameter("publish").trim();
      DBConnec dbEdit =new DBConnec();
     dbEdit.stmt=dbEdit.con.prepareStatement("update products set movie=?, price=?, total=?, category=?, publish=? where id=?");
     dbEdit.stmt.setString(1, dvdNames);
     dbEdit.stmt.setString(2, price);
     dbEdit.stmt.setString(3, quantity);
     dbEdit.stmt.setString(4, catName);
     dbEdit.stmt.setString(5, active);
     dbEdit.stmt.setString(6, movId);
       System.out.println(dbEdit.stmt);
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
                                        
                     String dvdId = request.getParameter("id");
               DBConnec dbEditDvD =new DBConnec();
              dbEditDvD.stmt=dbEditDvD.con.prepareStatement("SELECT * from products where id=" +dvdId);
              
              dbEditDvD.Rs=dbEditDvD.stmt.executeQuery(); 
               while(dbEditDvD.Rs.next()){ 
                                               String ids = dbEditDvD.Rs.getString(1);
                                               String dvdname = dbEditDvD.Rs.getString(2);
                                               String rating = dbEditDvD.Rs.getString(3);
                                                String description = dbEditDvD.Rs.getString(4);
                                                 String price = dbEditDvD.Rs.getString(5);
                                                 String quantity = dbEditDvD.Rs.getString(6);
                                                String category= dbEditDvD.Rs.getString(7);
                                                String show = dbEditDvD.Rs.getString(8);
		
		%>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<div class="form-elements">
<form name="ads" action="" method="post" >
					<h1>UPDATE DVD</h1>
					<div class="hr"></div>
					<div class="fixed form-elements-inputs">
						<div class="col-240">
								<h4> Category</h4>
                            <h4>DVD Name</h4>
<!--                            <h4>Rating</h4>-->
                            <h4>Price</h4>
                            <h4>Quantity</h4>
                            <h4>Publish</h4>
<!--                            <h4>Description</h4>-->
                            <h4></h4>
						</div>
						<div class="col-400">
							
                            <select name="category">
                                                                            <%
                                        
                
               DBConnec dbCatListing =new DBConnec();
              dbCatListing.stmt=dbCatListing.con.prepareStatement("SELECT id, cat_name from tbl_category");
              
              dbCatListing.Rs=dbCatListing.stmt.executeQuery(); 
              %>
                         <%while(dbCatListing.Rs.next()){ %>
                                           
                                   <option value="<%= dbCatListing.Rs.getString(1)%>"><%=dbCatListing.Rs.getString(2)%></option>            
                                  
		<%}%>
                            </select>
                        
                            <input type="hidden" name="id" value="<%=dvdId%>" />
                            <input type="text" name="dvdName" value="<%= dvdname %>" />
<!--                            <input type="text" name="rating" value=" rating " />-->
                            <input type="text" name="dvd_price" value="<%= price %>" />
                            <input type="text" name="quantity" value="<%= quantity %>" />
                            <div class="rad-el">YES<input class="rad" type="radio" name="publish" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="publish" value="0" /> </div>
							<div style="clear:both"></div>
                                                        <div style="clear:both"></div>
                                                        <br/>
                                                    
                            <div class="wysiwyg-editor-wrapper">
<!--                            <textarea  name="editor1" id="sample-textarea" class="ckeditor" rows="20" cols="25" placeholder="Input Goes Here ! ! "> description %>
								 
							</textarea>-->
					
							</div>
							<input class="sub button-grey arrow" name="edit_ads" type="submit" value="Submit">
                                                       
                            <br/> <br/>
                            
						</div>
					</div>					
</form>
</div>
                             <% } %>
  
