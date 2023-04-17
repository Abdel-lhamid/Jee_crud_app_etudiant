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

@WebServlet("/Ajouter")
public class Ajouter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("login") != null) {
			String name = request.getParameter("name");
			String date = request.getParameter("date");
			String filliere = request.getParameter("filliere");
			String age = request.getParameter("age");

			String url = "jdbc:mysql://localhost:3306/jee_etudiant";
			String user = "root";
			String dbpass = "";
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, user, dbpass);
				PreparedStatement pst = con.prepareStatement("INSERT INTO students (nom, date_ins,filliere,age) VALUES (?,?,?,?)");
				pst.setString(1, name);
				pst.setString(2, date);
				pst.setString(3, filliere);
				pst.setString(4, age);
				
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
