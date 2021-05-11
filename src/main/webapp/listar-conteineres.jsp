

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf" %>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<title>Listagem de Contêineres - T2s</title>
</head>
<body>


<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement"%>
<%@page import ="java.sql.ResultSet"%>
<%@include file="WEB-INF/jspf/session.jspf"%>

<div class="container-fluid">
<% String cliente = request.getParameter("cliente");
String conteiner = request.getParameter("num_conteiner");
String tipo = request.getParameter("tipo");
String status = request.getParameter("status");
String categoria = request.getParameter("categoria");
%>

	 <% 
		 String jdbcURL = "jdbc:postgresql://localhost:5432/postgres"; 
		 /*String jdbcURL = "jdbc:postgresql://10.0.0.5:5432/postgres"; */
		String username = "postgres";
		String password = "123456"; %>
		
		<div class="alert alert-success" role="alert">
		 <%try {
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			out.println("<h4>Conexão com o Banco de Dados estabelecida.</h4>"); %> 
			</div>



	<h1> Lista de Contêineres</h1>
			 <% 
			
			/* SE O VALOR DE NOME TENHA ALGUMA INFORMAÇÃO, ELE IRÁ GRAVAR OS DADOS NO BD. CASO SEJA NULO, NÃO FARÁ NADA */
			
		if (cliente != null)  {String sql= "INSERT INTO tb_conteiner (nm_cliente, num_conteiner, tip_conteiner, stt_conteiner, cat_conteiner) VALUES (?, ?, ?, ?, ?)";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			
			statement.setString(1, cliente);
			statement.setString(2, conteiner);
			statement.setString(3, tipo);
			statement.setString(4, status);
			statement.setString(5, categoria);
			
			
			int rows = statement.executeUpdate(); %>
			
			
			<div class="alert alert-success" role="alert">
			<% 
			if (rows > 0) {
				out.println(" <br> <h4>Dados salvos com Sucesso! </h4>");
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
					
					Statement statement =connection.createStatement();
					
					ResultSet result = statement.executeQuery(sql);
					
					
					while (result.next()) {
						int idTable = result.getInt("id_conteiner");
						String nomeTable = result.getString("nm_cliente");
						String conteinerTable = result.getString("num_conteiner");
						String tipoTable = result.getString("tip_conteiner");
						String statusTable = result.getString("stt_conteiner");
						String categoriaTable = result.getString("cat_conteiner"); 	%>
						 <tbody>
					<tr> 
					<td> <%=idTable %> </td> 
					<td> <%=nomeTable %> </td> 
					<td> <%=conteinerTable %> </td> 
					<td> <%=tipoTable %> </td> 
					<td> <%=statusTable %> </td> 
					<td> <%=categoriaTable %> </td> 
					
					</tr> </tbody>
								
				<% 	}	
					connection.close();%>
					
			 </table>
			 
			 
			 </div>

</body>
</html>