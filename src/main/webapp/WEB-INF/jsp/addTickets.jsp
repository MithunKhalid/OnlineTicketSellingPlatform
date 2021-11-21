<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />


<head>
    <title>Add Ticket</title>
    <script type="text/javascript" language="javascript">

       function prepareTicketData(){
            var ticketBuyer = document.getElementById("ticketBuyer").value;
            var buyerPhoneNumber = document.getElementById("buyerPhoneNumber").value;
            var departurePlace = document.getElementById("departurePlace").value;
            var destinationPlace = document.getElementById("destinationPlace").value;
            var location = document.getElementById("location").value;
            var startTime = document.getElementById("startTime").value;
            var ticketExpiryDate = document.getElementById("ticketExpiryDate").value;
            var ticketPrice = document.getElementById("ticketPrice").value;
            var ticketType = document.getElementById("ticketType").value;

            const response = new XMLHttpRequest();

            const json = JSON.stringify({
                "ticketBuyer": ticketBuyer,
                "buyerPhoneNumber": buyerPhoneNumber,
                "departurePlace": departurePlace,
                "destinationPlace": destinationPlace,
                "location": location,
                "startTime": startTime,
                "ticketExpiryDate": ticketExpiryDate,
                "ticketPrice": ticketPrice,
                "ticketType": ticketType
            });

            response.open("POST", 'http://localhost:8080/OnlineTicketSellingPlatform/tickets/insertTicketsInfo')
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
<h2 align="center">Add Tickets</h1>
<table align="center">
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
        <td><select id="ticketType">
            <option value="-1">--Select One--</option>
            <c:forEach var="ticket" items="${ticketTypeList}">
                <option value="${ticket.TICKET_NAME}">
                    <c:out value="${ticket.TICKET_NAME}"/></option>
            </c:forEach>
        </select>
        </td>
    </tr>
    <tr>
        <td>Ticket Buyer: </td>
        <td><input type="text" id="ticketBuyer"></td>
    </tr>
     <tr>
         <td>Buyer Contact Number: </td>
         <td><input type="text" id="buyerPhoneNumber"></td>
     </tr>
    <tr>
        <td>Departure Place: </td>
        <td><input type="text" id="departurePlace"></td>
    </tr>

    <tr>
        <td>Destination Place: </td>
        <td><input type="text" id="destinationPlace"></td>
    </tr>

    <tr>
         <td>Location: </td>
         <td><input type="text" id="location"></td>
    </tr>
    <tr>
        <td>Start Time: </td>
        <td><input type="text" id="startTime"></td>
    </tr>
    <tr>
        <td>Ticket Expiry Date: </td>
        <td><input type="text" id="ticketExpiryDate"></td>
    </tr>
    <tr>
        <td>Ticket Price: </td>
        <td><input type="text" id="ticketPrice"></td>
    </tr>
</tr>



<tr>
    <td>
        <button type="submit" onclick="javascript:prepareTicketData()">Submit</button>
        <input type="reset" name="button" id="resetButton" value="Reset" />
    </td>
</tr>
</table>

</body>
</html>