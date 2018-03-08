<%-- 
    Document   : sendMail
    Created on : Jul 13, 2015, 11:00:54 PM
    Author     : suman
--%>

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
		final String password = "******";
 
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
 
		try {
 
			Message message = new MimeMessage(sessionMail);
			message.setFrom(new InternetAddress("sumn2u@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("sumn2u@hotmail.com"));
			message.setSubject("Testing Subject For data maeaning ");
			message.setText("Dear Mail Crawler," + name 
				+ "\n\n No spam to my email, please!");
 
			Transport.send(message);
 
			System.out.println("Done sending mail");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}  
            
            
            
            
            
            
            
            %>
