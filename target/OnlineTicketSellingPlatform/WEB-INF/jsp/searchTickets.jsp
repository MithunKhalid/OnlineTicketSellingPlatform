<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />

<head>
    <title>Search Ticket</title>
</head>


<body>






<h2 align="center">Search Ticket</h2>
<table align="center">
<c:url var="actionPath" value="/menu/searchTicket" />
<form:form commandName="ticket" action="${actionPath}">
<tr align="center">
    <td align="center" colspan="2">
        <c:if test="${errorMsg != null}">
            <font color="red">
                <c:out value="${errorMsg}"/>
            </font>
        </c:if>
    </td>
</tr>


<tr>
    <td>Buyer Phone Number: </td>
    <td><form:input path="buyerPhoneNumber" size="22"/></td>
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