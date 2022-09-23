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
    <title>Project Manager Dashboard</title>
</head>
<body>

<h1>Project Manager Dashboard</h1>
<p>Welcome, ${user.firstName}</p>
<p><a href="/logout">Log Out</a></p>

<h4>All Projects</h4>
<p><a href="/projects/new">Add Project</a></p>
<table>
    <thead>
    <tr>
        <th>Project</th>
        <th>Team Lead</th>
        <th>Due Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="project" items="${unassignedProjects}">
        <tr>
            <c:if test = "${project.lead.id!=user.id}">
                <td><a href="/projects/${project.id}">${project.title}</a></td>
                <td><c:out value="${project.lead.firstName}"></c:out></td>
                <td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
                <td><a href="/dashboard/join/${project.id}">Join Team</a></td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>

<hr>
<h4>Your Projects</h4>
<table>
    <thead>
    <tr>
        <th>Project</th>
        <th>Team Lead</th>
        <th>Due Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="project" items="${assignedProjects}">
        <tr>
            <td><a href="/projects/${project.id}">${project.title}</a></td>
            <td><c:out value="${project.lead.firstName}"></c:out></td>
            <td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
            <c:if test = "${project.lead.id==user.id}">
                <td><a href="/projects/edit/${project.id}">Edit Project</a></td>
            </c:if>
            <c:if test = "${project.lead.id!=user.id}">
                <td><a href="/dashboard/leave/${project.id}">Leave Team</a></td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>