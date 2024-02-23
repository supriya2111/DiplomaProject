package com.source;

import java.io.IOException; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 
import javax.servlet.http.HttpSession;

import com.util.DbConnection;

/**
 * Servlet implementation class AttackerLogin
 * RITESH SURANGE
 */
@WebServlet("/TeacherLogin")
public class TeacherLogin extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L; 
	Connection con = null;
	PreparedStatement ps;
	ResultSet rs;
	public void init(ServletConfig config) throws ServletException 
	{
		try {

			con = DbConnection.getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String uname = request.getParameter("username");
		String pwd = request.getParameter("password"); 

		PreparedStatement ps1;
		try {
			ps1 = con.prepareStatement("select * from teacher_details where email='"+ uname + "' AND password='" + pwd + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{ 
				String id=rs.getString("id");
				String fname=rs.getString("name"); 
				String email=rs.getString("email"); 
				String subject=rs.getString("subject");  
				
				session.setAttribute("id", id);
				session.setAttribute("name", fname); 
				session.setAttribute("email", email);
				session.setAttribute("division", subject);  
				System.out.println("Login Done");
				response.sendRedirect("TeacherHome.jsp?login=done");
			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("TeacherLogin.jsp?login=fail");
			}
		} catch (SQLException e) 
		{
			System.out.println("Exception Occure :- " + e);
		}


	}

}
