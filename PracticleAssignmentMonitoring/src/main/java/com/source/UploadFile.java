package com.source;
 
import java.io.File;  
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.util.DbConnection;

/**
 * Servlet implementation class UploadFile
 */
@WebServlet("/UploadFile")
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

    static Connection con;
	static int i = 0;
	final String UPLOAD_DIRECTORY="E:/upload/";
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
		HttpSession session=request.getSession();
		String id=session.getAttribute("id").toString();  
		if (ServletFileUpload.isMultipartContent(request)) {
			
			try {
				System.out.print("Conn Done ");
				@SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				
				String pract_no="",ip_addr="", division="",batch="",subject="";
				for (FileItem item : multiparts) {
					if ((item.getFieldName()).equals("pract_no")) {
						pract_no = (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) {
					if ((item.getFieldName()).equals("ip_addr")) {
						ip_addr = (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) {
					if ((item.getFieldName()).equals("division")) {
						division = (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) {
					if ((item.getFieldName()).equals("batch")) {
						batch = (String) item.getString();
					}
				} 
				for (FileItem item : multiparts) {
					if ((item.getFieldName()).equals("subject")) {
						subject = (String) item.getString();
					}
				} 
				
				String FileName = ""; 

				for (FileItem item1 : multiparts) {
					if (!item1.isFormField()) {
 
						String name = new File(item1.getName()).getName();
						item1.write(new File(UPLOAD_DIRECTORY +id+"_"+pract_no+"_"+ name));
						FileName = item1.getName(); 
					}
				}			
				 DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm:ss");
					Date dateobj = new Date();
					String c_date = df.format(dateobj);
					 
				 
					 PreparedStatement ps =con.prepareStatement("INSERT INTO `stud_pract_task`( `pract_no`, `filename`, `upload_by`, `u_date`, `division`, `batch`, `subject`, `ip_addr`)"
					 		+ " VALUES ("+pract_no+",'"+FileName+"',"+id+",'"+c_date+"','"+division+"','"+batch+"','"+subject+"','"+ip_addr+"')"); 
					 int rs=ps.executeUpdate();
					 
					 if(rs>0)
					 {
						 System.out.println("Data Insert Done ");
							System.out.println("Connection created ");
							response.sendRedirect("AttendPractical.jsp?upload=done");					 
					 }
					 else
					 {
						 System.out.println("Data");
							System.out.println("Connection created ");
							response.sendRedirect("AttendPractical.jsp?fail=upload");
					 }
			}

			catch (Exception ex) {
				System.out.println("Exception e " + ex);
				ex.printStackTrace();
			}
		}
		else 
		{
			System.out.println("Condition False");
			response.sendRedirect("AttendPractical.jsp?fail=uplaod");
		}
	}
}
