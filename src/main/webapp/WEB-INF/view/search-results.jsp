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
<div class="ui container search results">
    <div class="ui divided items">

        <core:forEach var="book" items="${books}">

            <div class="item">
                <div class="ui tiny image">
                    <img src="${book.imageUrl}" alt="cover of ${book.title}" />
                </div>
                <div class="content">
                    <a class="header">${book.title}</a>
                    <div class="meta">
                        ${book.author}
                    </div>
                    <div class="description">
                        <p><span class="book info">Publisher:</span> ${book.publisher}</p>
                        <p><span class="book info">Publishing year:</span> ${book.publishingYear}</p>
                    </div>
                    <div class="extra">
                        <div class="ui right floated right labeled icon blue button">
                            <i class="info icon"></i>
                            Information
                        </div>
                    </div>
                </div>
            </div>

        </core:forEach>

    </div>
</div>
</body>
</html>
