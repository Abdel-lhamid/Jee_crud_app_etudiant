package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		
		String url = "jdbc:mysql://localhost:3306/jee_etudiant";
		String user ="root";
		String dbpass="";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,user,dbpass) ;
			PreparedStatement pst = con.prepareStatement("SELECT id FROM users WHERE login=? AND password=?");
			pst.setString(1, login);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			
			if (rs.next()) {
				session.setAttribute("login", login);
				response.sendRedirect("index.jsp");
				}else response.sendRedirect("auth.jsp");
			
			rs.close();
			pst.close();
			con.close();
			
			
		} catch (Exception e) {
			System.out.print(e);

		}
		
	}

}
