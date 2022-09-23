<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<body>
<div class="container">
    <h2><a href="/dashboard">Dashboard</a></h2>

    <h1>Project: ${project.title}</h1>
    <h5>Project Lead: ${project.lead.firstName}</h5>

    <form:form action="/projects/${project.id}/tasks" method="post" modelAttribute="task">
        <table>
            <thead>
            <tr>
                <td class="float-left">Add a task ticket for this team:</td>
                <td class="float-left">
                    <form:errors path="name" class="text-danger"/>
                    <form:textarea rows="4" class="input" path="name"/>
                </td>
            </tr>
            <tr>
                <td colspan=2><input class="input" class="button" type="submit" value="Submit"/></td>
            </tr>
            </thead>
        </table>
    </form:form>
    <hr>
    <c:forEach var="task" items="${tasks}">
        <h4>Added by <c:out value="${task.creator.firstName}"></c:out> at <fmt:formatDate value="${task.createdAt}" pattern="h:mm a MMMM dd"/>:</h4>
        <p><c:out value="${task.name}"></c:out></p>
    </c:forEach>
</div>
</body>
</html>