<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: evartbe
  Date: 9/21/2018
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="ui divided items" id="list-view">

    <core:forEach var="book" items="${books}">

        <div class="item">

            <div class="ui tiny image">
                <img class="book cover" src="${book.imageUrl}" alt="cover of ${book.title}" onclick="window.location.href='${pageContext.request.contextPath}/book?id=${book.id}'" />
            </div>

            <div class="content">

                <div class="header" style="width: 100%; position: relative;">
                    <a href="${pageContext.request.contextPath}/book?id=${book.id}">${book.title}</a>
                    <button onclick="window.location.href='${pageContext.request.contextPath}/book?id=${book.id}'"
                            class="circular ui mini icon right floated blue button"
                            style="position: absolute; right: 0;">
                        <i class="info icon"></i>
                    </button>
                </div>

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

            </div>

        </div>

    </core:forEach>

</div>

<div id="grid-view" style="display: none;">
    <core:forEach var="book" items="${books}">

        <div class="book cover" onclick="window.location.href='${pageContext.request.contextPath}/book?id=${book.id}'">
            <img src="${book.imageUrl}" alt="cover of ${book.title}" width="150px">
            <div class="book title and author">
                <p class="ui header title">${book.title}</p>
                <p class="grey text">${book.author}</p>
            </div>
        </div>

    </core:forEach>
</div>

<script>
    $('#grid-button').click(function() {
        $('#list-view').css('display', 'none');
        $('#grid-view').css('display', '');
        $('#list-button').css('display', '');
        $('#grid-button').css('display', 'none');
    })

    $('#list-button').click(function() {
        $('#list-view').css('display', '');
        $('#grid-view').css('display', 'none');
        $('#list-button').css('display', 'none');
        $('#grid-button').css('display', '');
    })
</script>
