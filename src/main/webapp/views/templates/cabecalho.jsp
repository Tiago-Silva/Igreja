<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">

<header ng-controller="menu">
		<div class="navbar navbar-fixed-top navbar-inverse">
			<div class="navbar-inner">
				<div class="container">
				
					<a class="btn btn-navbar" ng-click="isCollapsed = !isCollapsed" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</a>
					
					<a class="brand" href="<c:url value="/"/>">
						<img src="<c:url value="/resources/img/background/logoIgreja.png"/>">
					</a>
					<div class="nav-collapse" collapse=isCollapsed>
						<ul class="nav">
							<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE')">
							
							<li class="dropdown" dropdown on-toggle="toggled(open)">
								<a ng-href="/#" class="dropdown-toggle" dropdown-toggle data-toggle="dropdown">
									Cadastro
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="PastorCadastro"/>">Pastores</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a href="<c:url value="IgrejaCadastro"/>">Igrejas</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a href="<c:url value="#/MembroCadastro"/>">Membros</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a href="<c:url value="UsuarioCadastro"/>">Usuário</a></li>
								</ul>
							</li>
							
							<li class="dropdown" dropdown on-toggle="toggled(open)">
								<a ng-href="/#" class="dropdown-toggle" dropdown-toggle data-toggle="dropdown">
									Movimentações
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="CaixaCadastroCongregacao"/>">Congregação</a></li>
						
									<li><a href="<c:url value="geraRelatorioDizmo"/>">Relatório-Dizimo</a></li>
								</ul>
							</li>
							</sec:authorize>
							
							<sec:authorize access="hasAnyRole('ROLE_SECRETARIO_CONGREGACAO')">
							<li class="dropdown" dropdown on-toggle="toggled(open)">
								<a ng-href="/#" class="dropdown-toggle" dropdown-toggle data-toggle="dropdown">
									Cadastro
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="MembroCadastro">Membros</a></li>
								</ul>
							</li>
							</sec:authorize>
							
							<sec:authorize access="hasAnyRole('ROLE_ADMIN_SEDE','ROLE_SECRETARIO_SEDE','ROLE_TESOUREIRO_SEDE')">
							<li class="dropdown" dropdown on-toggle="toggled(open)">
								<a ng-href="/#" class="dropdown-toggle" dropdown-toggle data-toggle="dropdown">
									Igrejas
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="ListaIgreja"/>">TODAS</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a href="<c:url value="ListaIgrejaTipo"/>">Congregações</a></li>
								</ul>
							</li>
							
							<li class="dropdown" dropdown on-toggle="toggled(open)">
								<a ng-href="/#" class="dropdown-toggle" dropdown-toggle data-toggle="dropdown">
									Membros
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a ng-href="#/ListaMembroSede">SEDE</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a ng-href="#/BuscaMembroCongregacao">Congregação</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a ng-href="#/ListaTodosMembros">TODOS</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a href="ListaTodosUsuarios">Usuários</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a href="<c:url value="#/pesquisaCartaoMembro"/>">Cartão de Membro</a></li>
									<hr style="height: 1px;margin-top: 0px; margin-bottom: 0px;"/>
									<li><a href="<c:url value="#/pesquisaCartaoMembroPorNome"/>">Cartão-Por Nome</a></li>
								</ul>
							</li>
							</sec:authorize>
							
							<sec:authorize access="hasAnyRole('ROLE_TESOUREIRO_CONGREGACAO')">
							<li class="dropdown" dropdown on-toggle="toggled(open)">
								<a ng-href="/#" class="dropdown-toggle" dropdown-toggle data-toggle="dropdown">
									Movimentações
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="<c:url value="CaixaCadastroCongregacao"/>">Congregação</a></li>
						
									<li><a href="<c:url value="geraRelatorioDizmo"/>">Relatório-Dizimo</a></li>
								</ul>
							</li>
							</sec:authorize>
						</ul>
						
						<ul class="nav navbar-right">
								
								<li class="pull-right"><a href="#">Bem Vindo(a) <sec:authentication property="name"/></a></li>
								
								<li class="pull-right">
									<a href="<c:url value="/j_spring_security_logout"/>" ng-click="apagaCookie()">
										Sair
									</a>
								</li>
				        </ul>
				        
					</div>
				</div>
			</div>
		</div>
	</header>

</sec:authorize>