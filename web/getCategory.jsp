<%-- 
    Document   : getCategory
    Created on : May 1, 2015, 8:00:25 AM
    Author     : suman
--%>

<%@page import="com.admin.DBConnec"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <% 
         String catId= request.getParameter("catId");
     
      DBConnec dbShowCatId =new DBConnec();
              dbShowCatId.stmt=dbShowCatId.con.prepareStatement("SELECT id, movie, rating, year, price , quantity FROM `products` WHERE category ="+catId);
//              out.println(dbShowCatId.stmt);
             dbShowCatId.Rs=dbShowCatId.stmt.executeQuery(); 
             
//             
//               response.setContentType("application/json");
//               response.setCharacterEncoding("UTF-8");
//               response.getWriter().write();
//              out.println(dbShowCatId.Rs.next());
               while(dbShowCatId.Rs.next()){ 
                    String id = dbShowCatId.Rs.getString(1);
                   String movieName= dbShowCatId.Rs.getString(2);
                   String price = dbShowCatId.Rs.getString(5);
                   String quantity = dbShowCatId.Rs.getString(6);
                   String code = "p00"+id;                
                   %>
                   <li class="row" data-code=<%=code%> >
						<span class="quantity" data-total="<%= quantity%>">   <input type="text" class="form-control" id="dvdQuantity" ></span>
						<span class="itemName"><%= movieName %></span>
						<span class="addbtn" > <a class="glyphicon glyphicon-plus plus-icon"> </a></span>
						<span class="price" data-price="<%=price %>"><%= price %></span>
					</li> 
                
                   <%
               }
     
     
     
     %>
