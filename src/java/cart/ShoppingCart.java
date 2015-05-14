
//ShoppingCart.java
package cart;

import java.util.*;
import java.io.*;
import static java.lang.System.out;
import java.sql.*;

public class ShoppingCart implements java.io.Serializable
{
	private Connection connection;
	private PreparedStatement addRecord, getRecords;
	private Statement statement;
	private double totalPrice;
	static int CARTID =1;

    protected Vector items;

    public ShoppingCart()
    {
        items = new Vector();
    }

    public Vector getItems()
    {
        return (Vector) items.clone();
    }

    public void addItem(DVD newItem)
    {
    	Boolean flag = false;
    	if(items.size()==0)
    	{
    		items.addElement(newItem);
    		return;
    	}
    	 for (int i=0; i< items.size(); i++)
         {
             DVD dvd = (DVD) items.elementAt(i);
             if (dvd.getMovie().equals(newItem.getMovie()))
             {
                 dvd.setQuantity(dvd.getQuantity()+newItem.getQuantity());
                 items.setElementAt(dvd,i);
                 flag = true;
                 break;
             }
         }
    	 if(newItem.getQuantity()>0 && (flag == false))
         {
         	items.addElement(newItem);
         }
     }

    public void removeItem(int itemIndex)
    {
        items.removeElementAt(itemIndex);
    }

    public void completeOrder()
        throws Exception
    {
            Enumeration e = items.elements();
            connection = ProductDataBean.getConnection();
            statement = connection.createStatement();
         // System.out.println("sdadsda");
//System.out.println(connection);
            while (e.hasMoreElements())
            {
                DVD item = (DVD) e.nextElement();
                String itemQuantity = "" + item.getQuantity();
                totalPrice = totalPrice + item.getPrice() * Integer.parseInt(itemQuantity);
                String movieName = item.getMovie();

                String updateString = "INSERT INTO ShoppingCarts(cardId,movie,rating,year,price,quantity) " +
				" VALUES (" + CARTID  + ", '" +
			    item.getMovie() + "', '" +
				item.getRating() + "', '" +
				item.getYear() + "', " +
				item.getPrice() + ", " +
				item.getQuantity() + ")";
               // System.out.println("Sql String to be inserted" + updateString);
                statement.executeUpdate(updateString);
            }
            CARTID ++;
    }
    public double getTotalPrice()
    {
    	return this.totalPrice;
    }
}
