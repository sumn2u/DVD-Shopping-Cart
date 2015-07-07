<%-- 
    Document   : shopping_cart
    Created on : Jun 24, 2015, 8:55:18 PM
    Author     : suman
--%>
<%@page import="com.admin.DBConnec"%>
<div id="content">
					<ul class="breadcrumb">
						<li class="home"><a href="index.jsp" ></a></li>
						<li class="last"><a href="#" >DVD</a></li>
					</ul>
    
        <form name="" action="" method="post">    
<div class="fixed form-elements-inputs">
						<div class="col-400">
							<input type="text" name="catname" value="" />
				
						</div>
						<div class="col-240">
							<input class="sub button-grey arrow" name="add_category" type="submit" value="Search">
						</div>
					</div>
   </form>
				
<!--					<?php 
					if(isset($_GET['msg'])){?>
						<div class="notice-four">
                    	<?php echo "Category deleted successfully"; ?>
						<span></span>
						</div>
						<?php }
					?>-->
<%
    String msg ="" ;
    String clas = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String cartId = request.getParameter("catname").trim();
        %>
 

					<table id="sample-table-sortable" class="sortable normal-table" cellspacing='0'> 
							<thead> 
								<tr> 
									<th class="first">Movie</th> 
									<th>Price</th>
                                                                        <th>Quantity</th>
                                                                        
								</tr> 
							</thead> 
							<tbody> 
                                                                 <%   
         DBConnec dbShopCarts =new DBConnec();
              dbShopCarts.stmt=dbShopCarts.con.prepareStatement("SELECT movie ,price, quantity from ShoppingCarts where cardId='"+ cartId  +"'");
              System.out.print( dbShopCarts.stmt);
              dbShopCarts.Rs=dbShopCarts.stmt.executeQuery();
              while(dbShopCarts.Rs.next()){ 
                                               String movie = dbShopCarts.Rs.getString(1);
                                               String price = dbShopCarts.Rs.getString(2);
                                               String quantity = dbShopCarts.Rs.getString(3);
                                              
		

%>                
                          
								<tr> 
									<td><%=movie%></td> 
									<td><%=price%></td> 
									<td><%=quantity%></td> 
                                                                        
								</tr> 
                            <%} %>
							</tbody>
					</table> 
</div>
   <% 
}else{%>
             
 

					<table id="sample-table-sortable" class="sortable normal-table" cellspacing='0'> 
							<thead> 
								<tr> 
									<th class="first">Movie</th> 
									<th>Price</th>
                                                                        <th>Quantity</th>
                                                                        
								</tr> 
							</thead> 
							<tbody> 
                                                                 <%   
         DBConnec dbShopCart =new DBConnec();
              dbShopCart.stmt=dbShopCart.con.prepareStatement("SELECT movie ,price, quantity from ShoppingCarts order by shoppinId limit 10");
              
              dbShopCart.Rs=dbShopCart.stmt.executeQuery();
              while(dbShopCart.Rs.next()){ 
                                               String movie = dbShopCart.Rs.getString(1);
                                               String price = dbShopCart.Rs.getString(2);
                                               String quantity = dbShopCart.Rs.getString(3);
                                              
		

%>                
                          
								<tr> 
									<td><%=movie%></td> 
									<td><%=price%></td> 
									<td><%=quantity%></td> 
                                                                        
								</tr> 
                            <%} %>
							</tbody>
					</table> 
</div>
                                                        <%   } %>