<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Solicitações de Mudança</title>
</head>
<body>
	<c:url value="/sm/save" var="save"/>
	<form action="${save}" method="POST">
		<input type="text" name="sm.nome" placeholder="Nome"/><br/>
		<input type="text" name="sm.data" placeholder="Data"/><br/>
		<input type="submit" value="Salvar"/><br/>
	</form>
	<c:forEach items="${list}" var="sm">
		${sm.nome}<br/>
	</c:forEach>
</body>
</html>