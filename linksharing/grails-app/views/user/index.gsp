<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 14/6/15
  Time: 12:38 AM
--%>

<%@ page import="linksharing.User" contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>HOMEPAGE</title>

</head>

<body>
<g:form style="width: 30%" controller="user" action="login">
    <fieldset>

        <legend align="center">Login</legend>

        <hr width="100%" align="center">


        <table cellpadding="10" cellspacing="0" >

            <tr><td> Username</td><td><g:textField name="username"/></td></tr>

            <tr><td> Password</td><td ><g:passwordField name="password" /></td></tr>



        </table><p/>
         <g:link name="link" action="reset" controller="user">Forgot Password?</g:link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<g:submitButton name="submitbutton" value="Login" />

        <g:if test="${flash.message}">
            <div align="center" style="font-size: large;color: red">${flash.message}</div>
        </g:if>
    </fieldset>


</g:form>


<g:form style="width: 30%" controller="user" action="register">
    <fieldset>
        <legend align="center">User Registration</legend>

        <hr width="100%" align="center">

        <table cellpadding="10" cellspacing="0" >

           <tr><td> First Name*</td><td ><g:textField name="firstname"/></td></tr>

            <tr><td> LastName*</td><td ><g:textField name="lastname"/></td></tr>
            <tr><td>Email*</td><td ><g:textField name="email"  /></td></tr>


            <tr><td> Username*</td><td ><g:textField name="username"/></td></tr>

            <tr><td>Password*</td><td ><g:passwordField name="password" /></td></tr>

            <tr><td>Confirm Password*</td><td ><g:passwordField name="confirm"/></td></tr>



            <tr><td></td><td><g:submitButton name="submitButton" value="Register" /></td></tr>

        </table>
        <g:if test="${flash.message1}">
            <div align="center" style="font-size: large;color: red">${flash.message1}</div>
        </g:if>
    </fieldset>

</g:form >
</body>
</html>
<tr><td>Photo</td><td><g:textField width="1" name="photo"/>&nbsp;&nbsp;&nbsp;<g:actionSubmit action="upload" value="Browse"/></tr>
