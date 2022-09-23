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
    <title>Edit Project</title>
</head>
<body>

<h2><a href="/dashboard">Dashboard</a></h2>

<h1>Edit Project</h1>

<form:form action="/projects/edit/${project.id}" method="post" modelAttribute="project">

    <table>
        <thead>
        <tr>
            <td class="float-left">Project Title:</td>
            <td class="float-left">
                <form:errors path="title" class="text-danger"/>
                <form:input class="input" path="title" value="${project.title}"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Project Description:</td>
            <td class="float-left">
                <form:errors path="description" class="text-danger"/>
                <form:textarea rows="4" class="input" path="description" value="${project.description}"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Due Date:</td>
            <td class="float-left">
                <form:errors path="dueDate" class="text-danger"/>
                <form:input path="dueDate" type="date" value="${project.dueDate}"/>
            </td>
        </tr>
        <tr>
            <td colspan=2><input class="input" class="button" type="submit" value="Submit"/></td>
        </tr>
        </thead>
    </table>
</form:form>
</body>
</html>