

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

	<div class="container-fluid mt-2">
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

				String sql = "SELECT * FROM tb_movimentacao ORDER BY id_movimentacao ASC ";

				Statement statement = connection.createStatement();

				ResultSet result = statement.executeQuery(sql);

				while (result.next()) {
					String idTable = result.getString("id_movimentacao");
					String carga = result.getString("carga_descarga");
					String gate = result.getString("gatein_gateout");
					String pos = result.getString("posicionamento");
					String pilha = result.getString("pilha");
					String peso = result.getString("gatein_gateout");
					String scanner = result.getString("scanner");
					String dt_inicio = result.getString("data_inicio");
					String hr_inicio = result.getString("hora_inicio");
					String dt_fim = result.getString("data_fim");
					String hr_fim = result.getString("hora_fim");
					String numeroConteiner = result.getString("numero_conteiner");
					
					
				%>
			
			<tbody>
				<tr>
					<td><%=idTable%></td>
					<td><%=carga%></td>
					<td><%=gate%></td>
					<td><%=pos%></td>
					<td><%=pilha%></td>
					<td><%=peso%></td>
					
					<td><%=dt_inicio%></td>
					<td><%=hr_inicio%></td>
					<td><%=hr_inicio%></td>
					<td><%=dt_fim%></td>
					<td><%=hr_fim%></td>
					<td><%=numeroConteiner%></td>
					
					
					
				
					
					
					

					<td><form action="editar-movimentacao.jsp" method="get">
							<button type="submit" value="<%=idTable%>" name="idValue"
								class="btn btn-info">Editar</button>
						</form></td>



					<td><form method="post">
							<button type="submit" value="<%=idTable%>" name="botaoDelete"
								class="btn btn-danger">Deletar</button>
						</form></td>

				</tr>
			</tbody>

			<%
				}
			connection.close();
			%>


			<%
			if (botaoDel != null) {
				try {

					connection = DriverManager.getConnection(jdbcURL, username, password);

					String sql3 = "DELETE FROM tb_conteiner WHERE id_conteiner = " + botaoDel + "";

					PreparedStatement statement3 = connection.prepareStatement(sql3);

					statement3.executeUpdate();
			%>
			<div class="alert alert-success" role="alert">

				<p>
					<a href="./listar-movimentacao.jsp"> <%
 out.println("Container removido. Clique aqui para atualizar");
 %>
				</p>
				</a>

			</div>
			<%
			connection.close();
			}

			catch (SQLException e) {
			out.println("Erro de conexao ao banco de dados PostgreSQL");
			// TODO Auto-generated catch block
			e.printStackTrace(new java.io.PrintWriter(out));
			}

			}
			}
			%>
		</table>
	</div>
</body>
</html>