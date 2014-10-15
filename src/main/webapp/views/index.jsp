<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sistema de Segurança</title>
</head>
<body>
	<p>Voçê está tentando acessar um ambiente seguro</p>
	<p>Será necessário autenticação para o acesso</p>
	<a href='<c:url value="/home"/>'>Entrar</a>
</body>
</html>