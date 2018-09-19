<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vartanbeno
  Date: 2018-09-19
  Time: 5:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Results</title>
    <jsp:include page="semantic-ui-cdn.jsp" />
</head>
<body>
<jsp:include page="header.jsp" />
<core:forEach var="book" items="${books}">
    <p>${book.title} by ${book.author}</p>
    <p>Id of book is ${book.id}!!</p>
</core:forEach>
</body>
</html>
