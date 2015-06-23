
<%@ page import="cart.*, java.text.*" %>
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
    <h1><center>Your Order is confirmed!</center></h1> 
 <%  
        ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart"); 
 //removes to the index page if the session is null
 if(cart == null){
       String url="/index.jsp";
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
 }
 %>
     
        
<% 
    DecimalFormat twoDigits = new DecimalFormat("0.00");
    String totalPrice = "";
    String subtotal="";
            
            try {
                totalPrice = twoDigits.format(((ShoppingCart)session.getAttribute("ShoppingCart")).getTotalPrice());
                subtotal+=totalPrice;
            } catch (Exception e) {
                System.out.println("null session, already checked out");
            }
    %>
    
    <h1><center>The total amount is $<%=totalPrice %></center></h1>
    <p> <center>The sub total amount is $<%=subtotal %></center><p>
<% session.invalidate(); %>

</body>
</html> 
