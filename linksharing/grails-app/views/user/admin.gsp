<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 11/7/15
  Time: 12:03 AM
--%>

<%@ page import="linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <style type="text/css">
    #one {
        width: 100%;
        height:80px;
        padding:5px;
        background-color:lightcyan;
    }

    #left{
        height: 450px;
        width: 400px;
        float:left;
        padding: 5px;
    }

    </style>

</head>
<body>
<div id="one">
    <h3 align="center">LinkSharing</h3>
    <g:form align="right">
        <g:textField name="t" placeholder="search"/>
        <g:submitButton name="s" value="Search"/>
        &nbsp;&nbsp; ${session['fn']} &nbsp;&nbsp;
        <g:select name="n" from="${['Profile','Users','Topics','Posts','Logout']}"/>
        <g:link controller="user" action="logout" >Logout</g:link>
    </g:form></div>


<div id="left">
    <table border="1" class="table">
        <tr><td>Id</td><td>Username</td><td>Email</td><td>Firstname</td><td>Lastname</td><td>Active</td><td>Manage</td></tr>
        <g:each in="${linksharing.User.createCriteria().list {eq("admin",false)}}" var="item" >
        <tr><td><br>
            ${item.id}</td><td>${item.username}</td><td>${item.email}</td><td>${item.firstname}</td><td>${item.lastname}</td><td>
            ${item.active}</td><td>

            <g:if test="${item.active}">

                <g:link controller="user" action="deactivate"  id="${item.id}">deactivate</g:link>


            </g:if>
            <g:else>


                <g:link controller="user" action="activate"  id="${item.id}">activate</g:link>

            </g:else>
        </td></tr>
        </g:each>


        <g:if test="${flash.message}">
            <div align="center" style="font-size: large;color: red">${flash.message}</div>
        </g:if>
    </table>





</div>




</body>
</html>