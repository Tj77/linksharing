<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 15/6/15
  Time: 1:11 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<g:form style="width: 30%" controller="user" action="reset1">
    <fieldset>
    <legend align="center">Password Change</legend>
<table>
    <tr><td>Username<g:textField name="username"  /></td></tr>

        <tr><td> New Password<g:passwordField name="password" /></td></tr>

        <tr><td>Conform Password<g:passwordField name="conformpassword" /></td></tr>



    <tr><td align="center"><g:submitButton name="submitbutton" value="CHANGE"/></td></tr>

</table>
</fieldset>
    </g:form>
    </body>
    </html>
