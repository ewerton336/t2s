

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<title>Listagem de Contêineres - T2s</title>
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

	<div class="container-fluid">
		<%
		String cliente = request.getParameter("cliente");
		String conteiner = request.getParameter("num_conteiner");
		String tipo = request.getParameter("tipo");
		String status = request.getParameter("status");
		String categoria = request.getParameter("categoria");
		String botaoDel = request.getParameter("botaoDelete");
		int botaoDel2;
		if (botaoDel != null) {
			botaoDel2 = (Integer.parseInt(request.getParameter("botaoDelete")));
		}
		%>

		<%
		if (session.getAttribute("session.username") == null) {
		%>
		<h1>Você não está autorizado a visualizar esta página!</h1>
		<%
		} else {
		%>



		<h1>Lista de Contêineres</h1>
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
					<td><%=nomeTable%></td>
					<td><%=conteinerTable%></td>
					<td><%=tipoTable%></td>
					<td><%=statusTable%></td>
					<td><%=categoriaTable%></td>
					<form action="editar-conteiner.jsp" method="get">
						<td>
							<button type="submit" value="<%=idTable%>" name="idValue"
								class="btn btn-info">Editar</button>
					</form>
					</td>
					<form method="post">
						<td><button type="submit" value="<%=idTable%>"
								name="botaoDelete" class="btn btn-danger">Deletar</button>
					</form>
					</td>


				</tr>
			</tbody>

			<%
			}
			connection.close();
			%>


			<%
			if (botaoDel != null) { try {
				

					connection = DriverManager.getConnection(jdbcURL, username, password);

					String sql2 = "DELETE FROM tb_conteiner WHERE id_conteiner = " + botaoDel + "";

					PreparedStatement statement2 = connection.prepareStatement(sql2);

					statement2.executeUpdate();
					
					
			%>
			<div class="alert alert-success" role="alert">

<p> <a href="./listar-conteineres.jsp">
				<%
				out.println("Container removido. Clique aqui para atualizar");
				%>
</p></a>

			</div>
			<%
			connection.close();
			}
			

			catch (SQLException e) {
			out.println("Erro de conexao ao banco de dados PostgreSQL");
			// TODO Auto-generated catch block
			e.printStackTrace(new java.io.PrintWriter(out));
			}

			} }
			%>
		</table>
	</div>
</body>
</html>