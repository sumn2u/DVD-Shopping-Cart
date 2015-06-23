<%@page import="com.admin.DBConnec"%>
<div id="content">
					<ul class="breadcrumb">
						<li class="home"><a href="index.jsp" ></a></li>
						<li class="last"><a href="#" >DVD</a></li>
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
									<th>DVD Name</th>
                                                                        <th>Rating</th>
                                                                        <th>Description</th>
                                                                        <th>Price</th>
                                                                        <th>Quantity</th>
                                                                        <th>Category</th>
                                                                        <th>Publish</th> 
                                                                        
                                    <th>Action</th> 
								</tr> 
							</thead> 
							<tbody> 
                                                                                <%
                                        
                
               DBConnec dbCatt =new DBConnec();
              dbCatt.stmt=dbCatt.con.prepareStatement("SELECT * from products");
              
              dbCatt.Rs=dbCatt.stmt.executeQuery(); 
               while(dbCatt.Rs.next()){ 
                                               String id = dbCatt.Rs.getString(1);
                                               String dvdname = dbCatt.Rs.getString(2);
                                               String rating = dbCatt.Rs.getString(3);
                                                String description = dbCatt.Rs.getString(4);
                                                 String price = dbCatt.Rs.getString(5);
                                                 String quantity = dbCatt.Rs.getString(6);
                                                String category= dbCatt.Rs.getString(7);
                                                String show = dbCatt.Rs.getString(8);
		
		%>
                          
								<tr> 
									<td><%=id%></td> 
									<td><%=dvdname%></td> 
									<td><%=rating%></td> 
                                                                        <td><%=description%></td> 
                                                                        <td><%=price%></td> 
                                                                        <td><%=quantity%></td> 
                                                                        <td><%=category%></td> 
                                                                        <td><%= show%></td>
                                    <td><a href="index.jsp?page=edit_ads&id=<%=id %>" class="">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp?page=del_ads&id=<%=id %>" class="">Delete</a></td>
								</tr> 
                            <%} %>
							</tbody>
					</table> 
</div>