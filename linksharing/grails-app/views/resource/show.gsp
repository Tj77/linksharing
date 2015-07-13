<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 10/7/15
  Time: 1:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style type="text/css">

#one {

    height:100px;
    width: 100%;
    padding:5px;
    background-color: lightcyan;
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
<br>

<table class="table" border="1" style="width: 40%">
    <tr>
        <td>
            <div> ${res.topics.user.firstname} &nbsp;&nbsp;&nbsp;&nbsp;<br>@${res.topics.user.username}
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${res.topics.user.dateCreated}

                <br><br>

                ResourceId :  &nbsp;&nbsp;&nbsp;${res.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br>
                &nbsp;&nbsp;${res.description}
            </div>

        </td>
    </tr>

</table>



<div style="position: relative;left: 50%;bottom: 27%;width: 40%">

    <table border="1" class="table" >
        <tr>
            <td colspan="2"><h4><b>Resource</b></h4></td>
        </tr>

       <tr>
           <td>
               <br>Topic Name : &nbsp;${rt.resources.topics.name}<br>
                    Topic Id :&nbsp;${rt.resources.topics.id}
           </td>
       </tr>

        <tr>
            <td>
                <div>Rating&nbsp;&nbsp;&nbsp;&nbsp;<g:select name="score" from="${1..10}" value="${rt.score}"></g:select>
                </div>
            </td>
        </tr>

    </table>
</div>

<div align="center" > <b><g:link controller="dashboard" action="index"><-- Back</b></g:link></div>

</body>

</html>