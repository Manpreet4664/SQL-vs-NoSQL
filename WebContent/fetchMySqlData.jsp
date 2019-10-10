<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	String query = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MySQL</title>
<style>
body {
	background-color: #E0FFFF;
}
</style>
</head>
<body>
	<center>
		<h2>MySQL Data</h2>
	</center>
	<br>
	<table border="1" width="1500px">
		<tr>
			<td>Platform Project Reference</td>
			<td>Datacenter Reference</td>
			<td>Platform Refrence Id</td>
			<td>Platform Guid</td>
			<td>Platform Type</td>
			<td>Platform Depth</td>
		</tr>
		<%
			try {
				String projectRefrence = (String) request.getAttribute("projectReference");
				String connectionURL = "jdbc:mysql://localhost:3306/case_study_b00821998";
				Connection connection = null;
				query = "select * from otn_project_attributes as proj_attr ,"
						+ "otn_animals_data as animal,otn_manmade_platform as manmade,"
						+ "otn_receivers as receiver ,otn_recover_offload_details as offload,"
						+ "otn_tag_releases as tag,otn_detections as detection"
						+ " where proj_attr.PROJECT_REFERENCE = animal.ANIMAL_PROJECT_REFERENCE"
						+ " and proj_attr.PROJECT_REFERENCE = manmade.PLATFORM_PROJECT_REFERENCE"
						+ " and proj_attr.PROJECT_REFERENCE = receiver.DEPLOYMENT_PROJECT_REFERENCE"
						+ " and proj_attr.PROJECT_REFERENCE = offload.RECOVERY_PROJECT_REFERENCE"
						+ " and proj_attr.PROJECT_REFERENCE = tag.RELEASE_PROJECT_REFERENCE"
						+ " and proj_attr.PROJECT_REFERENCE = detection.DETECTION_PROJECT_REFERENCE"
						+ " and proj_attr.PROJECT_REFERENCE = '" + projectRefrence + "'" + " limit 100000";
				Class.forName("com.mysql.cj.jdbc.Driver");
				long initialTime = System.currentTimeMillis();
				connection = DriverManager.getConnection(connectionURL, "root", "Mani@2018");
				Statement st = connection.createStatement();
				ResultSet rs = st.executeQuery(query);
				long finalTime = System.currentTimeMillis();
				long timeTaken = finalTime - initialTime;
		%>
		<b>
			<%
				out.println("Response Time: " + timeTaken + " ms");
			%>
		</b>
		<br>
		<%
			int i = 1;
				while (rs.next()) {
		%>

		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
		</tr>
		<%
			i++;
				}
			} catch (Exception e) {
				out.println(query);
				out.println(e.getMessage());
			}
		%>
	
</body>
</html>