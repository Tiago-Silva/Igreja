<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
<div class="row" id="cabecalho">
	<div class="five columns right" id="menu" align="center">
		<div class="three columns" align="left" style="padding-left: 0; width: 20%;">
			<h1>
				<a href="<c:url value="/"/>"><img
					src="<c:url value="/resources/img/background/logoIgreja.png"/>" /></a>
			</h1>
		</div>
		
		<ul>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
			<li class="li1"><a href="#">Cadastro</a>
				<ul>
					<li><a href="<c:url value="PastorCadastro"/>">Pastores</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="IgrejaCadastro"/>">Igrejas</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="MembroCadastro"/>">Membros</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="UsuarioCadastro"/>">Usuário</a></li>
				</ul></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_SECRETARIO_CONGREGACAO')">
			<li class="li1"><a href="#">Cadastro</a>
				<ul>
					<li><a href="MembroCadastro">Membros</a></li>
				</ul></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE','ROLE_TESOUREIRO_SEDE')">
			<li class="li2"><a href="#">Igrejas</a>
				<ul>
					<li><a href="<c:url value="ListaIgreja"/>">TODAS</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="ListaIgrejaTipo"/>">Congregações</a></li>
					
				</ul></li>
				<li class="li3"><a href="<c:url value="ListaObreiros"/>">Obreiros</a></li>
				<li class="li4"><a href="#">Membros</a>
				<ul>
					<li><a
						href="<c:url value="ListaMembroSede"/>">SEDE</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="ListaMembroCongregacao"/>">Congregação</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="ListaTodosMembros">TODOS</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="ListaTodosUsuarios">Usuários</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="pesquisaCartaoMembro"/>">Cartão de Membro</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="pesquisaCartaoMembroPorNome"/>">Cartão-Por Nome</a></li>
					
				</ul></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_SECRETARIO_CONGREGACAO')">
			<li class="li4"><a href="#">Lista</a>
				<ul>
					<li><a href="ListaMembroCongregacao">Membros</a></li>
					
					<li><a href="<c:url value="pesquisaCartaoMembro"/>">Cartão de Membro</a></li>
					
					<li><a href="<c:url value="pesquisaCartaoMembroPorNome"/>">Cartão-Por Nome</a></li>
				</ul></li>
			<li><a href="<c:url value="ListaObreiros"/>">Obreiros</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_TESOUREIRO_SEDE')">
			<li class="li5"><a href="#">Movimentações</a>
				<ul>
					<li><a
						href="<c:url value="CaixaCadastro"/>">SEDE</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="CaixaCadastroCongregacao"/>">Congregação</a></li>
					<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
					<li><a href="<c:url value="geraRelatorioDizmo"/>">Relatório-Dizimo</a></li>
					
				</ul></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_TESOUREIRO_CONGREGACAO')">
			<li class="li5"><a href="#">Movimentações</a>
				<ul>
					<li><a href="<c:url value="CaixaCadastroCongregacao"/>">Congregação</a></li>
					
					<li><a href="<c:url value="geraRelatorioDizmo"/>">Relatório-Dizimo</a></li>
				</ul></li>
			</sec:authorize>
			
			<li class="li6"><a href="#">Contato</a></li>
			
			<li class="li7"><a href="#">Relatório</a></li>
			
			<li class="li8"><a href="#">Grupos</a></li>
		</ul>
			Bem Vindo(a) <sec:authentication property="name"/>
			<a href='<c:url value="/j_spring_security_logout"/>' style="color: #391A9C;">Sair</a>
	</div>
	
</div>
</sec:authorize>