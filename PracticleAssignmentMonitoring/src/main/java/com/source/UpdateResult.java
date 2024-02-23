package com.source;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DbConnection;

/**
 * Servlet implementation class UpdateResult
 */
@WebServlet("/UpdateResult")
public class UpdateResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateResult() {
        super();
        // TODO Auto-generated constructor stub
    }
Connection con;
    
    public void init(ServletConfig config) throws ServletException {
		try {
			con = DbConnection.getConnection();
System.out.print("Conn Done ");
		} catch (Exception e) {

			System.out.println("Exception in DB" + e);
		}
	} 

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s_id=request.getParameter("stud_id");
		String pract_no=request.getParameter("pract_no");
		String task1=request.getParameter("task1");
		String task2=request.getParameter("task2");
		String task3=request.getParameter("task3");
		String task4=request.getParameter("task4");
		String task5=request.getParameter("task5");
		
		try {
			PreparedStatement ps=con.prepareStatement("UPDATE `stud_pract_task` SET task1='"+task1+"',task2='"+task2+"',task3='"+task3+"',task4='"+task4+"',task5='"+task5+"',status='Update' where upload_by="+s_id+" AND pract_no="+pract_no);
			int i=ps.executeUpdate();
			if(i>0)
			{
				System.out.println(" Update Done");
				response.sendRedirect("ViewDoneAssignments.jsp?done");
			}
			else
			{
				System.out.println("Not Update");
				response.sendRedirect("ViewDoneAssignments.jsp?fail");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Exe e "+e);
		}
	}

}
