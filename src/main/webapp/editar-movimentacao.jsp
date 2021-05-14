<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<title>Edição de Movimentação - T2s</title>
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

	<%String id = request.getParameter("idValue");
	int id2 = 0;
	if (id != null) {
		id2 = (Integer.parseInt(request.getParameter("idValue")));};
		
		
//		PARAMETROS PARA PEGAR DOS INPUTS DE USUARIO
	String idTable = request.getParameter("idValue");
	String carga = request.getParameter("cargaInput");
	String gate = request.getParameter("gateInput");
	String posicion = request.getParameter("posicionInput");
	String pilha = request.getParameter("pilhaInput");
	String peso = request.getParameter("pesoInput");
	String scanner = request.getParameter("scannerInput");
	String dataInicio = request.getParameter("dataInicioInput");
	String horaInicio = request.getParameter("horaInicioInput");
	String dataFim = request.getParameter("dataFimInput");
	String horaFim = request.getParameter("horaFimInput");
	String numeroConteiner = request.getParameter("vinculoIdInput");
		
		
	
	%>
	
	
	<div class="container-fluid mt-2">
	<div class="row">
	 <div class="col">
	
		<%if (id!= null) {
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);

		String sql = "Select * FROM tb_movimentacao WHERE id_movimentacao='" + id2 + "'";

				Statement statement = connection.createStatement();

				ResultSet result = statement.executeQuery(sql);

				
				while (result.next()) {
					String idTableDB = result.getString("id_movimentacao");
					String cargaDB = result.getString("carga_descarga");
					String gateDB = result.getString("gatein_gateout");
					String posicionamentoDB = result.getString("posicionamento");
					String pilhaDB = result.getString("pilha");
					String pesoDB = result.getString("peso");
					String scanDB = result.getString("scanner");
					String dt_inicioDB = result.getString("data_inicio");
					String hr_inicioDB = result.getString("hora_inicio");
					String dt_fimDB = result.getString("data_fim");
					String hr_fimDB = result.getString("hora_fim");
					String numContainerDB = result.getString("id_tbconteiner");
					
					
					%>   
					
						<form method="post">
						<h4>ID:</h4>
			<input type="text" class="form-control" id="nom" name="idValue"
				 value="<%=idTableDB%>" readonly> 
				 
		<h4>Conteiner:</h4>
		<%
					
					String sql2 = "SELECT num_conteiner FROM tb_conteiner WHERE id_conteiner =" + numContainerDB;

					Statement statement2 = connection.createStatement();

					ResultSet result2 = statement2.executeQuery(sql2);

					while (result2.next()) {
						String numConteiner = result2.getString("num_conteiner"); 
					
					%>
		
			<input type="text" class="form-control" id="nom" name="vinculoIdInput"
				 value="<%=numConteiner%>" readonly> <%} %>

		
			
		
		
		<h4>Tipo de Operação:</h4>
			<select name="cargaInput" class="custom-select">
				<option selected><%=cargaDB %></option>
				<option value="carga">Carga</option>
				<option value="descarga">Descarga</option>
			</select> <br>
			
			
			<h4>Gate:</h4>
			<select name="gateInput" class="custom-select">
				<option selected><%=gateDB %>o</option>
				<option value="Gate In">Gate In</option>
				<option value="Gate Out">Gate Out</option>
			</select> <br>
			
			
		
			<h4>Posicionamento:</h4>
			<input type="text" class="form-control" name="posicionInput" value="<%=posicionamentoDB %>"
				required> 
				
				<h4>Pilha:</h4>
			<input type="text" class="form-control" name="pilhaInput" value="<%=pilhaDB %>"
				required> 
				
				
			</div>
		<div class="col">
				
				<h4>Peso:</h4>
			<input type="number" class="form-control" name="pesoInput" value="<%=pesoDB %>"
				required> 
				
			<h4>Scanner:</h4>
			<input type="text" class="form-control" value="<%=scanDB %>"
				name="scannerInput" required> <br> 
 
 
 <div class="row">
			 <div class="col">
			 
			 
				  <h4>Data Inicio:</h4>
			<input type="date" class="form-control" value="<%=dt_inicioDB %>"
				name="dataInicioInput" required> <br> 
				
					 
			  <h4>Data Fim:</h4>
			<input type="date" class="form-control" value="<%=dt_fimDB %>"
				name="dataFimInput" required> <br>  
			  
			  
			  
			  
			  </div>
			  
			  
			  <div class="col">
			  
			  
			    <h4>Hora Início:</h4>
			<input type="time" class="form-control" value="<%=hr_inicioDB %>"
				name="horaInicioInput" required> <br>  
				
					 
			  <h4>Hora Fim:</h4>
			<input type="time" class="form-control" value="<%=hr_fimDB%>"
				name="horaFimInput" required> <br>  
			  
			   
			 
			    </div> </div>


		<button type="submit" name="salvar" value="isClicked" class="float-right btn btn-outline-primary">Salvar
				edições</button>
		</form>
		<a href="./listar-movimentacao.jsp">
			<button type="button" class="btn btn-outline-info">Voltar</button></a> <br> <br> <br>
		
					
					
					
					
					
					<%
					connection.close(); }}
				
				%>
				
				<% if (gate != null) {
Connection connection = DriverManager.getConnection(jdbcURL, username, password);


String sql3= "UPDATE tb_movimentacao SET carga_descarga = ?, gatein_gateout = ?, posicionamento = ?, pilha = ?, peso = ?, scanner = ?, data_inicio = ?, hora_inicio = ?, data_fim = ?, hora_fim = ?  WHERE id_movimentacao ='" + idTable +  "'";

PreparedStatement statement = connection.prepareStatement(sql3);

statement.setString(1, carga);
statement.setString(2, gate);
statement.setString(3, posicion);
statement.setString(4, pilha);
statement.setString(5, peso);
statement.setString(6, scanner);
statement.setString(7, dataInicio);
statement.setString(8, horaInicio);
statement.setString(9, dataFim);
statement.setString(10, horaFim);



int rows = statement.executeUpdate();

if (rows > 0) {
	%>
	<div class="alert alert-success" role="alert">

				<p>
					 <a href="./listar-movimentacao.jsp"> <%
 out.println("Container atualizado. Clique aqui para voltar.");
 %>
				</p>
				</a>

			</div>
	<% 
}

connection.close(); }%> 
				
				
				
				
				
				
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		</div>
</body>
</html>