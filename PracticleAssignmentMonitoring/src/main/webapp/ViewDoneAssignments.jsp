<!DOCTYPE html>
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
						<table border="1" style="width: 100%">
							<tr align="center">
								<td>Sr No</td>
								<td>Student Name</td>
								<td>Enrollment Number</td>
								<td>Email Id</td>
								<td>Division</td>
								<td>Batch</td>
								<td>Subject</td>
								<td>Practical No</td>
								<td>IP Address</td>
								<td>View</td>
								<td>Status</td>
							</tr>
							<%
								Global_Function gf = new Global_Function(); 
								int sr_no = 0; 
								Connection con = DbConnection.getConnection();
								PreparedStatement ps = con
										.prepareStatement("select * from `stud_pract_task` ");
								ResultSet rs = ps.executeQuery();
								while (rs.next()) {
									sr_no++;
									int id = rs.getInt("id");
							%>
							<tr align="center">
								<td><%=sr_no%></td>
								<td><%=gf.getStudentName(id) %></td>
								<td><%=gf.getStudentEnrollNo(id)%></td>
								<td><%=gf.getStudentEmail(id)%></td>
								<td><%=rs.getString("division")%></td>
								<td><%=rs.getString("batch")%></td>
								<td><%=rs.getString("Subject")%></td>
								<td><%=rs.getString("pract_no")%></td>
								<td><%=rs.getString("ip_addr")%></td>
								<td><a href="ViewStudAssig.jsp?id=<%=id%>" style="color: blue;">Assignments <%=rs.getString("pract_no")%></a></td>
								<td><%=rs.getString("status")%></td>
							</tr>
							<%
								}
							%>
						</table>
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