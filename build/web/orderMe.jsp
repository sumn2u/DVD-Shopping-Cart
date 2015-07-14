 <%@page import="com.admin.DBConnec"%>
 <%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Authenticator"%>

<%@page import="java.util.Properties"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>

<%
      final String username = "sumn2u@gmail.com";
		final String password = "sumn2u@google:)";
 
		
    
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
       try {
           
         DBConnec dbAddCartGet =new DBConnec();
           dbAddCartGet.stmt=dbAddCartGet.con.prepareStatement(" SELECT movie, price, quantity FROM  ShoppingCarts where cardId='"+cartId+"'");
              System.out.println("Suman"+dbAddCartGet.stmt);
              dbAddCartGet.Rs=dbAddCartGet.stmt.executeQuery(); 
              Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
                String name="sssummmmmm";
 
		Session sessionMail = Session.getInstance(props , new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
                        System.out.println("dbAddCartGet.stmt"+dbAddCartGet.stmt);
			Message message = new MimeMessage(sessionMail);
			message.setFrom(new InternetAddress("sumn2u@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("sumn2u@hotmail.com"));
                        
			message.setSubject("Thank you for purchasing !");
                        String msg = "Dear," + firstName + lastName;
                        String products = "";
                         while(dbAddCartGet.Rs.next()){
                                 String movie = dbAddCartGet.Rs.getString(1);
                     String price = dbAddCartGet.Rs.getString(2);
                      String quantity = dbAddCartGet.Rs.getString(3);
			 products +="\n\nMovie:"+movie+ "   Price:"+price+"   Quantity:"+quantity;
                         }
                        message.setText(msg +products);
			Transport.send(message);
 
			System.out.println("Done sending mail");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}  
            
   
              
                
               
   
                         }

 
 %>
 