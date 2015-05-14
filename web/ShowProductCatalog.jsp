<%@ page import = "java.util.*" import="cart.*,java.net.*,java.text.*" %>
<jsp:useBean id = "data" scope= "request" class = "cart.ProductDataBean" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home::DVD Shopping Cart</title>
        <style>
            *a{
               text-decoration: none;
            }
        </style>
    </head>
<body>

<%
    List productList = data.getProductList();
    Iterator prodListIterator = productList.iterator();
%>

<p>
<center>
<h1>DVD Catalog</h1>

 <table border="1">
          <thread><tr>
                  <th> S.No</th>
            <th>DVD Names</th>
            <th>Rate</th>
            <th>Year</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>AddCart</th>
          </tr></thread>
  <%      
        while (prodListIterator.hasNext())
        {         
          DVD movie = (DVD)prodListIterator.next();
          String movieQuantity = "movieQuantity";
  %>
        <tr>
        <form name="AddToShoppingCartServlet" action="AddToShoppingCartServlet" method="POST">
            <td><%=movie.getId()%> </td>
          <td><%= movie.getMovie() %></td>
          <td><%= movie.getRating() %></td>
          <td><%= movie.getYear() %></td>
          <td><%= movie.getPrice() %></td>
          <td><input type = text name = <%= movieQuantity %> size="5" /></td>
          <td>
              <input type="hidden" name="movieId" value='<%=movie.getId() %>'>
          <input type="hidden" name= "movieName" value='<%= movie.getMovie() %>'>
          <input type="hidden" name= "movieRate" value='<%= movie.getRating() %>'>
          <input type="hidden" name= "movieYear" value='<%= movie.getYear() %>'>
          <input type="hidden" name= "moviePrice" value='<%= movie.getPrice() %>'> 
          <input type="submit" value="AddToCart">    </td>  
         </form> 
         
        </tr>
  <%
        } 
  %>
    </table>
    
    <p>
    <hr> 
    <jsp:include page="DisplayShoppingCart.jsp" flush="true" />
    
</center>

</body>
</html>
