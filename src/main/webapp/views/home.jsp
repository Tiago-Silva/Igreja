<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false"%>

<link rel="stylesheet"
	href="<c:url value="/resources/css/customizado/Logincss.css"/>" />

	<c:if test="${param.error == 1}">
		<div class="erro" align="center">
			<h3 class="erro">Você não possui Autorização para acessar o conteúdo solicitado!</h3>
		</div>
	</c:if>
	
	<sec:authorize ifNotGranted="ROLE_TESOUREIRO_SEDE,ROLE_ADMIN_SEDE,ROLE_SECRETARIO_SEDE,
								ROLE_TESOUREIRO_CONGREGACAO,ROLE_SECRETARIO_CONGREGACAO">
	<div id="home">
		<div id="login" align="center">
		
		<c:if test="${param.error != null}">
			<div class="erro">
			Login e/ou Senha inválido.
			<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
			Motivo: <c:out value="#{sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}"/>
			</c:if>
			</div>
			</c:if>
			
			<c:if test="${param.logout == 1}">
			<div class="alert alert-success">
			Você foi desconectado.
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