<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="header.jsp" />
<jsp:include page="adminMenu.jsp" />


<head>
    <title>Ticket List</title>
    <script type="text/javascript" language="javascript">

    function loadTicketsData(){
        const request = new XMLHttpRequest();
		const url = 'http://localhost:8080/OnlineTicketSellingPlatform/tickets/getAllTicketsInfo';
		request.open("GET", url);
		request.send();
		var result = [];

		request.onload = (e) => {
			//alert(request.response);
			const jsonResponse = JSON.parse(request.response);
			//alert(jsonResponse.tickets.length);
			//console.log(jsonResponse.tickets.length);
			//console.log(jsonResponse.tickets[0]);
			for (var i = 0; i < jsonResponse.tickets.length; i++) {
				//console.log(jsonResponse.tickets[i]);
				result.push(jsonResponse.tickets[i]);
			}
			var iterator = result.values();

			// Here all the elements of the array is being printed.
			for (let elements of iterator) {
			  console.log(elements);
			}

			var table = "" ;

		for(var i in result){

			if(result[i].buyerPhoneNumber==null){
				result[i].buyerPhoneNumber = "";
			}
			if(result[i].departurePlace==null){
				result[i].departurePlace = "";
			}
			if(result[i].destinationPlace==null){
				result[i].destinationPlace = "";
			}
			if(result[i].location==null){
				result[i].location = "";
			}
			if(result[i].startTime==null){
				result[i].startTime = "";
			}
			if(result[i].ticketIssueDate==null){
				result[i].ticketIssueDate = "";
			}
			if(result[i].ticketExpiryDate==null){
				result[i].ticketExpiryDate = "";
			}

			var modifyURL = "http://localhost:8080/OnlineTicketSellingPlatform/menu/selectTicket/"+result[i].ticketID;

					table += "<tr>";
					table += "<td>"
					+ result[i].ticketType +"</td>"
					+ "<td>" + result[i].ticketBuyer +"</td>"
					+ "<td>" + result[i].buyerPhoneNumber +"</td>"
					+ "<td>" + result[i].ticketIssueDate +"</td>"
					+ "<td>" + result[i].ticketExpiryDate +"</td>"
					+ "<td>" + result[i].location +"</td>"
					+ "<td>" + result[i].startTime +"</td>"
					+ "<td>" + result[i].departurePlace +"</td>"
					+ "<td>" + result[i].destinationPlace +"</td>"
					+ "<td>" + result[i].ticketPrice +"</td>"
					+ "<td>" + '<a href="<c:url value="'+modifyURL+'"/>">Modify Ticket</a>' +"</td>";
					table += "</tr>";
		}

		document.getElementById("result").innerHTML = table;

		}

    }
    </script>
</head>


<body onload="loadTicketsData();">
<h2 align="center">Ticket List</h2>
			<table align="center" border="1">
				<thead>
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
				</thead>
				<tbody id= "result"></tbody>
			</table>

</body>
</html>