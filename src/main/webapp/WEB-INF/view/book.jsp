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
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="ui main text container body">

    <h2 class="ui dividing header">
        ${book.title} <span class="grey text">&mdash;</span> ${book.author}
        <div class="ui breadcrumb" style="width: 100%;">
            <div class="sub header">
                <div class="section">Published ${book.publishingYear} by ${book.publisher}</div>
                <div class="divider"> | </div>
                <div class="section">${book.genre}</div>
                <div class="divider"> | </div>
                <div class="section">${book.numberOfPages}pp.</div>
                <div class="section" style="float: right">
                    <core:choose>
                        <core:when test="${book.available}">
                            Available <i class="green check icon" style="margin-right: 0;"></i>
                        </core:when>
                        <core:otherwise>
                            Unavailable <i class="red x icon" style="margin-right: 0;"></i>
                        </core:otherwise>
                    </core:choose>
                </div>
            </div>
        </div>
    </h2>
    <div class="book description">
        <img class="ui small left floated image" src="${book.imageUrl}" alt="cover of ${book.title}"/>
        <p class="justify preline">${book.description}</p>
    </div>

</div>
</body>
</html>
