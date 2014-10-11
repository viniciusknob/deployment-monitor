<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Solicitações de Mudança</title>
</head>
<body>
	<a href="${linkTo[DashboardController].index}">Voltar</a><br/>
	<c:url value="/sm/save" var="save"/>
	<form action="${save}" method="POST">
		<input type="hidden" name="sm.id" value="${sm.id}"/>
		<input type="text" name="sm.nome" value="${sm.nome}" placeholder="Nome"/><br/>
		<fmt:formatDate value="${sm.data}" pattern="dd/MM/yyyy" var="data"/>
		<input type="text" name="sm.data" value="${data}" placeholder="Data"/><br/>
		<input type="submit" value="Salvar"/><br/>
	</form>
	<c:forEach items="${list}" var="sm">
		<c:url value="/sm/edit/${sm.id}" var="edit"/>
		<c:url value="/sm/delete/${sm.id}" var="delete"/>
		<a id="ed${sm.id}" href="${edit}">Editar</a>
		<a id="rm${sm.id}" href="${delete}">Remover</a>
		${sm.nome} - <fmt:formatDate value="${sm.data}" pattern="dd/MM/yyyy"/><br/>
	</c:forEach>
</body>
</html>