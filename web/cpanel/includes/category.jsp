<%@page import="com.admin.DBConnec"%>
<div id="content">
					<ul class="breadcrumb">
						<li class="home"><a href="index.php" ></a></li>
						<li class="last"><a href="#" >Category</a></li>
					</ul>
				
<!--					<?php 
					if(isset($_GET['msg'])){?>
						<div class="notice-four">
                    	<?php echo "Category deleted successfully"; ?>
						<span></span>
						</div>
						<?php }
					?>-->
					<table id="sample-table-sortable" class="sortable normal-table" cellspacing='0'> 
							<thead> 
								<tr> 
									<th class="first">ID</th> 
									<th>Category Name</th> 
									<th>Publish</th> 
                                    <th>Action</th> 
								</tr> 
							</thead> 
							<tbody> 
                                                                                <%
                                        
                
               DBConnec dbCat =new DBConnec();
              dbCat.stmt=dbCat.con.prepareStatement("SELECT * from tbl_category");
              
              dbCat.Rs=dbCat.stmt.executeQuery(); 
               while(dbCat.Rs.next()){ 
                                               String id = dbCat.Rs.getString(1);
                                               String name = dbCat.Rs.getString(2);
                                               int active = dbCat.Rs.getInt(3);
		
		%>
                          
								<tr> 
									<td><%=id%></td> 
									<td><%=name%></td> 
									<td><%=active%></td> 
                                    <td><a href="index.jsp?page=edit_category&id=<%=id %>" class="">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?page=delete_category&id=<%=id %>" class="">Delete</a></td>
								</tr> 
                            <%} %>
							</tbody>
					</table> 
</div>