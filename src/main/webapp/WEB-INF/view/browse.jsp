<%--
  Created by IntelliJ IDEA.
  User: evartbe
  Date: 9/21/2018
  Time: 4:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>All Books</title>
</head>
<body>

<jsp:include page="header.jsp" />
<div class="ui container body">

    <h2 class="ui dividing header">
        All Books
    </h2>

    <jsp:include page="books.jsp">
        <jsp:param name="books" value="${books}" />
    </jsp:include>

</div>

</body>
</html>
