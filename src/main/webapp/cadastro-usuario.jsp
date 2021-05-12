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
<%@include file="WEB-INF/jspf/jdbcURL.jspf"%>

<% String nome = request.getParameter("nome");
String email = request.getParameter("email");
String senha = request.getParameter("senha");
%>
<body>

<div class="alert alert-success" role="alert">
	<% try {
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			out.println("Conectado com sucesso ao banco de dados."); %>
</div>


<div class="row justify-content-center">
	<aside class="col-sm-4">
<p>Cadastro de usuário</p>
<div class="card">
<article class="card-body">
<a href="login.jsp" class="float-right btn btn-outline-primary">Login</a>
<h4 class="card-title mb-4 mt-1">Cadastro</h4>
	 <form method="get">
	 <div class="form-group">
    	<label>Nome completo:</label>
        <input name="nome" id="nome" class="form-control" placeholder="Nome" type="text">
    </div> 
	 
    <div class="form-group">
    	<label>Email:</label>
        <input name="email" id="email" class="form-control" placeholder="Email" type="email">
    </div> 
    <div class="form-group">
    	<label>Senha:</label>
        <input class="form-control" placeholder="******" type="password" id="senha" name="senha">
    </div> 
    <div class="form-group"> 
   
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Cadastrar  </button>
    </div>                                                         
</form>
</article>
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
				out.println(" Dados salvos com Sucesso! Você já pode se logar.");
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