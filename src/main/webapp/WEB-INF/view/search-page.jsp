<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
            <h3>Search</h3>
            <form:form cssClass="ui form" action="search" method="get">
                <div class="field">
                    <label for="q">Search for...</label>
                    <form:input path="q" placeholder="Enter keyword(s)" />
                </div>
                <div class="field">
                    <label for="by">Search by...</label>
                    <form:checkboxes path="by" items="${searchByOptions}" />
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>
