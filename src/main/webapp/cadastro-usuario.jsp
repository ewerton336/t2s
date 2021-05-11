<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T2S - Cadastro</title>
</head>



<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="WEB-INF/jspf/session.jspf"%>

<% String nome = request.getParameter("nome");
String email = request.getParameter("email");
String senha = request.getParameter("senha");
%>

<% 
		 String jdbcURL = "jdbc:postgresql://localhost:5432/postgres"; 
		 /*String jdbcURL = "jdbc:postgresql://10.0.0.5:5432/postgres"; */
		String username = "postgres";
		String password = "123456"; %>

<div class="alert alert-success" role="alert">
	<% try {
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			out.println("Conectado com sucesso ao banco de dados."); %>
</div>

<body>
	<div class="container-fluid">
		<form method="post">
			<div class="form-group">
				<label for="cliente">Nome completo:</label> <input type="text"
					class="form-control" id="nome" name="nome" required> <br>
				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="pwd">Senha:</label> <input type="password"
					class="form-control" id="senha" name="senha" required>
			</div>

			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form>
	</div>



	<% if (nome != null) {
			String sql= "INSERT INTO tb_usuario (nome_usuario, email_usuario, senha_usuario) VALUES (?, ?, ?)";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			
			statement.setString(1, nome);
			statement.setString(2, email);
			statement.setString(3, senha);
			
			
int rows = statement.executeUpdate(); %>

	<br>
	<div class="alert alert-success" role="alert">
		<% 
			if (rows > 0) {
				out.println(" Dados salvos com Sucesso!");
			}
			%>
	</div>

	<%
			connection.close();} 
				} catch (SQLException e) {
					out.println("<h2>Erro de conexao ao banco de dados PostgreSQL! Detalhes do erro:</h2> <br>");
					
					e.printStackTrace(new java.io.PrintWriter(out));
				}		
			%>







</body>
</html>