<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />

<%
    String role= (String)session.getAttribute("role");
%>

<head>
    <title>Ticket List</title>
    <script>
    		function refundTicket(value){
    			alert(value);
    			var ticketID =value;

    			 const response = new XMLHttpRequest();

                            const json = JSON.stringify({
                                "ticketID": ticketID,
                                "ticketStatus": "Refund",
                                "ticketBuyer": "",
                                "buyerPhoneNumber": ""
                            });

                            response.open("POST", 'http://localhost:8080/OnlineTicketSellingPlatform/tickets/updateTicketsInfoByStatus/'+ticketID)
                            response.setRequestHeader('Content-Type', 'application/json');

                            response.send(json);

                            response.onload = (e) => {
                                const jsonResponse = JSON.parse(response.response);
                                alert(jsonResponse.responseMsg);
                                //alert(response.response);
                            }
    		}
    </script>
</head>

<body>
        <h2 align="center">Ticket List</h2>
        <table border="1" align="center">
            <tr>
                <th>Ticket Type</th>
                <th>Ticket Buyer</th>
                <th>Buyer Phone Number</th>
                <th>Ticket Issue Date</th>
                <th>Ticket Expiry Date</th>
                <th>location</th>
                <th>Start Time</th>
                <th>Departure Place</th>
                <th>Destination Place</th>
                <th>Ticket Price</th>
            </tr>
            <c:forEach items="${ticketList}" var="ticket">
                <tr>
                    <td><c:out value="${ticket.ticketType}"/></td>
                    <td><c:out value="${ticket.ticketBuyer}"/></td>
                    <td><c:out value="${ticket.buyerPhoneNumber}"/></td>
                    <td><c:out value="${ticket.ticketIssueDate}"/></td>
                    <td><c:out value="${ticket.ticketExpiryDate}"/></td>
                    <td><c:out value="${ticket.location}"/></td>
                    <td><c:out value="${ticket.startTime}"/></td>
                    <td><c:out value="${ticket.departurePlace}"/></td>
                    <td><c:out value="${ticket.destinationPlace}"/></td>
                    <td><c:out value="${ticket.ticketPrice}"/></td>
                    <%if(role.equals("ADMIN")){%>
                        <td>
                           <c:url value="/menu/selectTicket/${ticket.ticketID}" var="detailUrl">
                           </c:url>
                           <a href="<c:out value="${detailUrl}" />">Modify</a>
                        </td>
                    <%}%>
                    <td>
                       <c:url value="/menu/purchaseTicket/${ticket.ticketID}" var="detailUrl">
                       </c:url>
                       <a href="<c:out value="${detailUrl}" />">Purchase</a>
                    </td>
                    <td><a href="javascript:refundTicket('${ticket.ticketID}');"> Refund Ticket</a></td>
                </tr>

            </c:forEach>
        </table>
</body>
</html>