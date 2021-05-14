

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<title>Cadastro de Cont�iner - T2S</title>
</head>
<body>


	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.ResultSet"%>
	<%@include file="WEB-INF/jspf/session.jspf"%>
	<%@include file="WEB-INF/jspf/jdbcURL.jspf"%>

	<%
	String cliente = request.getParameter("cliente");
	String conteiner = request.getParameter("num_conteiner");
	String tipo = request.getParameter("tipo");
	String status = request.getParameter("status");
	String categoria = request.getParameter("categoria");
	%>

<div class="container-fluid mt-2">

	<%
		if (session.getAttribute("session.username") == null) {
		%>
		<h1>Voc� n�o est� autorizado a visualizar esta p�gina!</h1>
		<%
		} else {
		%>

	
			<%
			try {
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			%>
		


		<h3> Cadastro de Cont�iner</h3> <br>
		<form method="post">
			<h4>Cliente:</h4>
			<input type="text" class="form-control" id="nom" name="cliente" placeholder= "Nome do cliente"
				required> <br>
			<h4>N�mero do cont�iner:</h4>
			<input type="text" class="form-control" pattern="[a-zA-Z]{4}[0-9]{7}" placeholder="4 letras e 7 n�meros EX: ABCD1234567"
				name="num_conteiner" required> <br>

			<h4>Tipo de Cont�iner:</h4>
			<select name="tipo" class="custom-select" required>
				 <option disabled value="" selected hidden>Selecione uma op��o</option>
				<option value="20">20</option>
				<option value="40">40</option>
			</select> <br>

			<h4>Status:</h4>
			<select name="status" class="custom-select" required>
				<option disabled value="" selected hidden>Selecione uma op��o</option>
				<option value="Cheio">Cheio</option>
				<option value="Vazio">Vazio</option>
			</select>

			<h4>Categoria:</h4>
			<select name="categoria" class="custom-select" required>
				<option disabled value="" selected hidden>Selecione uma op��o</option>
				<option value="Importacao">Importa��o</option>
				<option value="Exportacao">Exportacao</option>
			</select> <br> <br>


			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form>
		<br> <br>
		<%
		/* SE O VALOR DE NOME TENHA ALGUMA INFORMA��O, ELE IR� GRAVAR OS DADOS NO BD. CASO SEJA NULO, N�O FAR� NADA */

		if (cliente != null) {
			String sql = "INSERT INTO tb_conteiner (nm_cliente, num_conteiner, tip_conteiner, stt_conteiner, cat_conteiner) VALUES (?, ?, ?, ?, ?)";

			PreparedStatement statement = connection.prepareStatement(sql);

			statement.setString(1, cliente);
			statement.setString(2, conteiner);
			statement.setString(3, tipo);
			statement.setString(4, status);
			statement.setString(5, categoria);

			int rows = statement.executeUpdate();
		%>

		<br>
		<div class="alert alert-success" role="alert">
			<%
			if (rows > 0) {
				out.println("<h5>Conteiner cadastrado com Sucesso! </h5>");
			}
			%>
		</div>

		<%
		connection.close();
		}
		} catch (SQLException e) {
		out.println("<h2>Erro de conexao ao banco de dados PostgreSQL! Detalhes do erro:</h2> <br>");

		e.printStackTrace(new java.io.PrintWriter(out));
		}
		%>
		<br> <br>







		<h1>Lista de Cont�ineres</h1>





		<table class="table table-hover">
			<thead>
				<tr>
					<th>id</th>
					<th>Cliente</th>
					<th>Numero do conteiner</th>
					<th>Tipo</th>
					<th>Status</th>
					<th>Categoria</th>
				</tr>

				<%
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);

				String sql = "SELECT * FROM tb_conteiner";

				Statement statement = connection.createStatement();

				ResultSet result = statement.executeQuery(sql);

				while (result.next()) {
					int idTable = result.getInt("id_conteiner");
					String nomeTable = result.getString("nm_cliente");
					String conteinerTable = result.getString("num_conteiner");
					String tipoTable = result.getString("tip_conteiner");
					String statusTable = result.getString("stt_conteiner");
					String categoriaTable = result.getString("cat_conteiner");
				%>
			
			<tbody>
				<tr>
					<td><%=idTable%></td>
					<td><%=nomeTable.toUpperCase()%></td>
					<td><%=conteinerTable.toUpperCase()%></td>
					<td><%=tipoTable%></td>
					<td><%=statusTable%></td>
					<td><%=categoriaTable%></td>

				</tr>
			</tbody>

			<%
			}
			connection.close();
			%>

		</table>














<%} %>



	</div>











</body>
</html>