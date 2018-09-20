<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vartanbeno
  Date: 2018-09-19
  Time: 11:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${book.title}</title>
    <jsp:include page="semantic-ui-cdn.jsp" />
</head>
<body>
<jsp:include page="header.jsp" />
<div class="ui main text container body">

    <h2 class="ui dividing header">
        ${book.title} <span class="grey text">&mdash;</span> ${book.author}
        <div class="sub header">
            <core:choose>
                <core:when test="${book.available}">
                    Available <i class="green check icon"></i>
                </core:when>
                <core:otherwise>
                    Unavailable <i class="red x icon"></i>
                </core:otherwise>
            </core:choose>
        </div>
    </h2>
    <div class="book description">
        <img class="ui small left floated image" src="${book.imageUrl}" alt="cover of ${book.title}" />
        <p class="justify preline">${book.description}</p>
    </div>

    <div class="ui grid small text book info">
        <div class="column eight wide left aligned">
            <span class="grey text">Published in ${book.publishingYear} by ${book.publisher}</span>
        </div>
        <div class="column eight wide right aligned">
            <span class="grey text">${book.genre}</span>
        </div>
    </div>

</div>
</body>
</html>
