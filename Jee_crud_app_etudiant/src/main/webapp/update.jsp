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

<title>Update student</title>
</head>
<body>

	<div class="create-student-container">
		<div class="header">
			<h2>
				Welcome,
				<%=login%></h2>
			<a class="logout-button" href="Logout">Logout</a>
		</div>
		<h2>Update Student</h2>
		<%
					String id = request.getParameter("id");
					String url = "jdbc:mysql://localhost:3306/jee_etudiant";
					String user = "root";
					String dbpass = "";
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection(url, user, dbpass);
						PreparedStatement pst = con.prepareStatement("SELECT * FROM students WHERE id=?");
						pst.setString(1, id);
						ResultSet rs = pst.executeQuery();

						if (rs.next()) {
					%>
					<form action="Update" method="POST">
						<input type="hidden" value="<%=rs.getString(1) %>" name="id">
						<label for="name">Name</label> 
						<input type="text" value="<%=rs.getString(2) %>" id="name" name="name" required> 
						<label for="date">Date Inscription</label> 
						<input type="date"  value="<%=rs.getString(3) %>" id="date" name="date" required>
						<label for="filliere">Filliere</label>
						<input type="text" value="<%=rs.getString(4) %>" id="filliere" name="filliere" required>
						<label for="age">Age</label>
						<input type="number" value="<%=rs.getString(5) %>" id="age" name="age" required>
						<button type="submit">Update</button>
					</form>			
					<%
					}

					rs.close();
					pst.close();
					con.close();

					} catch (Exception e) {
					System.out.print(e);

					}
					%>
		
	</div>

</body>
</html>