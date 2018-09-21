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
</head>
<body>

<jsp:include page="header.jsp" />
<div class="ui container body">

    <h2 class="ui dividing header">
        Searching for "${query}" by ${searchBy}.
        <div class="sub header">
            ${books.size()} results
        </div>
    </h2>

    <core:if test="${books.size() == 0}">
        <div class="main">
            <div class="ui red message">
                <p>Your search didn't return anything. Try again!</p>
            </div>
        </div>
    </core:if>

    <jsp:include page="books.jsp">
        <jsp:param name="books" value="${books}" />
    </jsp:include>

</div>

</body>
</html>
