<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf" %>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<%@include file="WEB-INF/jspf/session.jspf"%>

<title>T2S - In�cio</title>
</head>
<body>
	<div class="container-fluid">
	
	<% 
// CASO NAO TENHA USUARIO LOGADO ESSA P�GINA � EXIBIDA
if (session.getAttribute("session.username") == null) {
%>
<h1> Hello World!</h1>
<h2><a href="teste.jsp"> Teste de conex�o</a></h2>




<!-- CASO HAJA LOGIN ESSA P�GINA � EXIBIDA -->
<% } else {%>

<h1> Voc� est� logado!</h1>


<%} %>

</div>
</body>
</html>