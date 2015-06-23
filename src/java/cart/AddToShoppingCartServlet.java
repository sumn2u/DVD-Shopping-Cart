package cart;



import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class AddToShoppingCartServlet extends HttpServlet
{
    public void service(HttpServletRequest request,
        HttpServletResponse response)
        throws IOException, ServletException
    {

// Get the DVD from the request
        String movieId = request.getParameter("movieId");
        String movieName = request.getParameter("movieName");
        String movieRate = request.getParameter("movieRate");
        String movieYear = request.getParameter("movieYear");
        String price = request.getParameter("moviePrice");

        int movieQuantity = Integer.parseInt(request.getParameter("movieQuantity"));
        double moviePrice = Double.parseDouble(price);

// Create this DVD and add to the cart
        DVD DVDItem = new DVD(movieId, movieName, movieRate, movieYear, moviePrice, movieQuantity);


        HttpSession session = request.getSession();

// Get the cart
        ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");

        if (cart == null)
        {
            cart = new ShoppingCart();

            session.setAttribute("ShoppingCart", cart);
        }

        cart.addItem(DVDItem);
        String url="/ShowProductCatalog.jsp";
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
    }
} 