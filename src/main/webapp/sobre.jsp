<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf" %>
<%@include file="WEB-INF/jspf/footer.jspf" %>
<%@include file="WEB-INF/jspf/session.jspf"%>

<title>T2S - Sobre</title>
</head>
<body>
<div class="container-fluid mt-2">
  <h2>Sobre:</h2>
  <p>Abaixo � poss�vel conferir a lista de atualiza��es do sistema. Tamb�m � poss�vel acompanhar as altera��es atrav�s dos commits do github. </p>            
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Vers�o</th>
        <th>Data</th>
        <th>T�tulo</th>
        <th>Descri��o</th>
      </tr>
    </thead>
    <tbody>
      <tr>
         <td>1.0</td>
        <td>04/05/2021</td>
        <td>Push Inicial</td>
        <td>-Feito a p�gina index com Hello World
        <br>-Adicionado JSPF para acessar bootstrap
         <br>-Colocado logotipo da empresa nas paginas 
         <br>-corre��o de titulo de p�gina com favicon</td>
      </tr>
      
      <tr>
       <td>1.1</td>
        <td>05/05/2021</td>
        <td>Remo��o do sistema de BD pronto da azure</td>
        <td>-Removido o sistema de SQL da Azure.
        <br>-Configurado PostgreSQL direto na VM.
         <br>-Criado uma JSP que testa conex�o com DB.   </td>  
 		</tr>
 		
 		<tr>
       <td>1.2</td>
        <td>06/05/2021</td>
        <td>Corre��o de servlets e feito jsp para teste de conex�o com db</td>
        <td>-As servlets n�o estavam sendo encontradas no servidor. Corrigido.
        <br>-Melhorado a p�gina de teste de conex�o com DB, mostrando log de erro caso ocorra.    </td>
 		</tr>
 		
 		<tr>
       <td>1.3</td>
        <td>07/05/2021</td>
        <td>Melhoria nas conex�es de banco de dados</td>
        <td>-Criado arquivo para testar banco de dados local, sem ter que ficar alterando o c�digo nos testes.
        <br>-Feito conex�o com o banco de dados local, e teste de escrita nas colunas. </td>
 		</tr>
 		
 		
 			<tr>
       <td>1.4</td>
        <td>07/05/2021</td>
        <td>Adicionado p�gina para cadastro de Cont�ineres</td>
        <td>-Estabelece um teste de conex�o com DB ao abrir a p�gina. 
        <br>-� poss�vel cadastrar um cont�iner com todas as informa��es solicitadas no CRUD.
        <br>-Ao preencher formul�rio e clicar em cadastrar, caso sucesso uma mensagem � exibida.
        <br>-Ao preencher formul�rio e clicar em cadastrar, caso ocorra algum erro, o log de erro � exibido.
        </td>
 		</tr>
 		
 		<tr>
       <td>1.5</td>
        <td>08/05/2021</td>
        <td>Listagem de cont�ineres</td>
        <td>-Adicionado p�gina para listar conteiners.
        <br>-Modificado nome de arquivo das p�ginas.
        </td>
 		</tr>
 		
 		<tr>
       <td>1.6</td>
        <td>09/05/2021</td>
        <td>Cadastro de usu�rio</td>
        <td>-Criado tabela no banco de dados com informa��es dos usu�rios.
        <br>-Criado p�gina para cadastro de novo usu�rio.
        </td>
 		</tr>
 		
 			<tr>
       <td>1.7</td>
        <td>09/05/2021</td>
        <td>Tela de Login</td>
        <td>-Criado tela de login, com autentica��o dos dados digitados comparando com o servidor.
        <br>-Criado bot�es de redirecionamento para p�gina de registro , login, etc.
        <br> Criado p�gina "Sobre" com hist�rico de releases baseados nos meus commits.
        </td>
 		</tr>
 
    </tbody>
  </table>
</div>






</body>
</html>