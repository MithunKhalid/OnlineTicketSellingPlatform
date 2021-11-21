<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<%
    String username= (String)session.getAttribute("username");
%>
</head>

<body>

<h3 align="right">Welcome <%=username%></h3>
<br/><br/><br/>

</body>

</html>