

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf" %>
<title>Teste banco de dados - T2s</title>
</head>
<body>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement"%>


<% String nome = request.getParameter("nome");
String email = request.getParameter("email"); %>


 
		<% String jdbcURL = "jdbc:postgresql://localhost:5432/postgres";
		String username = "postgres";
		String password = "123456";
		
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			out.println("<h1>Conectado ao banco de dados com sucesso!</h1>"); %>
			
			
			
				<form method="get">
		 <p>Nome:</p> <input type="text" class="form-control" id="nom" name="nome" required>
		 <p> Email </p> <input type="text" class="form-control" id="email" name="email" required>
		 <button type="submit" class="btn btn-primary">Submit</button>
		
		</form>
			
			 <% 
			
			/* SE O VALOR DE NOME FOR DIFERENTE DE NULO, ELE IRÁ GRAVAR OS DADOS NO BD. CASO SEJA NULO, NÃO FARÁ NADA */
		if (nome != null)  {String sql= "INSERT INTO tb_conteiner (nm_cliente, num_conteiner, tip_conteiner, stt_conteiner, cat_conteiner) VALUES (?, ?, ?, ?, ?)";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			
			statement.setString(1, nome);
			statement.setString(2, nome);
			statement.setString(3, nome);
			statement.setString(4, nome);
			statement.setString(5, nome);
			
			
			
			int rows = statement.executeUpdate();
			
			if (rows > 0) {
				out.println(" <br> Dados inseridos no banco de dados!");
			}
			
			connection.close();} 
			
		} catch (SQLException e) {
			out.println("<h2>Erro de conexao ao banco de dados PostgreSQL! Detalhes do erro:</h2> <br>");
			// TODO Auto-generated catch block
			e.printStackTrace(new java.io.PrintWriter(out));
		}		
 
		%>
		
		
		
		
		

			
			
			
			
		
		
		
	
		
		
</body>
</html>