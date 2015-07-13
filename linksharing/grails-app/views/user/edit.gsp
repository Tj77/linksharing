<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 9/7/15
  Time: 3:18 PM
--%>

<%@ page import="linksharing.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style>
   #one{

        height:100px;
        width: 100%;
        padding:5px;
        background-color: lightcyan;
    }
    #left {
        height: 450px;
        width: 400px;
        float: left;
        padding: 5px;
    }
</style>
</head>

<body>

<div id="one">
    <h3 align="center"><b>LinkSharing</b></h3>
        <g:form controller="resource" action="search" >
            <g:textField name="search" placeholder="search" />
            <g:submitButton name="search" value="Search"/>
            <g:link controller="user" action="logout"  >Logout</g:link>&nbsp;
            <g:link controller="dashboard"  > <--Back</g:link>
        </g:form>
</div>

<br>

<fieldset style="width: 20%;;border: solid" >

    <img class="Photo" src="${createLink(controller: 'user',action: 'viewImage')}" width="80" height="100"/>

        <div style=";position: relative;left: 105px;bottom: 90px;">
             ${user.firstname}<br>
             @${user.username}<br>

             <g:each in="${user}" var="item">

                 User Id:&nbsp;&nbsp;&nbsp;${item.id}</g:each> <br>

                <g:link controller="topic" action="alltopic">Topic :${user.topics.size()}</g:link><br>

                <g:link controller="subscription" action="show">Subscription :${subs.size()}</g:link>
        </div>

</fieldset><br>


<div id="left" style="position: relative;left:400px;bottom: 230px;">

    <table border="1" class="table">
        <tr>
            <td><h4><b>Profile</b></h4></td>
        </tr>


        <g:uploadForm controller="user" action="update" align="right">
            <tr>
                <td>
                    <label >First Name*:</label>&nbsp;&nbsp;&nbsp;&nbsp;<g:textField name="firstname"/>
                        <br><br>
                    <label>Last Name*:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:textField name="lastname"/>
                         <br><br>
                    <label>Username*:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:textField name="username"/>
                            <br><br>
                    <label>Photo:</label><g:field type="file" name="photo" align="right"/><br>

                    <g:submitButton name="Update"/>
                </td>
            </tr>
        </g:uploadForm>


    </table>


    <br>

    <table  border="1" class="table">
        <tr>
            <td colspan="2"><h4><b>Change Password</b></h4></td>
        </tr>

        <tr>
            <td>
                <g:uploadForm controller="user" action="change" align="right">
                    <br>
                    <label>Password:</label>
                    <g:passwordField name="password"/><br><br>
                    <label>Confirm Password:</label>
                    <g:passwordField name="confirmPassword"/><br><br>
                    <g:submitButton name="Update"/>
                </g:uploadForm>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
