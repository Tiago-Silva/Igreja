<!DOCTYPE html>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<!-- Jquery do easy-dataTable 
	<script src="<c:url value="/resources/jquery/dataTable/easy.datatable.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/dataTable/easy.datatable.min_garble.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/dataTable/easy.datatable.min.js"/>" type="text/javascript" ></script>
	-->
	
	<script src="<c:url value="/resources/jquery/jquery-2.0.2.min.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/formCadIgreja.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/autoComplete/autoComplete.js"/>" type="text/javascript" ></script>
	
	
	<!-- Jquery ui-1.10.4 -->
	<script src="<c:url value="/resources/jquery/ui-1.10.4/jquery-1.10.2.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/ui-1.10.4/jquery-ui-1.10.4.custom.js"/>" type="text/javascript" ></script>
	<script src="<c:url value="/resources/jquery/ui-1.10.4/jquery-ui-1.10.4.custom.min.js"/>" type="text/javascript" ></script>
	
	<script src="<c:url value="/resources/jquery/dialog.js"/>" type="text/javascript" ></script>
	
	<script src="<c:url value="/resources/jquery/jquery.maskedinput.js"/>" type="text/javascript" ></script>
	
	<script src="<c:url value="/resources/jquery/customizado/deleta.js"/>" type="text/javascript" ></script>
	
	<script type="text/javascript" src="<c:url value="/resources/jquery/mascara/jquery.maskMoney.js"/>"></script>
	
	<script type="text/javascript" src="<c:url value="/resources/jquery/tablesorter/jquery.tablesorter.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/tablesorter/jquery.tablesorter.widgets.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/tablesorter/pager/jquery.tablesorter.pager.js"/>"></script>
	
	<script type="text/javascript" src="<c:url value="/resources/jquery/tabela.js"/>"></script>
	<!-- Jquery do BootStrap 
	<script type="text/javascript" src="<c:url value="/resources/jquery/bootStrap/bootstrap.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery/bootStrap/bootstrap.min.js"/>"></script>
	-->
	
	<!-- Jquery ui-1.10.4 -->
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui/jquery-ui-1.10.4.custom.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui/jquery-ui-1.10.4.custom.min.css"/>" />
	
	
	<link rel="stylesheet" href="<c:url value="/resources/css/foundation.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/estilo.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/menu.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/FormCurso.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/index/carrinho.css"/>" />
	
	<!-- Css do easy-dataTable 
	<link rel="stylesheet" href="<c:url value="/resources/css/dataTable/datatable_ext.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/dataTable/datatable_win8.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/dataTable/datatable.css"/>" />
	-->
	<link rel="stylesheet" href="<c:url value="/resources/css/tablesorter/theme.blue.css"/>" />
	<!--  CSS do tableSorte não estava sendo carregado - provocando lentidão
		<link rel="stylesheet" href="<c:url value="/resources/css/pager/jquery.tablesorter.pager.css"/>" />  
	-->
	
	<link rel="stylesheet" href="<c:url value="/resources/css/customizado/tabela.css"/>" />
	
	<!-- Css do BootStrap 
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/bootstrap.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/bootstrap.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/bootstrap-theme.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/bootstrap-theme.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/jquery.dataTables.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/jquery.dataTables_themeroller.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/demo_table_jui.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootStrap/demo_table.css"/>" />
	-->
	
	
	<title><tiles:getAsString name="titulo" /></title>
</head>
<body>
	
	<tiles:insertAttribute name="cabecalho"/>
	

	<tiles:insertAttribute name="conteudo"/>


	<tiles:insertAttribute name="rodape"/>
</body>
</html>