<%@page import="java.sql.ResultSet"%>
<%@page import="com.admin.DBConnec"%>

<ul id="navigation">
						<li class="first active">
							<div><a href="index.jsp">Dashboard</a><span class="icon-nav dashboard"></span></div>
							<div class="back"></div>
						</li>
						<li>
                                                    <div><a href="index.jsp?page=category">Category</a><span class="icon-nav calendar"></span><span>
                                                        <%
  DBConnec dbCatCount =new DBConnec();
  dbCatCount.stmt=dbCatCount.con.prepareStatement("SELECT count(id) As total from `tbl_category`");
   ResultSet rssCat= dbCatCount.stmt.executeQuery(); 
    
   while(rssCat.next()){
       int countt = rssCat.getInt("total");
       %>
       <%= countt%>
  <% }
    
    
    
    
    
    
    
    %>
                                                        </span></div>
							<div class="back"></div>
						</li>
						<li>
							<div><a href="index.jsp?page=add_category">Add A New Category</a><span class="icon-nav interface-elements"></span></div>
							<div class="back"></div>
						</li>
						<li>
							<div><a href="index.jsp?page=ads">DVD</a><span class="icon-nav form-elements"></span><span><%
  DBConnec dbDVD =new DBConnec();
  dbDVD.stmt=dbDVD.con.prepareStatement("SELECT count(id) As total from `products`");
   ResultSet rssst= dbDVD.stmt.executeQuery(); 
    
   while(rssst.next()){
       int countDVD = rssst.getInt("total");
       %>
       <%= countDVD%>
  <% }
    
    
    
    
    
    
    
    %></span></div>
							<div class="back"></div>
						</li>
                                                 <li>
							<div><a href="index.jsp?page=admin">Admin </a><span class="icon-nav settings"></span>
                                                        
                                                            <span><%                                         DBConnec dbAdmin =new DBConnec();
  dbAdmin .stmt=dbAdmin .con.prepareStatement("SELECT count(id) As total from `user`");
   ResultSet rssas= dbAdmin .stmt.executeQuery(); 
    
   while(rssas.next()){
       int count = rssas.getInt("total");
       %>
       <%= count%>
  <% }  %> </span></div>
							<div class="back"></div>
						</li>
						<li>
							<div><a href="index.jsp?page=add_ads">Add A New DVD</a><span class="icon-nav interface-elements"></span></div>
							<div class="back"></div>
						</li>
         
                                                 <li>
							<div><a href="index.jsp?page=shopping_cart">Shopping Cart</a><span class="icon-nav form-elements"></span></div>
							<div class="back"></div>
						</li>
                       
						
                                                <li>
							<div><a href="index.jsp?page=back_up">Back up </a><span class="icon-nav interface-elements"></span></div>
							<div class="back"></div>
						</li>
						
						<li>
							<div><a href="index.jsp?page=add_admin">Add A New Admin</a><span class="icon-nav users"></span></div>
							<div class="back"></div>
						</li>
						
						
					
					</ul>