package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jdk.jfr.StackTrace;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class teste
 */
@WebServlet("/teste")
public class teste extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public teste() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	



		  
				String jdbcURL = "jdbc:postgresql://localhost:5432/postgres";
				String username = "postgres";
				String password = "123456";
				
				try {
					Connection connection = DriverManager.getConnection(jdbcURL, username, password);
					 try ( PrintWriter out = response.getWriter()) {
						 out.println("<h1>Conectado com sucesso!</h1>");}
					
					connection.close();
					
				} catch (SQLException e) {
					 try ( PrintWriter out = response.getWriter()) {
					out.println("Erro de conexao ao banco de dados PostgreSQL");
					// TODO Auto-generated catch block
					
					e.printStackTrace(); }
				}		
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
