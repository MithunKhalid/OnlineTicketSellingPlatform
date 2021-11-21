<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />


<head>
    <title>Purchase Ticket</title>
    <script type="text/javascript" language="javascript">

        function loadTicketsData(){
            var ticketID ="${ticket.ticketID}";
            var departurePlace ="${ticket.departurePlace}";
            var destinationPlace ="${ticket.destinationPlace}";
            var location ="${ticket.location}";
            var startTime ="${ticket.startTime}";
            var ticketExpiryDate ="${ticket.ticketExpiryDate}";
            var ticketPrice ="${ticket.ticketPrice}";
            var ticketType ="${ticket.ticketType}";

            document.getElementById("ticketID").innerHTML = ticketID;
            document.getElementById("departurePlace").innerHTML = departurePlace;
            document.getElementById("destinationPlace").innerHTML = destinationPlace;
            document.getElementById("location").innerHTML = location;
            document.getElementById("startTime").innerHTML = startTime;
            document.getElementById("ticketExpiryDate").innerHTML = ticketExpiryDate;
            document.getElementById("ticketPrice").innerHTML = ticketPrice;
            document.getElementById("ticketType").innerHTML = ticketType;

            var ticketID = "${ticket.ticketID}";
            var ticketBuyer = document.getElementById("ticketBuyer").value;
            var buyerPhoneNumber = document.getElementById("buyerPhoneNumber").value;
        }

       function prepareTicketData(){
            var ticketID = "${ticket.ticketID}";
            var ticketBuyer = document.getElementById("ticketBuyer").value;
            var buyerPhoneNumber = document.getElementById("buyerPhoneNumber").value;


            const response = new XMLHttpRequest();

            const json = JSON.stringify({
                "ticketID": ticketID,
                "ticketBuyer": ticketBuyer,
                "ticketStatus": "Purchase",
                "buyerPhoneNumber": buyerPhoneNumber
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


<body onload="loadTicketsData();">
<h2 align="center">Purchase Tickets</h2>
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
        <td><label id="departurePlace">test</label></td>
    </tr>

    <tr>
        <td>Destination Place: </td>
        <td><label id="destinationPlace"></td>
    </tr>

    <tr>
         <td>location: </td>
         <td><label id="location"></td>
    </tr>
    <tr>
        <td>start Time: </td>
        <td><label id="startTime"></td>
    </tr>
    <tr>
        <td>Ticket Expiry Date: </td>
        <td><label id="ticketExpiryDate"></td>
    </tr>
    <tr>
        <td>ticketPrice: </td>
        <td><label id="ticketPrice"></td>
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