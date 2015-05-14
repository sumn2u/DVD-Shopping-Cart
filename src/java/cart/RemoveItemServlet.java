package cart;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class RemoveItemServlet extends HttpServlet {

    public void service(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {

        int itemIndex = Integer.parseInt(request.getParameter("item"));

        HttpSession session = request.getSession();


        ShoppingCart cart = (ShoppingCart) session.getAttribute("ShoppingCart");

        cart.removeItem(itemIndex);


        String url = "/ShowProductCatalog.jsp";
        ServletContext sc = getServletContext();
        RequestDispatcher rd = sc.getRequestDispatcher(url);
        rd.forward(request, response);
    }
} 