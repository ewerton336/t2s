

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="WEB-INF/jspf/jQery.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Listagem de movimentação - T2s</title>






</head>
<body>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@ page import="java.sql.Connection"%>
	<%@ page import="java.sql.DriverManager"%>
	<%@ page import="java.sql.SQLException"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%@page import="java.sql.ResultSet"%>
	<%@include file="WEB-INF/jspf/session.jspf"%>
	<%@include file="WEB-INF/jspf/jdbcURL.jspf"%>
	
	
	<%String botaoDel = request.getParameter("botaoDelete"); %>
	
	<div class="container-fluid mt-2">
	
	<a href="javascript:close_window();">Fechar</a>
	
	<h1>Listagem de movimentação de contêineres</h1>
	
	<table id="tabela" class="table table-bordered table-hover text-center" style="width:100%">
	  <thead>
            <tr>
               		<th>Cliente</th>
					<th>Operação</th>
					<th>Gate</th>
					<th>Posicionamento</th>
					<th>Pilha</th>
					<th>Peso (toneladas)</th>
					<th>Scanner</th>
					<th>Data Início</th>
					<th>Hora Inicio</th>
					<th>Data Fim</th>
					<th>Hora fim</th>
					<th>Conteiner</th>
					
					<th>Ações</th>
					
					   </thead>
					
					<%
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);

				String sql = "SELECT * FROM tb_movimentacao ORDER BY id_movimentacao ASC, carga_descarga ASC  ";

				Statement statement = connection.createStatement();

				ResultSet result = statement.executeQuery(sql);

				while (result.next()) {
					String idTable = result.getString("id_movimentacao");
					String carga = result.getString("carga_descarga");
					String gate = result.getString("gatein_gateout");
					String pos = result.getString("posicionamento");
					String pilha = result.getString("pilha");
					String peso = result.getString("peso");
					String scanner = result.getString("scanner");
					String dt_inicio = result.getString("data_inicio");
					String hr_inicio = result.getString("hora_inicio");
					String dt_fim = result.getString("data_fim");
					String hr_fim = result.getString("hora_fim");
					String idTbConteiner = result.getString("id_tbconteiner");
					
					
					String sql4 = "SELECT nm_cliente, num_conteiner FROM tb_conteiner WHERE id_conteiner =" + idTbConteiner;

					Statement statement4 = connection.createStatement();

					ResultSet result4 = statement4.executeQuery(sql4);

					while (result4.next()) {
						String clienteDB = result4.getString("nm_cliente");
						String nmConteinerVinculado = result4.getString("num_conteiner");
					
					
					
				%>
			
			
				<tr>
					<td><%=clienteDB %></td>
				
					<td><%=carga%></td>
					<td><%=gate%></td>
					<td><%=pos%></td>
					<td><%=pilha%></td>
					<td><%=peso%></td>
					<td><%=scanner%></td>
					<td><%=dt_inicio%></td>
					<td><%=hr_inicio%></td>
					<td><%=dt_fim%></td>
					<td><%=hr_fim%></td>
					<td><%=nmConteinerVinculado.toUpperCase()%></td>
					
					
					
					
					
					
					
					
					<td><form action="editar-movimentacao.jsp" method="post">
							<button type="submit" value="<%=idTable%>" name="idValue"
								class="btn btn-info">Editar</button> </form>
								
								<form method="post">
							<button type="submit" value="<%=idTable%>" name="botaoDelete"
								class="mt-2 btn btn-danger">Deletar</button>
						</form>				</td>
					
						<%
				} }
			connection.close();
			%>
					
					
            </tr>
        
        <tbody>
         
           <%

if (botaoDel != null) {
	try {

		connection = DriverManager.getConnection(jdbcURL, username, password);

		String sql3 = "DELETE FROM tb_movimentacao WHERE id_movimentacao = " + botaoDel + "";

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
		
	
	%>
           
           
        </tbody>
        
       
    </table>
	


	



	
	
	
	

	
	
</div>	
</body>

<script>
function close_window() {
	  
	    close();
	  
	}
</script>
</html>