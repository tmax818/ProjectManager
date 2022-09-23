<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Project Manager</title>
</head>
<body>

<h1>Project Manager</h1>
<p>A place for teams to manage projects.</p>

<form:form action="/register" method="post" modelAttribute="newUser">

    <table>
        <thead>
        <tr>
            <td colspan="2">Register</td>
        </tr>
        </thead>
        <thead>
        <tr>
            <td class="float-left">First Name:</td>
            <td class="float-left">
                <form:errors path="firstName" class="text-danger"/>
                <form:input class="input" path="firstName"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Last Name:</td>
            <td class="float-left">
                <form:errors path="lastName" class="text-danger"/>
                <form:input class="input" path="lastName"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Email:</td>
            <td class="float-left">
                <form:errors path="email" class="text-danger"/>
                <form:input class="input" path="email"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Password:</td>
            <td class="float-left">
                <form:errors path="password" class="text-danger"/>
                <form:input class="input" path="password"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Confirm PW:</td>
            <td class="float-left">
                <form:errors path="confirm" class="text-danger"/>
                <form:input class="input" path="confirm"/>
            </td>
        </tr>
        <tr>
            <td colspan=2><input class="input" class="button" type="submit" value="Submit"/></td>
        </tr>
        </thead>
    </table>
</form:form>
<hr>
<form:form action="/login" method="post" modelAttribute="newLogin">

    <table>
        <thead>
        <tr>
            <td colspan="2">Log In</td>
        </tr>
        </thead>
        <thead>
        <tr>
            <td class="float-left">Email:</td>
            <td class="float-left">
                <form:errors path="email" class="text-danger"/>
                <form:input class="input" path="email"/>
            </td>
        </tr>
        <tr>
            <td class="float-left">Password:</td>
            <td class="float-left">
                <form:errors path="password" class="text-danger"/>
                <form:input class="input" path="password"/>
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