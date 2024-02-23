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
 * Servlet implementation class GMLogin
 */
@WebServlet("/StudentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		HttpSession session = request.getSession();
		
		System.out.println("pwd : "+pwd);
		PreparedStatement ps1;
		try {
			ps1 = con.prepareStatement("SELECT * FROM `student_details` where enroll_no='"+ username + "' AND password='" + pwd + "'");
			ResultSet rs = ps1.executeQuery();
			if (rs.next()) 
			{
				
				String id=rs.getString("id");
				String fname=rs.getString("name"); 
				String email=rs.getString("email"); 
				String division=rs.getString("division"); 
				String batch=rs.getString("batch"); 
				String ip_addr=rs.getString("ip_addr"); 
				String enroll_no=rs.getString("enroll_no"); 
				session.setAttribute("id", id);
				session.setAttribute("name", fname);
				session.setAttribute("enroll_no", enroll_no);
				session.setAttribute("email", email);
				session.setAttribute("division", division); 
				session.setAttribute("batch", batch);
				session.setAttribute("ip_addr", ip_addr);
				System.out.println("Login Done");
				response.sendRedirect("StudentHome.jsp?login=done");
			}
			else 
			{
				System.out.println("Login fail");
				response.sendRedirect("StudentLogin.jsp?login=fail");
			}
		} catch (SQLException e) 
		{
			System.out.println("Exception Occure :- " + e);
		}


	}

}
