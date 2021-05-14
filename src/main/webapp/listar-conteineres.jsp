

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="WEB-INF/jspf/jQery.jspf"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Listagem de cont�ineres - T2s</title>






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
	
	<h1>Listagem de cont�ineres</h1>
	
	<table id="tabela" class="table table-bordered table-hover text-center" style="width:100%">
	  <thead>
            <tr>
               		<th>id</th>
					<th>Cliente</th>
					<th>Numero do conteiner</th>
					<th>Tipo</th>
					<th>Status</th>
					<th>Categoria</th>
					<th>A��es</th>
					
					   </thead>
					
					<%
				Connection connection = DriverManager.getConnection(jdbcURL, username, password);

				String sql = "SELECT * FROM tb_conteiner ORDER BY id_conteiner ASC";

				Statement statement = connection.createStatement();

				ResultSet result = statement.executeQuery(sql);

				while (result.next()) {
					String idTable = result.getString("id_conteiner");
					String clienteTable = result.getString("nm_cliente");
					String conteinerTable = result.getString("num_conteiner");
					String tipoTable = result.getString("tip_conteiner");
					String statusTable = result.getString("stt_conteiner");
					String categoriaTable = result.getString("cat_conteiner");
					
					
					
					%>
				
				
					<tr>
						
					
						<td><%=idTable%></td>
						<td><%=clienteTable.toUpperCase()%></td>
						<td><%=conteinerTable.toUpperCase()%></td>
						<td><%=tipoTable.toUpperCase()%></td>
						<td><%=statusTable.toUpperCase()%></td>
						<td><%=categoriaTable.toUpperCase()%></td>
						
						
						
						
						
						
						
						
						
						<td><form action="editar-conteiner.jsp" method="post">
								<button type="submit" value="<%=idTable%>" name="idValue"
									class="btn btn-info">Editar</button> </form>
									
									<form method="post">
								<button type="submit" value="<%=idTable%>" name="botaoDelete"
									class="mt-2 btn btn-danger">Deletar</button>
							</form>				</td>
						
							<%
					
				connection.close(); }
				%>
					
					
				
					
					
            </tr>
        
        <tbody>
         
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
		<a href="./listar-conteineres.jsp"> <%
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