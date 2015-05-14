<%@page import="com.admin.DBConnec"%>

 <% 
   if ("POST".equalsIgnoreCase(request.getMethod())) {
   // Form was submitted.
       String clas = "";
        String catName = request.getParameter("category").trim();
        String dvdName = request.getParameter("dvd").trim();
        String price = request.getParameter("password").trim();
        String dvdQuantity = request.getParameter("").trim();
        String dvdDescription = request.getParameter("").trim();
        String active = request.getParameter("active");
      DBConnec dbAddDVD =new DBConnec();
       dbAddDVD.stmt=dbAddDVD.con.prepareStatement("INSERT INTO user (username, userpass, active)VALUES (? ,AES_ENCRYPT(?, 'sumn2u'), ?)");
     dbAddDVD.stmt.setString(1, catName);
     dbAddDVD.stmt.setString(2, dvdName);
     dbAddDVD.stmt.setString(3, active);
    
//  //out.println(dbEdit.stmt);
     dbAddDVD.rs = dbAddDVD.stmt.executeUpdate();
   if(dbAddDVD.rs == 1){
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
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<div class="form-elements">
<form name="ads" action="" method="post" enctype="multipart/form-data">
					<h1>ADD A NEW DVD</h1>
					<div class="hr"></div>
<!--                    <div class="notice-<?php echo $clas; ?>">
                    	<?php if(isset($msg)){ echo $msg; } ?>
						<span></span>
					</div>-->
					<div class="fixed form-elements-inputs">
						<div class="col-240">
							<h4> Category</h4>
                            <h4>DVD Name</h4>
                            <h4>Publish</h4>
                            <h4>Price</h4>
                            <h4>Quantity</h4>
                            <h4>Description</h4>
                            <h4></h4>
						</div>
						<div class="col-400">
                                                                    <%
                                        
                
               DBConnec dbCatList =new DBConnec();
              dbCatList.stmt=dbCatList.con.prepareStatement("SELECT cat_name from tbl_category");
              
              dbCatList.Rs=dbCatList.stmt.executeQuery(); 
              %>
							<select name="category">
                                                                                                        
                   
               <%while(dbCatList.Rs.next()){ %>
                                           
                                   <option value="<%= dbCatList.Rs.getString(1)%>"><%=dbCatList.Rs.getString(1)%></option>            
                                  
		<%}%>
<!--                            <?php
								$query1 = mysql_query("select * from tbl_category");
								while($query2 = mysql_fetch_array($query1)){ ?>
                                <option value="<?php echo $query2['cat_name']; ?>"><?php echo $query2['cat_name']; ?></option>
                            <?php } ?>-->
                            </select>
                            <input type="text" name="dvd" value="" />
                 
                            <div class="rad-el">YES<input class="rad" type="radio" name="publish" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="publish" value="0" /> </div>
						<div style="clear:both"></div>
                              <input type="text" name="ad_title" value="" />
                               <input type="text" name="ad_title" value="" />
                            <div class="wysiwyg-editor-wrapper">
							<textarea  name="editor1" id="sample-textarea" class="ckeditor" rows="20" cols="25" placeholder="Input Goes Here ! ! ">
								 
							</textarea>
							</div>
							<input class="sub button-grey arrow" name="add_ads" type="submit" value="Submit">
						</div>
					</div>					
</form>

</div>
<!--


<form method="POST" action="">
		
 <textarea  class="ckeditor" name="editor1" id="" cols="30" rows="10"></textarea>

  <input type="submit" value="Submit"/>
	</form>
<textarea name="ad_desc" id="sample-textarea" class="wysiwyg-editor m-top-30" rows="20" cols="25">
								Le text input
							</textarea>



	-->
