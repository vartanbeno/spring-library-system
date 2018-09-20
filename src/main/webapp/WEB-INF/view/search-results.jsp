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
<div class="ui container body">
    <div class="ui divided items">

        <core:forEach var="book" items="${books}">

            <div class="item">
                <div class="ui tiny image">
                    <img src="${book.imageUrl}" alt="cover of ${book.title}" />
                </div>
                <div class="content">
                    <a class="header" href="/book?id=${book.id}">${book.title}</a>
                    <div class="meta">
                        ${book.author}
                    </div>
                    <div class="description">
                        <p><span class="book info">Publisher:</span> ${book.publisher}</p>
                        <p><span class="book info">Publishing year:</span> ${book.publishingYear}</p>
                        <p>
                            <core:choose>
                                <core:when test="${book.available}">
                                    Available <i class="green check icon"></i>
                                </core:when>
                                <core:otherwise>
                                    Unavailable <i class="red x icon"></i>
                                </core:otherwise>
                            </core:choose>
                        </p>
                    </div>
                    <div class="extra">
                        <button class="ui right floated right labeled icon blue button" onclick="window.location.href='/book?id=${book.id}'">
                            <i class="info icon"></i>
                            Information
                        </button>
                    </div>
                </div>
            </div>

        </core:forEach>

    </div>
</div>
</body>
</html>
