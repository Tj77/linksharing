<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 10/7/15
  Time: 11:45 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style>

    #one {

        height:110px;
        width: 100%;
        padding:5px;
        background-color: lightcyan;
    }
    #two{
        height: 450px;
        width: 400px;
        float:left;
        padding: 5px;
    }
</style>

</head>

<body>

<div id="one">
    <h3 align="center"><b>LinkSharing</b></h3>

         ${user.firstname}&nbsp;&nbsp;&nbsp;&nbsp;@${user.username}

            <g:form controller="resource" action="search" >
                <g:textField name="search" placeholder="search" />
                <g:submitButton name="search" value="Search"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <g:link controller="user" action="logout" >Logout</g:link>&nbsp;&nbsp;

             </g:form>
</div>

<div id="two">
    <table class="table" border="1" style="width: 75%">
        <tr>
            <td><h4><b>Link Document</b></h4></td>
        </tr>

        <tr>
            <td>
                <div >${lkres.description}<span style="font-size: small">&nbsp;&nbsp;&nbsp;ID:(${lkres.id})</span><br>
                </div>
                    <br>
                        RESOURCE URL:&nbsp;&nbsp; ${lkres.url}<br>
                <div>
                        TOPIC ID:&nbsp;&nbsp; ${lkres.topics.id}
                </div>

            </td>
        </tr>
    </table>

    <div align="right" > <b><g:link controller="dashboard" action="index"><-- Back</b></g:link></div>

</div>


</body>
</html>