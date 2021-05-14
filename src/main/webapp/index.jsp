<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<%@include file="WEB-INF/jspf/session.jspf"%>

<title>T2S - In�cio</title>
</head>
<body>
	<div class="container-fluid mt-2">

		<%
		// CASO NAO TENHA USUARIO LOGADO ESSA P�GINA � EXIBIDA
		if (session.getAttribute("session.username") == null) {
		%>
		<h1>Bem vindo ao sistema de gerenciamento de cont�ineres da T2s!</h1>
		<h2>

		</h2>

	<h4>Miss�o e Vis�o:</h4>
		<p class="text-justify">"Prover solu��es de software com agilidade, excel�ncia e exclusividade
		para o setor portu�rio." <br>A T2S atua desde 2003 projetando e
		desenvolvendo sistemas sob demanda. Com a presen�a acad�mica inserida
		em nossa cultura desde a funda��o, crescemos captando os melhores
		talentos para formar uma equipe altamente qualificada. E para
		potencializar nossa capacidade, estabelecemos um ambiente de
		comunica��o aberta e colaborativa, estimulando a criatividade e a
		inova��o. Paralelamente, estruturamos os nossos processos utilizando
		metodologias �geis e design thinking. Todas as nossas a��es s�o para
		prover ao mercado um time que entrega 100% dos projetos, por mais
		desafiadores que sejam!!! </p>


		<!-- CASO HAJA LOGIN ESSA P�GINA � EXIBIDA -->
		<%
		} else {
		%>

		<h1>Voc� est� logado!</h1>


		<%
		}
		%>

	</div>
</body>
</html>