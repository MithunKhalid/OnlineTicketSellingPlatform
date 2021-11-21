<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<head>
    <title>Login</title>
</head>


<body>


<table align="center">
<c:url var="actionPath" value="/login/loginForm" />
<form:form commandName="user" action="${actionPath}">
<tr align="center">
    <td align="center" colspan="2">
        <c:if test="${errorMsg != null}">
            <font color="red">
                <c:out value="${errorMsg}"/>
            </font>
        </c:if>
    </td>
</tr>
<h2 align="center">Login</h2>
<tr align="center"></tr>
<tr>
    <td>User Name: </td>
    <td><form:input path="userName" /></td>
    <td><form:errors path="userName" cssClass="error"/></td>
</tr>

<tr>
    <td>Password: </td>
    <td><form:input path="password" type="password"/></td>
    <td><form:errors path="password" cssClass="error"/></td>
</tr>

<tr>
    <td>
        <input type="submit" name="button" id="submitButton" value="Submit" />
        <input type="reset" name="button" id="resetButton" value="Reset" />
    </td>
</tr>
</form:form>
</table>


</body>
</html>