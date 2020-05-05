
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="model.Patient"%>
 <%@ page import="java.util.*"%> 
 <%@ page import="java.sql.*"%> 
 <%@ page import="javax.servlet.*"%> 
 <%@ page import="javax.servlet.http.*"%>  
 
<%
//SAVE
if(request.getParameter("patientName") != null)
{
	Patient patientObj = new Patient();
	String stsMsg = "";

	
	//INSERT
	if(request.getParameter("hidPatientIdSave") == "")
	{
		stsMsg = patientObj.insertPatient(request.getParameter("patientName"),
											request.getParameter("address"),
											request.getParameter("email"),
											request.getParameter("age"),
											request.getParameter("channelledDocName"),
											request.getParameter("phoneNo"));	
	}
	//update
	else
	{
		stsMsg = patientObj.updatePatient(request.getParameter("hidPatientIdSave"),
										request.getParameter("patientName"),
										request.getParameter("address"),
										request.getParameter("email"),
										request.getParameter("age"),
										request.getParameter("channelledDocName"),
										request.getParameter("phoneNo"));
	}
	session.setAttribute("ststusMsg", stsMsg);
	
}

//Delete
if(request.getParameter("hidPatientIdDelete") != null)
{
	Patient patientObj = new Patient();
	String stsMsg = patientObj.deletePatient(request.getParameter("hidPatientIdDelete"));
	session.setAttribute("statusMsg", stsMsg);
}
	
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Patient Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/patient.js"></script>
</head>
<body>
<div class="container">
<div class="row">
<div class="col-6">
	<h1>Patient Management</h1>
	<form id="formPatient" name="formPatient" method="post" action="patient.jsp">
		Patient Name:
		<input id="patientName" name="patientName" type="text" class="form-control form-control-sm">
		
		<br> Address:
		<input id="address" name="address" type="text" class="form-control form-control-sm">
		
		<br> Email:
		<input id="email" name="email" type="email" class="form-control form-control-sm">
		
		<br> Age:
		<input id="age" name="age" type="text" class="form-control form-control-sm">
		
		<br> Channeled Doctor Name:
		<input id="channelledDocName" name="channelledDocName" type="text" class="form-control form-control-sm">
		
		<br> Phone Number:
		<input id="phoneNo" name="phoneNo" type="text" class="form-control form-control-sm">
		
		<br>
		<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
		<input type="hidden" id="hidPatientIdSave" name="hidPatientIdSave" value="">
		
	</form>

	<div id="alertSuccess" class="alert alert-success"></div>
	<div id="alertError" class="alert alert-danger"></div>
	
	<br>
	<div id="divPatientGrid">
		<%
			Patient patientObj = new Patient();
			out.print(patientObj.readPatient());
		%>
	</div>
</div>
</div>
</div>

</body>
</html>