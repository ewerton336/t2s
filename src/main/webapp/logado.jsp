<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf" %>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<%@include file="WEB-INF/jspf/session.jspf"%>

<title>T2S - Início</title>
</head>
<body>
	<div class="container-fluid mt-2">
	
	<% 
if (session.getAttribute("session.username") != null) {
%>

<h1> Logado com sucesso!</h1>



<% }%>

</div>
</body>
</html>