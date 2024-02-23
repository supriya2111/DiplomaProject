package com.source;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet; 
import java.util.Random;

import com.util.DbConnection;

public class Global_Function {
	Connection con = DbConnection.getConnection();
 
	public int[] keyboardSequence(int a,int b) {
		Random rgen = new Random();  // Random number generator		
		int size = b-a+1;
		int[] array = new int[size];
 
		for(int i=0; i< size; i++){
			array[i] = a+i;
		}
 
		for (int i=0; i<array.length; i++) {
		    int randomPosition = rgen.nextInt(array.length);
		    int temp = array[i];
		    array[i] = array[randomPosition];
		    array[randomPosition] = temp;
		}
 	
		return array;
	}
	
 
	public int getPracticalTaskNos(int pract_no)
	{
	int result=0;
	 try {
		PreparedStatement ps=con.prepareStatement("Select distinct COUNT(task_no) from `c_practial_task` where assign_no="+pract_no);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1);
			System.out.println("Result "+result);
		} 
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Exception ee "+e);
	} 
	 return result;    
	}
	
	public int getPracticalSubTaskNos(int pract_no, int task_no)
	{
	int result=0;
	 try {
		PreparedStatement ps=con.prepareStatement("Select COUNT(sub_task_no) from `c_practial_task` where task_no="+task_no+" AND assign_no="+pract_no);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt(1); 
		} 
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Exception ee "+e);
	} 
	 return result;    
	}
	public String getPracticalName(int pract_no)
	{
	String result="";
	 try {
		PreparedStatement ps=con.prepareStatement("Select * from `c_practical_details` where id="+pract_no);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getString("assign_name"); 
		} 
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Exception ee "+e);
	} 
	 return result;    
	}
	public String getStudentName(int id)
	{
	String result="";
	 try {
		PreparedStatement ps=con.prepareStatement("Select * from `student_details` where id="+id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getString("name"); 
		} 
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Exception ee "+e);
	} 
	 return result;    
	}
	
	public String getStudentEnrollNo(int id)
	{
	String result="";
	 try {
		PreparedStatement ps=con.prepareStatement("Select * from `student_details` where id="+id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getString("enroll_no"); 
		} 
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Exception ee "+e);
	} 
	 return result;    
	}
	
	public String getStudentEmail(int id)
	{
	String result="";
	 try {
		PreparedStatement ps=con.prepareStatement("Select * from `student_details` where id="+id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getString("email"); 
		} 
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Exception ee "+e);
	} 
	 return result;    
	}
	
	public int getPracticalNo(String id)
	{
  int result=0;
	 try {
		PreparedStatement ps=con.prepareStatement("Select * from `stud_pract_task` where upload_by="+id);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			result=rs.getInt("pract_no"); 
		} 
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println("Exception ee "+e);
	} 
	 return result;    
	}
 
}
