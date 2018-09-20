<%--
  Created by IntelliJ IDEA.
  User: vartanbeno
  Date: 2018-09-19
  Time: 6:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="header">
    <div class="ui container">
        <h1 class="ui center aligned icon header">
            <i class="bookmark outline icon"></i>
            Library System
        </h1>

        <% if ((boolean) request.getSession().getAttribute("loggedIn")) { %>
            <button class="ui tiny inverted right floated button" onclick="window.location.href='logout'">
                <i class="power off icon"></i>Logout
            </button>
        <% } %>
    </div>
</div>
