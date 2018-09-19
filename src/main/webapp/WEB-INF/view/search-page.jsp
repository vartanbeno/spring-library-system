<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="semantic-ui-cdn.jsp" />
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
    <div class="main">
        <div class="column">
            <h3>Conduct a search</h3>
            <form class="ui form" action="search" method="get">

                <div class="field">
                    <label for="q">Search for...</label>
                    <input type="text" name="q" id="q" placeholder="Enter keyword(s)" />
                </div>

                <div class="field">
                    <label>Search by...</label>
                    <div class="inline fields">
                        <c:forEach items="${searchByOptions}" var="option">
                            <div class="field">
                                <div class="ui radio checkbox">
                                    <input type="radio" name="by" id="${option}" value="${option}" />
                                    <label style="cursor: pointer;" for="${option}">${option}</label>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </form>
        </div>
    </div>
</body>
</html>
