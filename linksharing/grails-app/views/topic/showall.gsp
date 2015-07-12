<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 9/7/15
  Time: 6:56 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>All Topics</title>

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

<table border="1" style="width: 40%" class="table">

    <h4><b>Topic List</b></h4><br>

    <tr>
        <td><b>Topic</b></td>
        <td><b>Visibility</b></td>
    </tr>

    <g:each in="${topic}" var="tops">
        <tr>
            <td>${tops.name}</td>
            <td>${tops.visibility}</td>
        </tr>
    </g:each>


</table>

<div align="center"> <b><g:link controller="dashboard" action="index"><-- Back</b></g:link></div>

</body>
</html>