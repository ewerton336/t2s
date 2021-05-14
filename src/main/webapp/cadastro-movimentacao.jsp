

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<title>Teste banco de dados - T2s</title>
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
	
<form method="get">
		<h4>Conteiner a vincular:</h4>
			<select name="vinculoIdInput" class="custom-select">
				<option selected>Selecione uma opção</option>
		
			<%
			try {
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			%>
			
			
			<%
				Connection connection2 = DriverManager.getConnection(jdbcURL, username, password);

				String sql2 = "SELECT id_conteiner, num_conteiner FROM tb_conteiner";

				Statement statement2 = connection.createStatement();

				ResultSet result = statement2.executeQuery(sql2);

				while (result.next()) {
					String idTable = result.getString("id_conteiner");
					String conteinerTable = result.getString("num_conteiner");
				
				%>
			
			
			<option value="<%=idTable%>"><%=conteinerTable%></option>
	
					
					<%} %>
			
		


		
		
			
			</select> <br>
			
		

		
			
		
		
		<h4>Tipo de Operação:</h4>
			<select name="cargaInput" class="custom-select">
				<option selected>Selecione uma opção</option>
				<option value="carga">Carga</option>
				<option value="descarga">Descarga</option>
			</select> <br>
			
			
			<h4>Gate:</h4>
			<select name="gateInput" class="custom-select">
				<option selected>Selecione uma opção</option>
				<option value="Gate In">Gate In</option>
				<option value="Gate Out">Gate Out</option>
			</select> <br>
			
			
		
			<h4>Posicionamento:</h4>
			<input type="text" class="form-control" name="posicionInput"
				required> 
				
				<h4>Pilha:</h4>
			<input type="text" class="form-control" name="pilhaInput"
				required> 
				
				
			</div>
		<div class="col">
				
				<h4>Peso:</h4>
			<input type="number" class="form-control" name="pesoInput"
				required> 
				
			<h4>Scanner:</h4>
			<input type="text" class="form-control"
				name="scannerInput" required> <br> 
 
 
 <div class="row">
			 <div class="col">
			 
			 
				  <h4>Data Inicio:</h4>
			<input type="date" class="form-control"
				name="dataInicioInput" required> <br> 
				
					 
			  <h4>Data Fim:</h4>
			<input type="date" class="form-control"
				name="dataFimInput" required> <br>  
			  
			  
			  
			  
			  </div>
			  
			  
			  <div class="col">
			  
			  
			    <h4>Hora Início:</h4>
			<input type="time" class="form-control"
				name="horaInicioInput" required> <br>  
				
					 
			  <h4>Hora Fim:</h4>
			<input type="time" class="form-control"
				name="horaFimInput" required> <br>  
			  
			   
			   
			    </div> </div>


			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form>
		<br> <br> 
		<%
		/* SE O VALOR DE NOME TENHA ALGUMA INFORMAÇÃO, ELE IRÁ GRAVAR OS DADOS NO BD. CASO SEJA NULO, NÃO FARÁ NADA */

		if (carga != null) {
			String sql = "INSERT INTO tb_movimentacao (carga_descarga, gatein_gateout, posicionamento, pilha, peso, scanner, data_inicio, hora_inicio, data_fim, hora_fim, id_tbconteiner) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement statement = connection.prepareStatement(sql);

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
			statement.setString(11, numeroConteiner);

			int rows = statement.executeUpdate();
		%>

		<br>
		<div class="alert alert-success" role="alert">
			<%
			if (rows > 0) {
				out.println("<h5>Dados salvos com Sucesso! </h5>");
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
		
		
		</div>
		

	</div>
</body>
</html>