<%@ page import="cart.*,java.util.*,java.text.*" %>

<%
    ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");

    if (cart == null)
    {
        cart = new ShoppingCart();
        session.setAttribute("ShoppingCart", cart);
        System.out.println("test------");
    }
    System.out.println("-------test");

    Vector items = cart.getItems();

    if (items.size() != 0)
    
    {
%>
<%-- Display the heading of the shoppingCart --%>

<h1>Shopping Cart</h1>

<br>
<table border=4>
<tr><th>DVD Names<th>Rate<th>Year<th>Price<th>Quantity<th>Remove
<%
        int numItems = items.size();
        NumberFormat currency = NumberFormat.getCurrencyInstance();

        for (int i=0; i < numItems; i++)
        {
            DVD item = (DVD) items.elementAt(i);
%>
       <tr>
        <form action="RemoveItemServlet" method="POST">
          <td><%= item.getMovie() %></td>
          <td><%= item.getRating() %></td>
          <td><%= item.getYear() %></td>
          <td><%= item.getPrice() %></td>
          <td><%= item.getQuantity() %></td>    
          <td>
          <input type="hidden" name= "item" value='<%= i %>'> 
          <input type="submit" value="Remove">  </td>    
         </form> 
         
        </tr>
        
<%
        }
%>
</table>

<form  action="CheckoutServlet" method="POST">
<input type="submit" name="Submit" value="Check out">
</form>
<%
}
%>

