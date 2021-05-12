

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
		id2 = (Integer.parseInt(request.getParameter("idValue")));
	}
	
	%>
	<div class="container-fluid">
	
	
	
	
<!-- PARTE DA EDIÇÃO DOS DADOS -->
	<% try{ 
			Connection connection = DriverManager.getConnection(jdbcURL, username, password);
			System.out.println("Conectado com sucesso!");
			
			
			
			String sql= "UPDATE tb_conteiner SET nm_cliente = ?, num_conteiner = ?, tip_conteiner = ?, stt_conteiner = ?, cat_conteiner = ? WHERE id_conteiner ='" + id + "'";
			
			PreparedStatement statement = connection.prepareStatement(sql);
			
			statement.setString(1, "2");
			statement.setString(2, "2");
			statement.setString(3, "2");
			statement.setString(4, "2");
			statement.setString(5, "2");
	
			
			int rows = statement.executeUpdate();
			
			if (rows > 0) {
				System.out.println("Conteiner alterado");
			}
			
			connection.close();
			
		} catch (SQLException e) {
			System.out.println("Erro de conexao ao banco de dados PostgreSQL");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}%>
				
	
 
	

	</div>
</body>
</html>