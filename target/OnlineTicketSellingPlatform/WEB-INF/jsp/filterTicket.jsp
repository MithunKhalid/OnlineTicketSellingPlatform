<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />


<head>
    <title>Filter Ticket</title>
</head>


<body>






<h2 align="center">Filter Ticket</h2>
<table align="center">
<c:url var="actionPath" value="/menu/filterTicket" />
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
        <td>Ticket type:</td>
        <td>
            <form:select path="ticketType">
                <option value="-1">--Select One--</option>
                            <c:forEach var="ticket" items="${ticketTypeList}">
                                <option value="${ticket.TICKET_NAME}">
                                    <c:out value="${ticket.TICKET_NAME}"/></option>
                            </c:forEach>
            </form:select>
        </td>
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