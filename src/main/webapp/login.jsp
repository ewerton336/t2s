<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T2S - Login</title>
</head>




<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<%@include file="WEB-INF/jspf/session.jspf"%>
<%@include file="WEB-INF/jspf/jdbcURL.jspf"%>

<%
String emailinput = request.getParameter("email");
String senhainput = request.getParameter("senha");
%>

<body>

<div class="row justify-content-center">
	<aside class="col-sm-4">
<p>Por favor, realize seu login</p> 
<p>Caso queira apenas ter uma demonstração do sistema, utilize o email: admin@admin e senha: admin </p>
<div class="card">
<article class="card-body">
<a href="cadastro-usuario.jsp" class="float-right btn btn-outline-primary">Criar conta</a>
<h4 class="card-title mb-4 mt-1">Entrar</h4>
	 <form method="post">
    <div class="form-group">
    	<label>Email:</label>
        <input name="email" id="email" class="form-control" placeholder="Email" type="email">
    </div> 
    <div class="form-group">
    	<a class="float-right" href="#">Esqueceu a senha?</a>
    	<label>Senha:</label>
        <input class="form-control" placeholder="******" type="password" id="senha" name="senha">
        <input type="checkbox" id="show-password" class="mt-4"><span class="mx-2">Exibir senha</span>
    </div> 
    <div class="form-group"> 
   
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block"> Login  </button>
    </div>                                                         
</form>
</article>
</div> 













	<%
		/* AUTENTICACAO COM O BANCO DE DADOS */

		try {

			Connection connection = DriverManager.getConnection(jdbcURL, username, password);

			String sql = "Select nome_usuario, email_usuario,senha_usuario  from tb_usuario WHERE email_usuario='" + emailinput + "'";

			Statement statement = connection.createStatement();
			;

			ResultSet result = statement.executeQuery(sql);
		%>
		<%
		while (result.next()) {
			String db_email_usuario = result.getString("email_usuario");
			String db_senha_usuario = result.getString("senha_usuario");
			String db_nome_usuario = result.getString("nome_usuario");

			if (senhainput.equals(db_senha_usuario) && emailinput.equals(db_email_usuario)) {
		%>
		<div class="alert alert-success" role="alert">
			<%
			
			/*DEFINE O NOME DE USUARIO NA SESSAO E ATUALIZA A PAGINA*/
			session.setAttribute("session.username", db_nome_usuario);
			out.println("Logado com sucesso!");
			 response.sendRedirect("./index.jsp");
			
			}
			 

			else {
			%>
			<div class="alert alert-danger">
				<%
				out.println("Usuário ou senha incorretos.");
				}
			
			
				%>
				
				
			<%
			connection.close();

			}
			} catch (SQLException e) {
				out.println("Erro de conexao ao banco de dados PostgreSQL");
				// TODO Auto-generated catch block
				e.printStackTrace(new java.io.PrintWriter(out));
				}
			%>
		</div>
			
			</div>





	</div>
	<script>
var x = document.getElementById("show-password");
var y = document.getElementById("senha");
x.onclick = function() {
    if (y.type === "password") {
    y.type = "text";
  } else {
    y.type = "password";
  }
}

</script>
</body>

</html>