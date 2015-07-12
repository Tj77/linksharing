<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 9/7/15
  Time: 7:03 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Subscription</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style type="text/css">
    #one {
        width: 100%;
        height:100px;
        padding:5px;
        background-color:lightcyan;
    }
</style>
</head>

<body>

<div id="one">
    <h3 align="center">LinkSharing</h3>

        <g:form align="right" controller="topic" action="search" >

            &nbsp;&nbsp; ${session['f']} &nbsp;&nbsp;

                <g:link controller="user" action="logout" >Logout</g:link>

        </g:form>
</div>


<table class="table" border="1" style="width: 40%">

    <h4><b>List of Subscribed topics</b></h4><br>

        <tr>
            <td><b>Topic</b></td>
            <td><b>User</b></td>
            <td><b>Seriousness</b></td>
        </tr>

            <g:each in="${subs}" var="item">
        <tr>
            <td>${item.topics.name}</td>
            <td>${item.user.username}</td>
            <td>${item.seriousness}</td>
        </tr>

    </g:each>

</table>

<div align="center" > <b><g:link controller="dashboard" action="index"><-- Back</b></g:link></div>

</body>

</html>

