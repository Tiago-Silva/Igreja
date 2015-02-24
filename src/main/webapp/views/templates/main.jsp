<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html ng-app="Igreja" ng-csp lang="pt-BR">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Tiago Silva">
    
	<!-- Jquery do easy-dataTable 
	<script src="<c:url value="/resources/jquery/dataTable/easy.datatable.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/dataTable/easy.datatable.min_garble.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/dataTable/easy.datatable.min.js"/>" type="text/javascript" ></script>
	-->
	
	
	<!--  
	<script src="<c:url value="/resources/jquery/jquery-2.0.2.min.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/formCadIgreja.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/autoComplete/autoComplete.js"/>" type="text/javascript" ></script>
	-->
	
	<!-- Jquery ui-1.10.4 
	<script src="<c:url value="/resources/jquery/ui-1.10.4/jquery-1.10.2.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/ui-1.10.4/jquery-ui-1.10.4.custom.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/ui-1.10.4/jquery-ui-1.10.4.custom.min.js"/>" type="text/javascript" ></script>
	-->
	
	
	<!-- Css do BootStrap -->
	<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/navbar-fixed-top.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap-responsive.min.css"/>" />
	
	
	
	<!--  
	<script src="<c:url value="/resources/jquery/dialog.js"/>" type="text/javascript" ></script>
	
	<script src="<c:url value="/resources/jquery/jquery.maskedinput.js"/>" type="text/javascript" ></script>
	
	<script src="<c:url value="/resources/jquery/customizado/deleta.js"/>" type="text/javascript" ></script>
	
	<script type="text/javascript" src="<c:url value="/resources/jquery/mascara/jquery.maskMoney.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/tablesorter/jquery.tablesorter.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/tablesorter/jquery.tablesorter.widgets.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/tablesorter/pager/jquery.tablesorter.pager.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/tabela.js"/>"></script>
	-->
	
	
	<!-- Script do BootStrap 
	<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
	-->
	
	<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/ie10-viewport-bug-workaround.js"/>"></script>
	
	
	<!-- Css - Jquery ui-1.10.4 
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui/jquery-ui-1.10.4.custom.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui/jquery-ui-1.10.4.custom.min.css"/>" />
	-->
	
	<!-- Retirando a base css antiga 
	<link rel="stylesheet" href="<c:url value="/resources/css/foundation.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/menu.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/FormCurso.css"/>" />
	-->
	
	<link rel="stylesheet" href="<c:url value="/resources/css/estilo.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/index/carrinho.css"/>" />
	
	<!-- Css do easy-dataTable 
	<link rel="stylesheet" href="<c:url value="/resources/css/dataTable/datatable_ext.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/dataTable/datatable_win8.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/dataTable/datatable.css"/>" />
	-->
	
	<!--  CSS do tableSorte não estava sendo carregado - provocando lentidão
		<link rel="stylesheet" href="<c:url value="/resources/css/tablesorter/theme.blue.css"/>" />
		<link rel="stylesheet" href="<c:url value="/resources/css/pager/jquery.tablesorter.pager.css"/>" />
	-->
	<link rel="stylesheet" href="<c:url value="/resources/css/customizado/tabela.css"/>" />  
	
	<title><tiles:getAsString name="titulo" /></title>
</head>
<body class="container">
	
	<div class="container">
		
		<header>
			<tiles:insertAttribute name="cabecalho"/>
		</header>
		
		<ng-view class="row-fluid">
			
		</ng-view>
		
		<footer>
			<tiles:insertAttribute name="rodape"/>
		</footer>
		
	</div>
	
	<!-- Angularjs -->
	<script src="<c:url value="/resources/angular/angular/angular.min.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/angular/angular/ui-bootstrap-tpls-0.12.0.min.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/angular/angular/angular-route.min.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/angular/angular/angular-resource.min.js"/>" type="text/javascript" ></script>
	
	<!-- Membro js -->
	<script src="<c:url value="/resources/angular/membro/main.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/angular/membro/app.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/angular/servicos/membro/serviceMembro.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/angular/membro/modalMembro.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/angular/membro/buscaMembro.js"/>" type="text/javascript" ></script>
</body>
</html>