<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>



<head>
    <title>Menu List</title>
</head>

<body>

<%
    String role= (String)session.getAttribute("role");
%>

<h2>Menu List</h2>
   <table border="1" align="center">
   <tr>
   <ul>
     <%if(role.equals("ADMIN")){%>
         <li>
            <c:url value="/menu/addNewTickets" var="detailUrl"></c:url>
            <a href="<c:out value="${detailUrl}" />"><c:out value="Add Tickets"/></a>
         </li>
         <li>
            <c:url value="/menu/showTicketsList" var="detailUrl"></c:url>
            <a href="<c:out value="${detailUrl}" />"><c:out value="Ticket List"/></a>
         </li>
        <li>
           <c:url value="/menu/report" var="detailUrl"></c:url>
           <a href="<c:out value="${detailUrl}" />"><c:out value="Dashboard"/>
        </li>
	 <%}%>
     <li>
        <c:url value="/menu/searchTicketByType" var="detailUrl"></c:url>
        <a href="<c:out value="${detailUrl}" />"><c:out value="Filter Tickets"/></a>
     </li>
     <li>
		<c:url value="/menu/searchTicket" var="detailUrl"></c:url>
		<a href="<c:out value="${detailUrl}" />"><c:out value="Search Ticket"/></a>
	 </li>
    <li>
	    <c:url value="/login/logout" var="detailUrl"></c:url>
		    <a href="<c:out value="${detailUrl}" />"><c:out value="Logout"/></a>
		</li>
   </ul>

   </table>

</body>
</html>