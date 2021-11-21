<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />


<head>
    <title>Dashboard</title>
</head>

<body>
<h2 align="center">Dashboard</h2>
   <table border="1" align="center">
                    <tr>
                        <td>Total Available Ticket: </td>
                        <td><c:out value="${newCount}"/></td>
                    </tr>
                    <tr>
                         <td>Total Purchased Ticket:: </td>
                         <td><c:out value="${purchaseCount}"/></td>
                    </tr>
                    <tr>
                        <td>Total Refund Ticket:: </td>
                        <td><c:out value="${refundCount}"/></td>
                    </tr>

                    <tr>
                        <td>Sold Amount in TK: </td>
                        <td><c:out value="${purchaseSUM}"/></td>
                    </tr>

                    <tr>
                         <td>Refund Amount in TK: </td>
                         <td><c:out value="${refundSUM}"/></td>
                    </tr>
   </table>

</body>
</html>