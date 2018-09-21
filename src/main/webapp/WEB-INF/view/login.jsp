<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: vartanbeno
  Date: 2018-09-19
  Time: 1:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign In</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="ui container">
    <div class="main">
        <div class="column">

            <core:if test="${param.error != null}">
                <div class="ui red message">
                    <p>Incorrect username and/or password.</p>
                </div>
            </core:if>

            <core:if test="${param.warning != null}">
                <div class="ui warning message">
                    <p>You must log in to proceed.</p>
                </div>
            </core:if>

            <core:if test="${param.logout != null}">
                <div class="ui positive message">
                    <p>You have successfully logged out.</p>
                </div>
            </core:if>

            <h3>Sign In</h3>
            <form:form cssClass="ui form" action="${pageContext.request.contextPath}/authenticate" modelAttribute="user" method="post" autocomplete="off">

                <div class="field">
                    <label for="username">Username</label>
                    <div class="ui left icon input">
                        <form:input type="text" path="username" placeholder="Username" required="required" />
                        <i class="user icon"></i>
                    </div>
                </div>

                <div class="field">
                    <label for="password">Password</label>
                    <div class="ui left icon input">
                        <form:input type="password" path="password" placeholder="Password" required="required" />
                        <i class="lock icon"></i>
                    </div>
                </div>

                <button type="submit" class="fluid ui blue button">Login</button>

            </form:form>
        </div>
    </div>
</div>
</body>
</html>
