package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			String id = request.getParameter("id");

			String url = "jdbc:mysql://localhost:3306/jee_etudiant";
			String user = "root";
			String dbpass = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, dbpass);
				PreparedStatement pst = con.prepareStatement("DELETE FROM students WHERE id=?");
				pst.setString(1, id);
				
				pst.executeUpdate();
				response.sendRedirect("index.jsp");
				

				pst.close();
				con.close();

			} catch (Exception e) {
				System.out.print(e);

			}

		}


	}

	

}
