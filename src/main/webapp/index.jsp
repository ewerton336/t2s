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
		<h1>Bem vindo ao sistema de gerenciamento de contêineres da T2s!</h1>
		<h2>

		</h2>

	<h4>Missão e Visão:</h4>
		<p class="text-justify">"Prover soluções de software com agilidade, excelência e exclusividade
		para o setor portuário." <br>A T2S atua desde 2003 projetando e
		desenvolvendo sistemas sob demanda. Com a presença acadêmica inserida
		em nossa cultura desde a fundação, crescemos captando os melhores
		talentos para formar uma equipe altamente qualificada. E para
		potencializar nossa capacidade, estabelecemos um ambiente de
		comunicação aberta e colaborativa, estimulando a criatividade e a
		inovação. Paralelamente, estruturamos os nossos processos utilizando
		metodologias ágeis e design thinking. Todas as nossas ações são para
		prover ao mercado um time que entrega 100% dos projetos, por mais
		desafiadores que sejam!!! </p>


		<!-- CASO HAJA LOGIN ESSA PÁGINA É EXIBIDA -->
		<%
		} else {
		%>

		<h1>Você está logado!</h1>


		<%
		}
		%>

	</div>
</body>
</html>