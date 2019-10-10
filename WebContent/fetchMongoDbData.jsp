<%@ page import="com.mongodb.BasicDBObject" %>
<%@ page import="com.mongodb.DB" %>
<%@ page import="com.mongodb.DBCollection" %>
<%@ page import="com.mongodb.DBCursor" %>
<%@ page import="com.mongodb.MongoClient" %>
<%@ page import="demo.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MongoDB</title>
<style>
body{
	background-color: #E0FFFF;
}
</style>

</head>
<body>
	<center><h2>MongoDB Data</h2></center>
		<%
				String projectReference=(String)request.getAttribute("projectReference");
				HandleConnection connection =  new HandleConnection();
				DB database = connection.createMongoDBConnection();
				
				DBCollection animalsData = database.getCollection("OTN_ANIMALS_DATA");
				DBCollection manmadePlatform = database.getCollection("OTN_MANMADE_PLATFORM");
				DBCollection projectAttributes = database.getCollection("OTN_PROJECT_ATTRIBUTES");
				DBCollection receivers = database.getCollection("OTN_RECEIVERS");
				DBCollection recoverOffload = database.getCollection("OTN_RECOVER_OFFLOAD_DETAILS");
				DBCollection tagReleases = database.getCollection("OTN_TAG_RELEASES");

				BasicDBObject animalRefQuery = new BasicDBObject("ANIMAL_PROJECT_REFERENCE", projectReference);
				BasicDBObject platformRefQuery = new BasicDBObject("PLATFORM_PROJECT_REFERENCE", projectReference);
				BasicDBObject projRefQuery = new BasicDBObject("PROJECT_REFERENCE", projectReference);
				BasicDBObject receiverRefQuery = new BasicDBObject("DEPLOYMENT_PROJECT_REFERENCE", projectReference);
				BasicDBObject recoveryRefQuery = new BasicDBObject("RECOVERY_PROJECT_REFERENCE", projectReference);
				BasicDBObject releaseRefQuery = new BasicDBObject("RELEASE_PROJECT_REFERENCE", projectReference);

				long time = System.currentTimeMillis();
				DBCursor animalCursor = animalsData.find(animalRefQuery);
				DBCursor platFormCursor = manmadePlatform.find(platformRefQuery);
				DBCursor projectCursor = projectAttributes.find(projRefQuery);
				DBCursor receiverCursor = receivers.find(receiverRefQuery);
				DBCursor recoveryCursor = recoverOffload.find(recoveryRefQuery);
				DBCursor releaseCursor = tagReleases.find(releaseRefQuery);
				long time2= System.currentTimeMillis();
				long timeTaken = time2-time; %>
				<b><%out.println("Response Time: "+timeTaken+" ms"); %></b>
				<br>
			<%	
out.println("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
			while (projectCursor.hasNext()) {
				out.println(projectCursor.next() + "\n"
+ "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
				while (platFormCursor.hasNext()) {
					out.println(platFormCursor.next() + "\n"
							+ "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
					while (animalCursor.hasNext()) {
						out.println(animalCursor.next() + "\n"
								+ "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
					while(releaseCursor.hasNext()){
						out.println(releaseCursor.next() +"\n"
								+ "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
						while(recoveryCursor.hasNext()){
							out.println(recoveryCursor.next()+"\n"
									+ "----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");
						}
					}
					}
				}
			}
		%>
</body>
</html>