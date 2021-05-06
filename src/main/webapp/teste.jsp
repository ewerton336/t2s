

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>




 
		<% String jdbcURL = "jdbc:postgresql://10.0.0.5:5432/postgres";
		String username = "postgres";
		String password = "123456";
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			out.println("Conectado com sucesso!");
			
			connection.close();
			
		} catch (SQLException e) {
			out.println("Erro de conexao ao banco de dados PostgreSQL");
			// TODO Auto-generated catch block
			e.printStackTrace(new java.io.PrintWriter(out));
		}		
 
		%>
</body>
</html>