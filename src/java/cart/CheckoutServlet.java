
//CheckoutServlet.java
package cart;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import static java.lang.System.out;
import java.net.*;

public class CheckoutServlet extends HttpServlet
{
    public void service(HttpServletRequest request,
        HttpServletResponse response)
        throws IOException, ServletException
    {
        HttpSession session = request.getSession();

// Get the cart
        
        ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");
       // out.println(cart);
        
            try{ 
	            cart.completeOrder();
                    
			}catch(Exception e){e.printStackTrace();}
	            response.sendRedirect(response.encodeRedirectURL("ShowConfirmation.jsp"));
    }
} 
