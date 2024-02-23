package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	
	public static Connection getConnection()

	{
		Connection con = null;
		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supriya", "root", "Supriya543@");
			System.out.println("Connected");
			return con;
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exception is " + e);

		}
		return con;
	}

}
