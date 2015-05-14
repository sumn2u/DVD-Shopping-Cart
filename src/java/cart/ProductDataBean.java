package cart;


import java.io.*;
import java.sql.*;
import java.util.*;

public class ProductDataBean implements Serializable
{
	private static Connection connection;
	
	public ProductDataBean()
	{
        try
        {
                String userName = "root";
                String password = "root";
                String url = "jdbc:mysql://localhost/eshopdb";
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = DriverManager.getConnection(url,userName,password);
                System.out.println("Database connection established");
        }catch(Exception e){e.printStackTrace();}
	}

    public static Connection getConnection()
	{
		return connection;
	}

	public ArrayList getProductList() throws SQLException
	{
		ArrayList productList = new ArrayList();
		Statement statement = connection.createStatement();
		ResultSet results = statement.executeQuery("SELECT * FROM products");

		while (results.next())
		{
			DVD movie = new DVD();
                         movie.setId(results.getString(1));
			 movie.setMovie(results.getString(2));
			 movie.setRating(results.getString(3));
			 movie.setYear(results.getString(4));
			 movie.setPrice(results.getDouble(5));

			 productList.add(movie);
		 }

		 return productList;
	 }


}
