<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vartanbeno
  Date: 2018-09-19
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="ui container">
    <div class="main">
        <div class="column">

            <core:if test="${param.instruction != null}">
                <div class="ui warning message">
                    <p>Make sure to include at least one keyword and a searching option in your query.</p>
                </div>
            </core:if>

            <core:if test="${param.error != null}">
                <div class="ui red message">
                    <p>Not a valid book. Try again!</p>
                </div>
            </core:if>

            <h3>Conduct a search</h3>
            <form class="ui form" action="${pageContext.request.contextPath}/search" method="get" autocomplete="off">

                <div class="field">
                    <label for="q">Search for...</label>
                    <input type="text" name="q" id="q" placeholder="Enter keyword(s)" required />
                </div>

                <div class="field">
                    <label>Search by...</label>
                    <div class="inline fields">
                        <c:forEach items="${searchByOptions}" var="option">
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input type="radio" name="by" id="${option}" value="${option}" required ${option eq searchByOptions[0] ? 'checked' : ''} />
                                    <label style="cursor: pointer;" for="${option}">${option}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <button type="submit" class="fluid ui blue button">Search</button>

            </form>

            <button type="button" class="fluid ui black button" onclick="window.location.href='${pageContext.request.contextPath}/browse'">Browse All</button>

        </div>
    </div>
</div>
</body>
</html>
