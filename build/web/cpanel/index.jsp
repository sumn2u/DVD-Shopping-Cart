<%
String username = (String)session.getAttribute("username");
    
    if(username == null || username == ""){
        out.println("<script>window.location='login.jsp'</script>");
    }
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control", "must-revalidate");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    
    %>
<%@include file="includes/header.jsp" %>

		<div id="layout">
			<div id="header-wrapper">
				<div id="header">
					<div id="user-wrapper" class="fixed">
						<div class="user">
                                                    <span>Welcome <a href="#"><%= username%>!</a></span>
							<span class="logout"><a href="logout.jsp">Logout</a></span>
						</div>
					</div>
					
					<div id="launcher-wrapper">
						<div class="logo">
							<a href="index.jsp"><h1>CPANEL </h1> </a>
						</div>
					</div>
				</div>
			</div>
			
			<div class="page fixed">
				<div id="sidebar">
					<!-- side bar jsp  -->	
                                        <%@include file="includes/sidebar.jsp" %>
				</div>
				
				
				<div id="content">
                                    <% String pageName = request.getParameter("page"); 
//                                   out.println("Page Name" + pageName);
			if(pageName == "" || pageName == null){	%>
                         <div class="fixed index-large-icon">
                             <h1><center>Welcome to CPanel</center></h1>
                                                <div class="img-wrapper">
                                                    
                                                </div>
                         </div>
                     
                       <% }else{
               if(pageName.equals("category") ){%>  
               
                   <%@ include file="includes/category.jsp" %>
                      
                <%} else if(pageName.equals("admin")) {%>
                    <%@ include file="includes/admin.jsp" %>
                    
               <% }else if(pageName.equals("edit_admin")) {%>
                  <%@ include file="includes/edit_admin.jsp" %>
                  
                  <% }else if(pageName.equals("add_admin")){%>
                  <%@ include file="includes/add_admin.jsp" %>
                  
                  <%} else if(pageName.equals("delete_admin")){ %> 
                  
                 <%@ include file="includes/del_admin.jsp" %>
                 <% }else if(pageName.equals("add_category")){%>
                 <%@ include file="includes/add_category.jsp" %>
                 
                 <% } else if(pageName.equals("ads")){%>
                 <%@ include file="includes/ads.jsp" %>
                 
              <% } else if(pageName.equals("del_ads")){%>
              
                 <%@ include file="includes/del_ads.jsp" %>
                 
                 <% }else if(pageName.equals("edit_ads")){ %>
                 
                 <%@ include file="includes/edit_ads.jsp" %>
                 
                 <%}else if(pageName.equals("add_ads")){ %>
               
                <%@ include file="includes/add_ads.jsp" %>
                
                <%} else if(pageName.equals("delete_category")){%>
                
                <%@ include file="includes/del_category.jsp" %>
                
                <%} else if(pageName.equals("edit_category")) { %>
                
                <%@ include file="includes/edit_category.jsp" %>
                
               <%}
               
               
//                   else{ye
//                        
//                    }
                        }
                        			
                    %>
					<!--else{ ?>-->
<!--                    <div class="fixed index-large-icon">
						<h1>LATEST  PRODUCTS</h1>
                        <div class="img-wrapper">
<!--                        <?php
							$image = mysql_query("select * from tbl_product ORDER BY ad_created DESC LIMIT 8");
							while($image2 = mysql_fetch_array($image)){ ?>
                            <div class="img-box">
                            <img src='../uploads/<?php echo $image2["ad_image"]; ?>' width="120" height="100"  />
                            <p class="img-title"><?php echo $image2["ad_title"]; ?></p>
                            <p class="img-date"><?php echo date('jS M Y', strtotime($image2["ad_created"])); ?></p>
                            </div>
                        <?php } ?>-->
                        
                       <!-- </div>
					</div>
<!--				<?php } ?>-->
				</div>
				
			</div>
		</div>

	
	
	
	 
	</body>
	
</html>
