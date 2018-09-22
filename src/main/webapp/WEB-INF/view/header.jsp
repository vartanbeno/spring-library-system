<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vartanbeno
  Date: 2018-09-19
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="js-css.jsp" />
<div id="header">
    <div class="ui container">
        <h1 class="ui center aligned icon header">
            <i class="bookmark outline icon"></i>
            Library System
        </h1>

        <% if ((boolean) request.getSession().getAttribute("loggedIn")) { %>
        <button class="ui tiny inverted left floated button" onclick="window.location.href='${pageContext.request.contextPath}/'">
            <i class="search icon"></i>Search
        </button>
        <button class="ui tiny inverted left floated button" onclick="window.location.href='${pageContext.request.contextPath}/random'">
            <i class="random icon"></i>Random
        </button>
        <core:if test="${pageContext.request.requestURI.endsWith('/search-results.jsp') || pageContext.request.requestURI.endsWith('/browse.jsp')}">
            <button class="ui tiny inverted left floated button" id="list-button" style="display: none;">
                <i class="list ul icon"></i>List
            </button>
            <button class="ui tiny inverted left floated button" id="grid-button">
                <i class="table icon"></i>Grid
            </button>
        </core:if>
        <button class="ui tiny inverted right floated button" onclick="window.location.href='${pageContext.request.contextPath}/logout'">
            <i class="power off icon"></i>Logout
        </button>
        <% } %>
    </div>
</div>
