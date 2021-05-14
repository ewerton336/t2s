<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<%@include file="WEB-INF/jspf/session.jspf"%>

<title>T2S - Início</title>


</head>



<body>
	<div class="container-fluid mt-2">

		<%
		// CASO NAO TENHA USUARIO LOGADO ESSA PÁGINA É EXIBIDA
		if (session.getAttribute("session.username") == null) {
		%>
		
		
		
		<h1 class="row justify-content-center">Sistema de gerenciamento de Contêineres - T2S</h1> <br>
		
		
		<div class="row justify-content-center">
	<aside class="col-sm-4">
<div class="card">
<article class="card-body">

<h4 class="card-title mb-4 mt-1">Selecione uma opção:</h4>
	
	 
   
    <div class="form-group">
    	<a href="login.jsp" class="btn btn-outline-primary btn-block">Login</a>
        <a href="cadastro-usuario.jsp" class="btn btn-outline-primary btn-block">Cadastro</a>
         <a href="sobre.jsp" class="btn btn-outline-primary btn-block">Sobre</a>
    </div>                                                         

</article>
</div>  </aside> </div>


		
		<div class="container-fluid mt-2">

	<h4>Nosa missão e visão:</h4>
		<h6 class="text-justify">"Prover soluções de software com agilidade, excelência e exclusividade
		para o setor portuário." <br><br>
		
		A T2S atua desde 2003 projetando e
		desenvolvendo sistemas sob demanda. Com a presença acadêmica inserida
		em nossa cultura desde a fundação, crescemos captando os melhores
		talentos para formar uma equipe altamente qualificada. E para
		potencializar nossa capacidade, estabelecemos um ambiente de
		comunicação aberta e colaborativa, estimulando a criatividade e a
		inovação. Paralelamente, estruturamos os nossos processos utilizando
		metodologias ágeis e design thinking. Todas as nossas ações são para
		prover ao mercado um time que entrega 100% dos projetos, por mais
		desafiadores que sejam!!! </h6> 


		<!-- CASO HAJA LOGIN ESSA PÁGINA É EXIBIDA -->
		<%
		} else {
		%>

		<h2 class="row justify-content-center">Você está logado!</h2> <br>
		
		
			<h1 class="row justify-content-center">Sistema de Gerenciamento de Contêineres - T2S</h1> <br>
		
		
		<div class="row justify-content-center">
	<aside class="col-sm-4">
<div class="card">
<article class="card-body">

<h4 class="card-title mb-4 mt-1">Selecione uma opção:</h4>
	
	 
   
    <div class="form-group">
    	<a href="cadastro-conteiner.jsp" class="btn btn-outline-primary btn-block">Cadastro de contêiner</a>
<a onclick="window.open('./listar-conteineres.jsp','popup','width=1800,height=900'); return false;" class="btn btn-outline-primary btn-block">Listar Contêineres</a>
        <a onclick="window.open('./relatorio-conteiner.jsp','popup','width=1800,height=900'); return false;" class="btn btn-outline-primary btn-block">Relatório de contêineres cadastrados</a>
        <a href="cadastro-movimentacao.jsp" class="btn btn-outline-primary btn-block">Registrar movimentação</a>
        <a onclick="window.open('./listar-movimentacao.jsp','popup','width=1800,height=900'); return false;" class="btn btn-outline-primary btn-block">Listar movimentação</a>
         <a onclick="window.open('./relatorio-movimentacao.jsp','popup','width=1800,height=900'); return false;" class="btn btn-outline-primary btn-block">Relatório total de movimentação</a>
        
         <a href="sobre.jsp" class="btn btn-outline-primary btn-block">Sobre</a>
    </div>                                                         

</article>
</div>  </aside> </div>


		<%
		}
		%>

	</div>
	</div>
</body>
</html>