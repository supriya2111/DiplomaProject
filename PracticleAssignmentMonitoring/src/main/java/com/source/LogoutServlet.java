package com.source;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet 
 * Ritesh Surange
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		try
		{
			HttpSession session=request.getSession();
			System.out.println("2nd session id="+session.getId());
			session.invalidate();
			session=null;
			response.sendRedirect("index.jsp?logout=done");
			return;
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}

}
