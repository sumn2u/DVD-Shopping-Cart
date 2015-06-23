<%@page import="com.admin.DBConnec"%>
<div id="content">
					<ul class="breadcrumb">
						<li class="home"><a href="index.jsp" ></a></li>
						<li class="last"><a href="#" >Admin</a></li>
					</ul>
				
		
                                     <% String msg = request.getParameter("msg");
            if(msg != null){ %>
            <div class="notice-four">
             <%= "<p> Invalid Credentials !!</p>" %>
               <span></span>
						</div>
           <% }
            %>
					
						
                    	<?php echo "Admin Deleted Successfully"; ?>
						
					
					<table id="sample-table-sortable" class="sortable normal-table" cellspacing='0'> 
							<thead> 
								<tr> 
									<th class="first">ID</th> 
									<th>User Name</th> 
									<th>Active</th> 
                                    <th>Action</th> 
								</tr> 
							</thead> 
							<tbody> 
                                                           
                                   <%
                                        
                
               DBConnec dbb =new DBConnec();
              dbb.stmt=dbb.con.prepareStatement("SELECT * from user");
              
              dbb.Rs=dbb.stmt.executeQuery(); 
               while(dbb.Rs.next()){ 
                                               String id = dbb.Rs.getString(1);
                                               String name = dbb.Rs.getString(2);
                                               int active = dbb.Rs.getInt(4);
		
		%>
		
		
		
								<tr> 
									<td><%= id %></td> 
                                                                        <td><%= name %></td> 
									<td><%= active %></td> 
                                    <td><a href="index.jsp?page=edit_admin&id=<%= id %>" class="">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.php?page=delete_admin&id=<%= id %>" class="">Delete</a></td>
								</tr> 
                          <%} %>
                   
							</tbody>
					</table> 
</div>
                          
                          
                          
