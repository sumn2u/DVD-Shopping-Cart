<%@page import="com.admin.DBConnec"%>

 <% 
   if ("POST".equalsIgnoreCase(request.getMethod())) {
   // Form was submitted.
        String catName = request.getParameter("category").trim();
        String dvdName = request.getParameter("dvd").trim();
        String price = request.getParameter("price").trim();
        String dvdQuantity = request.getParameter("quantity").trim();
//        String dvdDescription = request.getParameter("").trim();
        String active = request.getParameter("active");
        if(catName == null ||catName == "" ||dvdName == "" ||dvdName== null ||price == "" ||price== null||dvdQuantity == "" ||dvdQuantity== null){
                       out.println("<div class=\"well well-sm text-center\" id=\"copied-msg\" style=\"color:red\">\n" +
"	    			All fields are required.\n" +
"    			</div>");
        }else{
      DBConnec dbAddDVD =new DBConnec();
       dbAddDVD.stmt=dbAddDVD.con.prepareStatement("INSERT INTO products (movie, price,quantity,category, publish)VALUES (? ,?, ?,?,?)");
     dbAddDVD.stmt.setString(1, dvdName);
     dbAddDVD.stmt.setString(2, price);
     dbAddDVD.stmt.setString(3, dvdQuantity);
      dbAddDVD.stmt.setString(4, catName);
     dbAddDVD.stmt.setString(5, active);
    
 System.out.println(dbAddDVD.stmt);
     dbAddDVD.rs = dbAddDVD.stmt.executeUpdate();
   if(dbAddDVD.rs == 1){
       //msg = "Successfully Admin Updated";
                         out.println("<div class=\"well well-sm text-center\" id=\"copied-msg\" style=\"color:red\">\n" +
"	    			Successfully added dvd.\n" +
"    			</div>");
       
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
       out.println("Could not delete it!");
   }
   }
 
   }
 
 %>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<div class="form-elements">
<form name="ads" action="" method="post">
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
                                        
                
               DBConnec dbCatLists =new DBConnec();
              dbCatLists.stmt=dbCatLists.con.prepareStatement("SELECT id, cat_name from tbl_category");
              
              dbCatLists.Rs=dbCatLists.stmt.executeQuery(); 
              %>
							<select name="category">
                                                                                                        
                   
               <%while(dbCatLists.Rs.next()){ %>
               
                                           
                                   <option value="<%= dbCatLists.Rs.getString(1)%>"><%=dbCatLists.Rs.getString(2)%></option>            
                                  
		<%}%>
<!--                            <?php
								$query1 = mysql_query("select * from tbl_category");
								while($query2 = mysql_fetch_array($query1)){ ?>
                                <option value="<?php echo $query2['cat_name']; ?>"><?php echo $query2['cat_name']; ?></option>
                            <?php } ?>-->
                            </select>
                            <input type="text" name="dvd" value="" />
                 
                           <div class="rad-el">YES<input class="rad" type="radio" name="active" checked="checked" value="1" /></div> <br/>
                            <div class="rad-el">NO<input class="rad" type="radio" name="active" value="0" /> </div>
						<div style="clear:both"></div>
                              <input type="text" name="price" value="" />
                               <input type="text" name="quantity" value="" />
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
