

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<title>Teste banco de dados - T2s</title>
</head>
<body>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@include file="WEB-INF/jspf/session.jspf"%>



	<div class="container-fluid">

		<% 
		 String jdbcURL = "jdbc:postgresql://localhost:5432/postgres"; 
		 /*String jdbcURL = "jdbc:postgresql://10.0.0.5:5432/postgres"; */
		String username = "postgres";
		String password = "123456"; 
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			out.println("<h1>Conectado ao banco de dados com sucesso!</h1>");
			
			connection.close();
			
		} catch (SQLException e) {
			out.println("<h2>Erro de conexao ao banco de dados PostgreSQL! Detalhes do erro:</h2> <br>");
			// TODO Auto-generated catch block
			e.printStackTrace(new java.io.PrintWriter(out));
		}		
 
		%>

	</div>
</body>
</html>