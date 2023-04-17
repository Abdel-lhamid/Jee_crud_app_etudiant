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
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="styles.css">

<title>Home page</title>
</head>
<body>
	<div class="dashboard-container">
		<div class="header">
			<h2>
				Welcome,
				<%=login%></h2>
			<a class="logout-button" href="Logout">Logout</a>
		</div>
		<div class="student-table">
			<a class="add-button" href="ajouter.jsp">Add Student</a>
			<table>
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Date Inscription</th>
						<th>Filliere</th>
						<th>Age</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
					String url = "jdbc:mysql://localhost:3306/jee_etudiant";
					String user = "root";
					String dbpass = "";
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection(url, user, dbpass);
						PreparedStatement pst = con.prepareStatement("SELECT * FROM students");
						ResultSet rs = pst.executeQuery();

						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><a class="add-button" href="update.jsp?id=<%=rs.getString(1) %>">Update</a></td>
						<td><a class="delete-button" href="Delete?id=<%=rs.getString(1) %>">Delete</a></td>
					</tr>

					<%
					}

					rs.close();
					pst.close();
					con.close();

					} catch (Exception e) {
					System.out.print(e);

					}
					%>

					<!-- more rows can be added dynamically using JavaScript -->
				</tbody>
			</table>

		</div>

	</div>

</body>
</html>