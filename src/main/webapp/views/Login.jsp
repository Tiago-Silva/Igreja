<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page session="false"%>
<html>
<head>

	<link rel="stylesheet" href="<c:url value="/resources/css/foundation.min.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/estilo.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/menu.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/FormCurso.css"/>" />
	<link rel="stylesheet" href="<c:url value="/resources/css/index/carrinho.css"/>" />

<link rel="stylesheet"
	href="<c:url value="/resources/css/customizado/Logincss.css"/>" />
<title>Seguran�a: Necess�rio autentica��o</title>

</head>
<body onload='document.f.j_username.focus();'>

	<c:if test="${param.error == 1}">
		<div class="erro" align="center">
			<h3 class="erro">Voc� n�o possui Autoriza��o para acessar o conte�do solicitado!</h3>
		</div>
	</c:if>
	
	<sec:authorize ifNotGranted="ROLE_TESOUREIRO_SEDE,ROLE_ADMIN_SEDE,ROLE_SECRETARIO_SEDE,
								ROLE_TESOUREIRO_CONGREGACAO,ROLE_SECRETARIO_CONGREGACAO">
	<div id="home">
		<div id="login" align="center">
		
		<c:if test="${param.error != null}">
			<div class="erro">
			Login e/ou Senha inv�lido.
			<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			Reason: <c:out value="#{sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}"/>
			</c:if>
			</div>
			</c:if>
			
			<c:if test="${param.logout == 1}">
			<div class="alert alert-success">
			Voc� foi desconectado.
			</div>
			</c:if>
		
			<form name='f' action='/igreja/j_spring_security_check' method='POST'>
				
				<table>
					<tr>
						<td>Login:</td>
						<td><input type='text' name='j_username' value=''></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type='password' name='j_password' /></td>
					</tr>
					<tr>
						<td colspan='2'><input name="submit" type="submit"
							value="Entrar" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</sec:authorize>
	<tiles:insertAttribute name="rodape"/>
</body>
</html>