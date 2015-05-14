/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.admin;

/**
 *
 * @author suman
 */
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Suman
 */
 import java.sql.*;
//import java.util.regex.*;
public class DBConnec {
   
    public Connection con;
    public PreparedStatement stmt;
    public  ResultSet Rs;
     public int rs;
    public DBConnec(){
       try{
           Class.forName("com.mysql.jdbc.Driver");
           con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eshopdb","root","root");
           System.out.println(con);
       }
       catch(Exception ex){
           ex.getMessage();
       }
   
   }
}
