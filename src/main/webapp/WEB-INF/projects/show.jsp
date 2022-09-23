<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <title>Project Details</title>
</head>
<body>

<h2><a href="/dashboard">Dashboard</a></h2>

<h1>Project Details</h1>
<table>
    <tbody>
    <tr>
        <td>Project: <c:out value="${project.title}"></c:out></td>
    </tr>

    <tr>
        <td>Description: <c:out value="${project.description}"></c:out></td>
    </tr>

    <tr>
        <td>Due Date: <fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
    </tr>
    </tbody>
</table>
<h5><a href="/projects/${project.id}/tasks">See Tasks</a></h5>
<c:if test = "${project.lead.id==userId}">
    <h2><a href="/projects/delete/${project.id}">Delete Project</a></h2>
</c:if>
</body>
</html>