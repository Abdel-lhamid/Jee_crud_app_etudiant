<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="styles.css">

<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div class="login-container">
		<h2>Login</h2>
		<form action="Login" method="POST">
			<div class="form-group">
				<label for="username">Username</label> 
				<input type="text" id="username" name="login" required>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
				<input type="password" id="password" name="password" required>
			</div>
			<button type="submit">Login</button>	
		</form>
	</div>

</body>
</html>