<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@include file="WEB-INF/jspf/bootstrap.jspf"%>
<%@include file="WEB-INF/jspf/footer.jspf"%>
<%@include file="WEB-INF/jspf/session.jspf"%>

<title>T2S - Sobre</title>
</head>
<body>
	<div class="container-fluid mt-2">
		<h2>Sobre:</h2>
		<p>Abaixo é possível conferir a lista de atualizações do sistema.
			Também é possível acompanhar as alterações através dos commits do
			github.</p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Versão</th>
					<th>Data</th>
					<th>Título</th>
					<th>Descrição</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1.0</td>
					<td>04/05/2021</td>
					<td>Push Inicial</td>
					<td>-Feito a página index com Hello World <br>-Adicionado
						JSPF para acessar bootstrap <br>-Colocado logotipo da empresa
						nas paginas <br>-correção de titulo de página com favicon
					</td>
				</tr>

				<tr>
					<td>1.1</td>
					<td>05/05/2021</td>
					<td>Remoção do sistema de BD pronto da azure</td>
					<td>-Removido o sistema de SQL da Azure. <br>-Configurado
						PostgreSQL direto na VM. <br>-Criado uma JSP que testa
						conexão com DB.
					</td>
				</tr>

				<tr>
					<td>1.2</td>
					<td>06/05/2021</td>
					<td>Correção de servlets e feito jsp para teste de conexão com
						db</td>
					<td>-As servlets não estavam sendo encontradas no servidor.
						Corrigido. <br>-Melhorado a página de teste de conexão com
						DB, mostrando log de erro caso ocorra.
					</td>
				</tr>

				<tr>
					<td>1.3</td>
					<td>07/05/2021</td>
					<td>Melhoria nas conexões de banco de dados</td>
					<td>-Criado arquivo para testar banco de dados local, sem ter
						que ficar alterando o código nos testes. <br>-Feito conexão
						com o banco de dados local, e teste de escrita nas colunas.
					</td>
				</tr>


				<tr>
					<td>1.4</td>
					<td>07/05/2021</td>
					<td>Adicionado página para cadastro de Contêineres</td>
					<td>-Estabelece um teste de conexão com DB ao abrir a página.
						<br>-É possível cadastrar um contêiner com todas as
						informações solicitadas no CRUD. <br>-Ao preencher formulário
						e clicar em cadastrar, caso sucesso uma mensagem é exibida. <br>-Ao
						preencher formulário e clicar em cadastrar, caso ocorra algum
						erro, o log de erro é exibido.
					</td>
				</tr>

				<tr>
					<td>1.5</td>
					<td>08/05/2021</td>
					<td>Listagem de contêineres</td>
					<td>-Adicionado página para listar conteiners. <br>-Modificado
						nome de arquivo das páginas.
					</td>
				</tr>

				<tr>
					<td>1.6</td>
					<td>09/05/2021</td>
					<td>Cadastro de usuário</td>
					<td>-Criado tabela no banco de dados com informações dos
						usuários. <br>-Criado página para cadastro de novo usuário.
					</td>
				</tr>

				<tr>
					<td>1.7</td>
					<td>09/05/2021</td>
					<td>Tela de Login</td>
					<td>-Criado tela de login, com autenticação dos dados
						digitados comparando com o servidor. <br>-Criado botões de
						redirecionamento para página de registro , login, etc. <br>
						Criado página "Sobre" com histórico de releases baseados nos meus
						commits.
					</td>
				</tr>

				<tr>
					<td>1.8</td>
					<td>10/05/2021</td>
					<td>JSPF Session</td>
					<td>-Criado uma jspf no qual após o usuário logar, é atribuido
						uma essão a ele, com o nome dele. <br>-Caso o usuário esteja
						logado, a navbar é exibida à ele. <br>-Caso não esteja
						logado, apenas as páginas públicas são visíveis
					</td>
				</tr>


				<tr>
					<td>1.9</td>
					<td>11/05/2021</td>
					<td>Delete conteiner, autenticação e outros</td>
					<td>-Criado botão para Deletar conteiner funcional. 
					<br>-Melhorado página e login e tornado algumas páginas acessíveis somente se usuário estiver logado. 
						<br>-atualizado bootstrap, 
						<br>-modificado navbar para uma responsiva 
						<br>-mudado escala minima do site para poder rodar em celulares 
						<br>-criado duas navbars, uma para quem está logado outra para quem não 
						<br>-Iniciado escopo da página de edição de conteiner
					</td>
				</tr>
				
				
				
					<tr>
					<td>2.0</td>
					<td>12/05/2021</td>
					<td>Edição de conteiner</td>
					<td>-Configurado parâmetros para editar um conteiner, obtendo seus dados atuais no banco de dados e realizando atualização através de inputs do usuário.
					</td>
				</tr>
				
					<tr>
					<td>2.1</td>
					<td>13/05/2021</td>
					<td>Movimentação</td>
					<td>-Criado botão para Deletar conteiner funcional. 
					<br>-Adicionado página de cadastro e listagem de movimentação

					</td>
				</tr>
				
					<tr>
					<td>2.2</td>
					<td>13/05/2021</td>
					<td>Relatório</td>
					<td>-Criado menu com relatório de movimentações
					<br>-Feito controle de paginação e lista ordenada por cliente e tipo de movimentação

					</td>
				</tr>
				

			</tbody>
		</table>
	</div>






</body>
</html>