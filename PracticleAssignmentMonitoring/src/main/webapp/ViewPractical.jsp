<!DOCTYPE html>
<%@page import="com.source.Global_Function"%>
<%@page import="java.sql.ResultSet"%> 
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

	<jsp:include page="header\StudentHeader.jsp"></jsp:include>


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
					<p class="mb-4"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Group
						Data Sharing</p>
				</div>
			</div>
		</div>
	</section>
 
	<% 
	String subject=request.getParameter("subject");
	String division=request.getParameter("division");
	String batch=request.getParameter("batch"); 
	String id=session.getAttribute("id").toString();
	String ip_addr=session.getAttribute("ip_addr").toString();
	 
	 
	%>
	<section class="ftco-section bg-light" id="attorneys-section">
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-10 heading-section text-center ftco-animate">
					<span class="subheading"></span>
					<h2 class="mb-4">Select Practical</h2> 
					<div align="center">
						<form action="ViewPracticals.jsp" method="post">
						
							<table border="1">
								<tr>
									<td align="center">Practical No:-</td>
									<td><select name="pract_no" required>
									<option value="">--Select--</option>
									<% 									   
									Connection con=DbConnection.getConnection(); 
									Global_Function gf=new Global_Function();
									int pract_no=gf.getPracticalNo(id);
									
									PreparedStatement ps=con.prepareStatement("SELECT * FROM `c_practical_details` WHERE pract_no>"+pract_no);
									ResultSet rs=ps.executeQuery();
									while(rs.next())
									{
										%>
										<option value="<%=rs.getInt("pract_no")%>"><%=rs.getInt("pract_no")%></option>
										<%
									}   
									%> 									 
									</select></td>
								</tr>
								<tr>
			<td align="center">Aim:-</td>
			<td><textarea name="task_name" readonly="readonly" rows="3" cols="60"> 
			</textarea></td>
		</tr>
		 
		 				 <tr>
									<td align="center">IP Address:-</td>
									<td><input type="text" name="ip_addr" value="<%=ip_addr%>" readonly="readonly"></td>
								</tr>
								<tr>
									<td align="center">Attach File:-</td>
									<td><input type="file" name="file" accept=".txt" ></td>
								</tr>								 						 
								<tr>
									<td><input type="hidden" name="subject" value="<%=subject %>" required />
									<input type="hidden" name="division" value="<%=division %>" required />
									<input type="hidden" name="batch" value="<%=batch %>" required /></td>
									<td><input type="submit" value="Proceed"></td>
								</tr>
							</table>
						</form>
					 
					 </div></div>
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