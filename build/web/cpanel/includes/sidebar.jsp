<%@page import="java.sql.ResultSet"%>
<%@page import="com.admin.DBConnec"%>







<!--<?php
$cat = mysql_query("select * from tbl_category");
$catnum = mysql_num_rows($cat);
$ads = mysql_query("select * from tbl_product");
$adsnum = mysql_num_rows($ads);
$admin = mysql_query("select * from tbl_admin");
$adminum = mysql_num_rows($admin);
$page = mysql_query("select * from tbl_pages");
$pagenum = mysql_num_rows($page);
$image = mysql_query("select * from tbl_image");
$pageimg = mysql_num_rows($image);
$contact = mysql_query("select * from tbl_contact");
$conatctnum = mysql_num_rows($contact);
$news = mysql_query("select * from tbl_news");
$newsnum = mysql_num_rows($news);
?>-->
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
							<div><a href="index.jsp?page=add_ads">Add A New DVD</a><span class="icon-nav interface-elements"></span></div>
							<div class="back"></div>
						</li>
                        
                        <li>
							<div><a href="index.jsp?page=admin">Admins</a><span class="icon-nav settings"></span><span> <%
  DBConnec db =new DBConnec();
  db.stmt=db.con.prepareStatement("SELECT count(id) As total from `user`");
   ResultSet rsss= db.stmt.executeQuery(); 
    
   while(rsss.next()){
       int count = rsss.getInt("total");
       %>
       <%= count%>
  <% }
    
    
    
    
    
    
    
    %></span></div>
							<div class="last"></div>
						</li>
						
						<li>
							<div><a href="index.jsp?page=add_admin">Add A New Admin</a><span class="icon-nav users"></span></div>
							<div class="back"></div>
						</li>
						
						
					
					</ul>