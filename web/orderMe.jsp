 <%@page import="com.admin.DBConnec"%>
<%
    
    String firstName = request.getParameter("firstname");
    String lastName = request.getParameter("lastname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone"); 
    String address = request.getParameter("address"); 
    String city = request.getParameter("city"); 

    String postalCode = request.getParameter("postalcode");
    String cartId = request.getParameter("cartId");

     System.out.println(firstName+ lastName+email +phone+address+city+postalCode+cartId);
     DBConnec dbAddCart =new DBConnec();
     dbAddCart.stmt=dbAddCart.con.prepareStatement("INSERT INTO buyers (shoppinId, firstname, lastname, emailaddress,city,state,postalCode,phone)VALUES (? , ?,?, ?,?,?,?,?)");
     dbAddCart.stmt.setString(1, cartId);
     dbAddCart.stmt.setString(2, firstName);
     dbAddCart.stmt.setString(3, lastName);
     dbAddCart.stmt.setString(4, email);
     dbAddCart.stmt.setString(5,  city);
     dbAddCart.stmt.setString(6, address);
     dbAddCart.stmt.setString(7, postalCode);
     dbAddCart.stmt.setString(8, phone);
       dbAddCart.rs = dbAddCart.stmt.executeUpdate();
   if(dbAddCart.rs == 1){
       out.println("success");
   }
     
    
 
 
 %>
 