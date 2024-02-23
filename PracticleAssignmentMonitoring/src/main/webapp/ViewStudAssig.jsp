<!DOCTYPE html>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.source.Global_Function"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<title>Practical Assignment Monitoring</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/ionicons.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<jsp:include page="header\TeacherHeader.jsp"></jsp:include>


	<section class="hero-wrap js-fullheight"
		style="background-image: url('images/bg_1.jpg');" data-section="home">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-end"
				data-scrollax-parent="true">
				<div class="col-md-6 ftco-animate"
					data-scrollax=" properties: { translateY: '70%' }">
					<h1 class="mb-4"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Practical Assignment Monitoring</h1>
					 
				</div>
			</div>
		</div>
	</section>
 
	<section class="ftco-section bg-light" id="attorneys-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-10 heading-section text-center ftco-animate">
					<span class="subheading"></span>
					<h2 class="mb-4">View Practical Assignments</h2>
					<div align="center">
					<form action="UpdateResult" method="post"> 
						<table >
							<%  
							String id=request.getParameter("id"); 
								Connection con = DbConnection.getConnection();
								PreparedStatement ps = con
										.prepareStatement("select * from `stud_pract_task` where id="+id);
								ResultSet rs = ps.executeQuery();
								if (rs.next()) { 
									String filename=rs.getString("filename");
									String s_id=rs.getString("upload_by");
									String pract_no=rs.getString("pract_no");
									BufferedReader br=new BufferedReader(new FileReader("E:/upload/"+s_id+"_"+pract_no+"_"+filename));
									String line=br.readLine();
									StringBuilder sb=new StringBuilder();
									while(line!=null)
									{
										sb.append(line);
										sb.append(System.lineSeparator());
										line=br.readLine();
									}
									String Pract_data=sb.toString();
									br.close();
							%>
							<tr align="center"> 
							<td><textarea rows="10" cols="100" ><%=Pract_data %></textarea></td>
							</tr>
							
							</table>
							<table>
							<tr align="center">
								<td>Task 1</td>
								<td><input type="radio" name="task1" value="Fully Execute" required="required">Fully Execute</td>
								<td><input type="radio" name="task1" value="Partially Execute" required="required">Partially Execute</td>
								<td><input type="radio" name="task1" value="Not Execute" required="required">Not Execute</td>
							</tr>
						<tr align="center">
								<td>Task 2</td>
								<td><input type="radio" name="task2" value="Fully Execute" required="required">Fully Execute</td>
								<td><input type="radio" name="task2" value="Partially Execute" required="required">Partially Execute</td>
								<td><input type="radio" name="task2" value="Not Execute" required="required">Not Execute</td>
							</tr>
							<tr align="center">
								<td>Task 3</td>
								<td><input type="radio" name="task3" value="Fully Execute" required="required">Fully Execute</td>
								<td><input type="radio" name="task3" value="Partially Execute" required="required">Partially Execute</td>
								<td><input type="radio" name="task3" value="Not Execute" required="required">Not Execute</td>
							</tr>
							<tr align="center">
								<td>Task 4</td>
								<td><input type="radio" name="task4" value="Fully Execute" required="required">Fully Execute</td>
								<td><input type="radio" name="task4" value="Partially Execute" required="required">Partially Execute</td>
								<td><input type="radio" name="task4" value="Not Execute" required="required">Not Execute</td>
							</tr>
							<tr align="center">
								<td>Task 5</td>
								<td><input type="radio" name="task5" value="Fully Execute" required="required">Fully Execute</td>
								<td><input type="radio" name="task5" value="Partially Execute" required="required">Partially Execute</td>
								<td><input type="radio" name="task5" value="Not Execute" required="required">Not Execute</td>
							</tr>	
							<tr>
							<td><input type="hidden" name="stud_id" value="<%=s_id%>">
							<input type="hidden" name="pract_no" value="<%=pract_no%>"></td>
							<%
								}
							%>
							<td><input type="submit" value="Submit"></td>
							</tr>			 
						 </table>
						 </form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger"></i> by <a
							href="https://colorlib.com" target="_blank">Student</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>

	<script src="js/main.js"></script>

</body>
</html>