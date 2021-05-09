<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

<%
String emailinput = request.getParameter("email");
String senhainput = request.getParameter("senha");
%>

<%
/* conexão com o banco de dados */
String jdbcURL = "jdbc:postgresql://localhost:5432/postgres";
/*String jdbcURL = "jdbc:postgresql://10.0.0.5:5432/postgres"; */
String username = "postgres";
String password = "123456";
%>

<div class="alert alert-success" role="alert">
	<%
	try {
		Connection connection = DriverManager.getConnection(jdbcURL, username, password);
		out.println("Conectado com sucesso ao banco de dados.");

		connection.close();
	%>
</div>

<body>
	<div class="container-fluid">
		<form method="post">
			<div class="form-group">

				<label for="email">Email:</label> <input type="email"
					class="form-control" id="email" name="email" required>
			</div>
			<div class="form-group">
				<label for="pwd">Senha:</label> <input type="password"
					class="form-control" id="senha" name="senha" required>
			</div>

			<button type="submit" class="btn btn-primary">Login</button>
			<a href="cadastro-usuario.jsp" class="btn btn-primary">Criar
				conta</a>
		</form>


		<br>

		<%
		} catch (SQLException e) {
		out.println("<h2>Erro de conexao ao banco de dados PostgreSQL! Detalhes do erro:</h2> <br>");

		e.printStackTrace(new java.io.PrintWriter(out));
		}
		%>




		<%
		/* AUTENTICACAO COM O BANCO D EDADOS */

		try {

			Connection connection = DriverManager.getConnection(jdbcURL, username, password);

			String sql = "Select email_usuario,senha_usuario  from tb_usuario WHERE email_usuario='" + emailinput + "'";

			Statement statement = connection.createStatement();
			;

			ResultSet result = statement.executeQuery(sql);
		%>
		<%
		while (result.next()) {
			String db_email_usuario = result.getString("email_usuario");
			String db_senha_usuario = result.getString("senha_usuario");

			if (senhainput.equals(db_senha_usuario)) {
		%>
		<div class="alert alert-success" role="alert">
			<%
			out.println("Logado com sucesso!");
			}

			else {
			%>
			<div class="alert alert-danger">
				<%
				out.println("usuário ou senha incorreta");
				}
				%>
			</div>
			<%
			connection.close();

			}
			} catch (SQLException e) {
			out.println("Erro de conexao ao banco de dados PostgreSQL");
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			%>
		</div>





	</div>
</body>
</html>