

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<title>Edição de Contêiner - T2s</title>
</head>
<body>
<%
		if (session.getAttribute("session.username") == null) {
		%>
		<h1>Você não está autorizado a visualizar esta página!</h1>
		<%
		} else {
		%> 
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.ResultSet"%>
	<%@include file="WEB-INF/jspf/session.jspf"%>
	<%@include file="WEB-INF/jspf/jdbcURL.jspf"%>

	<%
	String id = request.getParameter("idValue");
	int id2 = 0;
	if (id != null) {
		id2 = (Integer.parseInt(request.getParameter("idValue")));
		
	};
	
	
	String cliente = request.getParameter("cliente");
	String conteiner = request.getParameter("num_conteiner");
	String tipo = request.getParameter("tipo");
	String status = request.getParameter("status");
	String categoria = request.getParameter("categoria");
	%>


	<div class="container-fluid col-sm-4 mt-2">


		<%if (id!= null) { Connection connection = DriverManager.getConnection(jdbcURL, username, password);

		String sql = "Select id_conteiner, nm_cliente, num_conteiner, tip_conteiner, stt_conteiner, cat_conteiner  from tb_conteiner WHERE id_conteiner='" + id + "'";

				Statement statement = connection.createStatement();

				ResultSet result = statement.executeQuery(sql);

				
				while (result.next()) {
					String idTable = result.getString("id_conteiner");
					String nomeTable = result.getString("nm_cliente");
					String conteinerTable = result.getString("num_conteiner");
					String tipoTable = result.getString("tip_conteiner");
					String statusTable = result.getString("stt_conteiner");
					String categoriaTable = result.getString("cat_conteiner");
					
					
					
					
				
				%>
		<form action="editar-conteiner.jsp" method="post">
	<h5>Id:</h5>
			<input type="text" class="form-control" id="nom" name="idValue"
				 value="<%=id2%>" readonly> <br>
			
			<h5>Cliente:</h5>
			<input type="text" class="form-control" id="nom" name="cliente"
				 value="<%=nomeTable%>" required> <br>
			<h5>Número do contêiner:</h5>
			<input type="text" class="form-control" id="email"
				name="num_conteiner" value="<%=conteinerTable %>" required>
			<br>

			<h5>Tipo de Contêiner:</h5>
			<select name="tipo" class="custom-select">
				<option selected><%=tipoTable %></option>
				<option value="20">20</option>
				<option value="40">40</option>
			</select><br> 

			<h5>Status:</h5>
			<select name="status" class="custom-select">
				<option selected><%=statusTable %></option>
				<option value="cheio">Cheio</option>
				<option value="vazio">Vazio</option>
			</select> <br> 

			<h5>Categoria:</h5>
			<select name="categoria" class="custom-select">
				<option selected><%=categoriaTable %></option>
				<option value="importacao">Importação</option>
				<option value="exportacao">Exportacao</option>
			</select> <br> <br>


			<button type="submit" name="salvar" value="isClicked" class="float-right btn btn-outline-primary">Salvar
				edições</button>
		</form>
		<a href="./listar-conteineres.jsp">
			<button type="button" class="btn btn-outline-info">Voltar</button></a> <br> <br> <br>

<%}connection.close ();} %>




<% if (conteiner != null) {
Connection connection = DriverManager.getConnection(jdbcURL, username, password);


String sql2= "UPDATE tb_conteiner SET nm_cliente = ?, num_conteiner = ?, tip_conteiner = ?, stt_conteiner = ?, cat_conteiner = ? WHERE id_conteiner =" + id +  "";

PreparedStatement statement = connection.prepareStatement(sql2);

statement.setString(1, cliente);
statement.setString(2, conteiner);
statement.setString(3, tipo);
statement.setString(4, status);
statement.setString(5, categoria);


int rows = statement.executeUpdate();

if (rows > 0) {
	%>
	<div class="alert alert-success" role="alert">

				<p>
					<a href="javascript:close_window();"> <%
 out.println("Alterações realizadas. Clique aqui para fechar.");
 %>
				</a>
				</p>
				

			</div>
	<% 
}

connection.close(); } }%> 









		




	</div>
</body>

<script>
function close_window() {
	  
	    close();
	  
	}
</script>
</html>