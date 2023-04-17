<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
String login = "";
if (session.getAttribute("login") != null) {
	login = session.getAttribute("login").toString();
} else {
	response.sendRedirect("auth.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">

<meta charset="ISO-8859-1">
<link rel="stylesheet" href="styles.css">

<title>Add student</title>
</head>
<body>

	<div class="create-student-container">
		<div class="header">
			<h2>
				Welcome,
				<%=login%></h2>
			<a class="logout-button" href="Logout">Logout</a>
		</div>
		<h2>Create New Student</h2>
		<form action="Ajouter	" method="POST">
			<label for="name">Name</label> 
			<input type="text" id="name" name="name" required> 
			<label for="date">Date Inscription</label> 
			<input type="date" id="date" name="date" required>
			<label for="filliere">Filliere</label>
			<input type="text" id="filliere" name="filliere" required>
			<label for="age">Age</label>
			<input type="number" id="age" name="age" required>
			<button type="submit">Create</button>
		</form>
	</div>

</body>
</html>