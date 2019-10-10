<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="demo.*"%>
<html>
<head>
<title>OTN</title>
<style>
body{
	background-color: #E0FFFF;
}
</style>
</head>
<body>
	<form action="HandleSubmit" method="post">
	<center>
		<h2>Ocean Tracking Network Data</h2>
	</center>
	<center>
		<br></br>
		<center>
			<input type="radio" name="database" value="MySQL" checked="checked"/>MySQL <input
				type="radio" name="database" value="MongoDB" />MongoDB
		</center>
		<br></br> <label><b>Project Reference: </b></label>
		 <select name="projectReference" style="width: 110px;">
			<option value="-1">Select Project</option>
			<%
				try {
					ArrayList<String> projectAttributes = new ArrayList<String>();
					HandleConnection handleConnection = new HandleConnection();
					Statement st = handleConnection.createMySQLConnection();
					ResultSet rs = st.executeQuery(Constants.dropDownValues);
					int i = 1;
					while (rs.next()) {
			%>
			<option value="<%=rs.getString(1)%>">
				<%=rs.getString(1)%>
			</option>
			<%
				i++;
					}
				} catch (Exception e) {
					e.getMessage();
				}
			%>
		</select>
	</center>
	<br></br>
	<center> <input type="submit" value="Submit"/></center>
	</form>	        
</body>
</html>