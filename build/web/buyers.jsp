<%-- 
    Document   : buyers
    Created on : Jul 5, 2015, 9:45:41 AM
    Author     : suman
--%>

<%@page import="com.admin.DBConnec"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
                  //out.println(cartId);
    for (int i = 0; i < Integer.MAX_VALUE; i++) {
    String itemName = request.getParameter("data[" + i + "][name]");
    //Integer quantity = request.getIntHeader("data[" + i + "][quantity]");
    String itemQuantity = request.getParameter("data[" + i + "][quantity]");
    String itemPrice = request.getParameter("data[" + i + "][price]");

    if (itemName == null) {
        break;
    }
     DBConnec dbAddCart =new DBConnec();
     dbAddCart.stmt=dbAddCart.con.prepareStatement("INSERT INTO ShoppingCarts (cardId, movie, price , quantity)VALUES (? , ?,?, ?)");
     dbAddCart.stmt.setString(1, "df");
     dbAddCart.stmt.setString(2, itemName);
     dbAddCart.stmt.setString(3, itemPrice);
     dbAddCart.stmt.setString(4, itemQuantity);
    
    
//  //out.println(dbEdit.stmt);
     dbAddCart.rs = dbAddCart.stmt.executeUpdate();
   if(dbAddCart.rs == 1){
       //SELECT sum( quantity ) AS quantity FROM ShoppingCarts WHERE movie = "District 9" 
//       DBConnec dbAddCartResult =new DBConnec();
//       dbAddCartResult.stmt = dbAddCartResult.con.prepareStatement("SELECT sum( quantity ) AS quantity FROM products WHERE movie ='"+itemName+"'");      
//       System.out.println(dbAddCartResult.stmt); 
//       
//       dbAddCartResult.Rs=dbAddCartResult.stmt.executeQuery(); 
//         while(dbAddCartResult.Rs.next()){ 
//                    Integer cartIds = dbCountCart.Rs.getInt(1) - itemQuantity ;
               
       DBConnec dbAddCartUpdate =new DBConnec();
    dbAddCartUpdate.stmt=dbAddCartUpdate.con.prepareStatement("update products set remaining=? where movie=?");
   //System.out.println(dbAddCartResult.stmt); 
    dbAddCartUpdate.stmt.setString(1, itemQuantity);
    dbAddCartUpdate.stmt.setString(2, itemName);
   dbAddCartUpdate.rs = dbAddCartUpdate.stmt.executeUpdate();
//     dbAddCartUpdate.stmt.setString(3, itemPrice);
//     dbAddCartUpdate.stmt.setString(4, itemQuantity);
       //msg = "Successfully Admin Updated";
//      if(dbAddCartUpdate.rs ==1){
       out.println("Tarnsaction successfull");
       //request.getRequestDispatcher("includes/admin.jsp").include(request, response);
       
   }else{
      out.println("Could Not procceed!!");
   }
              
    // Collect name and time in some bean and add to list yourself.
}
    
    
    %>