<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Atividades</title>
</head>
<body>
	<form action="${linkTo[AtividadeController].save}" method="POST">
		<input type="hidden" name="atividade.id" value="${atividade.id}"/>
		<input type="text" name="atividade.descricao" value="${atividade.descricao}" placeholder="Descrição"/><br/>
		<input type="text" name="atividade.branch" value="${atividade.branch}" placeholder="Branch"/><br/>
		<select name="atividade.sm.id">
			<option value="">Selecione uma SM</option>
			<c:forEach items="${sms}" var="sm">
				<option value="${sm.id}" ${sm.id eq atividade.sm.id ? 'selected' : ''}>${sm.nome}</option>
			</c:forEach>
		</select><br/>
		<input type="submit" value="Salvar"/><br/>
	</form>
	<c:forEach items="${atividades}" var="atividade">
		<a href="${linkTo[AtividadeController].edit(atividade.id)}">Editar</a>
		<a href="${linkTo[AtividadeController].delete(atividade.id)}">Remover</a>
		${atividade.sm.nome} - ${atividade.descricao}<br/>
	</c:forEach>
</body>
</html>