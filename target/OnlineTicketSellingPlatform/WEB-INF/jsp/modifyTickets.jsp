<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />


<head>
    <title>Modify Ticket</title>
    <script type="text/javascript" language="javascript">

        function loadTicketsData(){
            var ticketID ="${ticket.ticketID}";
            var ticketBuyer ="${ticket.ticketBuyer}";
            var buyerPhoneNumber ="${ticket.buyerPhoneNumber}";
            var departurePlace ="${ticket.departurePlace}";
            var destinationPlace ="${ticket.destinationPlace}";
            var location ="${ticket.location}";
            var startTime ="${ticket.startTime}";
            var ticketExpiryDate ="${ticket.ticketExpiryDate}";
            var ticketPrice ="${ticket.ticketPrice}";
            var ticketType ="${ticket.ticketType}";

            document.getElementById("ticketID").value = ticketID;
            document.getElementById("ticketBuyer").value = ticketBuyer;
            document.getElementById("buyerPhoneNumber").value = buyerPhoneNumber;
            document.getElementById("departurePlace").value = departurePlace;
            document.getElementById("destinationPlace").value = destinationPlace;
            document.getElementById("location").value = location;
            document.getElementById("startTime").value = startTime;
            document.getElementById("ticketExpiryDate").value = ticketExpiryDate;
            document.getElementById("ticketPrice").value = ticketPrice;
            document.getElementById("ticketType").innerHTML = ticketType;
        }

       function prepareTicketData(){
            var ticketID = document.getElementById("ticketID").value;
            var ticketBuyer = document.getElementById("ticketBuyer").value;
            var buyerPhoneNumber = document.getElementById("buyerPhoneNumber").value;
            var departurePlace = document.getElementById("departurePlace").value;
            var destinationPlace = document.getElementById("destinationPlace").value;
            var location = document.getElementById("location").value;
            var startTime = document.getElementById("startTime").value;
            var ticketExpiryDate = document.getElementById("ticketExpiryDate").value;
            var ticketPrice = document.getElementById("ticketPrice").value;
            var ticketType ="${ticket.ticketType}";

            const response = new XMLHttpRequest();

            const json = JSON.stringify({
                "ticketID": ticketID,
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

            response.open("POST", 'http://localhost:8080/OnlineTicketSellingPlatform/tickets/updateTicketsInfo/'+ticketID)
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


<body onload="loadTicketsData();">
<h2 align="center">Modify Tickets</h2>
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
       <td>Ticket Type: </td>
       <td><label id="ticketType">test</label></td>
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
         <td>location: </td>
         <td><input type="text" id="location"></td>
    </tr>
    <tr>
        <td>start Time: </td>
        <td><input type="text" id="startTime"></td>
    </tr>
    <tr>
        <td>Ticket Expiry Date: </td>
        <td><input type="text" id="ticketExpiryDate"></td>
    </tr>
    <tr>
        <td>ticketPrice: </td>
        <td><input type="text" id="ticketPrice"></td>
        <td><input type="hidden" id="ticketID"></td>
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