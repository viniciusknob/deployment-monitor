<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>

    <!-- Standard Meta -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properities -->
    <title><fmt:message key="title.app"/></title>
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/semantic-ui/0.19.3/css/semantic.min.css">
    
    <!-- Custom Style -->
    <style>
        html, body {
            font-size: 15px;
        }
        body {
            font-family:"Lato", sans-serif;
            margin: 0;
            color: #555555;
            background-color: whitesmoke;
        }
        .ui.mini.table {
            font-size: .7em;
        }
        .ui.label {
            text-transform: none;
            padding: .2em .8em;
            margin: 0;
        }
        .ui.yellow.label, .ui.yellow.labels .label {
            background-color: #fcd419;
            border-color: #fcd419;
            color: darkgoldenrod;
        }
        .ui.form.loading:after {
            z-index: 2;
        }
    </style>
    
</head>