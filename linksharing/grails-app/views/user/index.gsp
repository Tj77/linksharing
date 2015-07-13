<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 14/6/15
  Time: 12:38 AM
--%>

<%@ page import="linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>


<title>Linksharing</title>



<style type="text/css">
    #one {
        width: 100%;
        height:80px;
        padding:5px;
        background-color:lightcyan;
    }
    #right{
        width: 450px;
        height: 450px;
        float: left;
        padding: 20px;
    }
    #left{
        height: 450px;
        width: 400px;
        float: left;
        padding: 20px;
    }
</style>

</head>

<body>

<div id="one">
    <h3 align="center">LinkSharing</h3>
        <g:form align="right">
            <g:textField name="t" placeholder="search"/>
            <g:submitButton name="s" value="Search"/>
        </g:form>
</div>


<div id="left">

    <g:form controller="user" action="login">
        <fieldset>
            <legend align="center">Login</legend>
                <hr width="100%" align="center">
                    <table cellpadding="10" cellspacing="0" >

                        <tr><td> Username</td><td><g:textField name="username"/></td></tr>

                        <tr><td> Password</td><td ><g:passwordField name="password" /></td></tr>

                    </table><br>

                        <g:link name="link" action="reset" controller="user">Forgot Password?</g:link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <g:submitButton name="submitbutton" value="Login" />

                        <g:if test="${flash.message}">
                            <div align="center" style="font-size: large;color: red">${flash.message}</div>
                        </g:if>
        </fieldset>
    </g:form>

        <br><br>

    <g:uploadForm controller="user" action="register">
            <fieldset>
                <legend align="center">User Registration</legend>
                <hr width="100%" align="center">
                    <g:if test="${flash.message1}">
                        <div align="center" style="font-size: large;color: red">${flash.message1}</div>
                    </g:if>

                <table cellpadding="10" cellspacing="0" >

                    <tr><td> First Name*</td><td ><g:textField name="firstname"/></td></tr>

                    <tr><td> LastName*</td><td ><g:textField name="lastname"/></td></tr>
                    <tr><td>Email*</td><td ><g:textField name="email"  /></td></tr>


                    <tr><td> Username*</td><td ><g:textField name="username"/></td></tr>

                    <tr><td>Password*</td><td ><g:passwordField name="password" /></td></tr>

                    <tr><td>Confirm Password*</td><td ><g:passwordField name="confirmPassword"/></td></tr>

                    <tr><td>Photo</td><td><g:field type="file" name="photo" /></tr>

                    <tr><td></td><td><g:submitButton name="submitButton" value="Register" /></td></tr>

                </table>

            </fieldset>

        </g:uploadForm >
    </div>



<div id="right">
<g:form>

    <fieldset>

        <legend align="center">Recent Shares</legend>

        <hr width="100%" align="center">
        <table cellpadding="2" cellspacing="0" >
            <tr><th>Topic</th>
                <th>User</th>
                <th>Description</th>
            </tr>
            <g:each in="${rec}" var="item">
                <tr>
                    <td>${item.topics.name}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td>${item.topics.user.username}</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.description}</td>
                </tr>
            </g:each><br>

        </table>
            </fieldset>

</g:form>



    <g:form >

        <fieldset>

            <legend align="center">Top post</legend>
            <hr width="100%" align="center">
            <table cellpadding="2" cellspacing="5">

                <tr>
                    <th>Post</th>
                    <th>User</th>
                </tr>
                <g:each in="${top}" var="item">
                    <tr>
                        <td>${item.resources.description}&nbsp;&nbsp;&nbsp;</td>
                        <td>${item.user.username}</td>
                    </tr>
                </g:each>
            </table>
        </fieldset>

    </g:form>
</div>


</body>
</html>
