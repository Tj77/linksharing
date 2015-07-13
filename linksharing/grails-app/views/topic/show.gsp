<%--
  Created by IntelliJ IDEA.
  User: tj
  Date: 9/7/15
  Time: 4:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Topic Details</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style type="text/css">
    #right {
        width: 600px;
        height: 450px;
        float: right;
        padding: 5px;
    }
    #left {
        height: 450px;
        width: 400px;
        float:left;
        padding: 5px;
    }
</style>

</head>

<body><br>

<div id="left">

    <table class="table" border="1" style="width: 75%">
        <tr>
            <td><h4><b>Topic</b></h4></td>
        </tr>
        <tr>
            <td>
                <div style="position: relative;font-size: large">
                    ${topic.name}<span style="font-size: small">(${topic.visibility})</span><br>
                </div><br>

                <div style="position: relative">
                   Subscription<br>${subcount}
                </div>

                <div style="position: relative ;left:100px;bottom: 45px;">
                   Post<br>${rescount}
                </div>
            </td>
        </tr>
    </table>

    <table class="table" border="1" style="width: 75%;">
        <tr>
            <td>
                <h4><b> Topic Subscribed by:</b></h4>
            </td>
        </tr>


        <g:each in="${usersub}" var="item">

            <tr>
                <td>

                    <img src="${createLink(controller: 'user',action: 'viewimage2')}" id="${item.id}" width="80" height="100"/>

                        <div style="position: relative;left: 30%;bottom: 100px">
                            ${item.firstname}${item.id}<br>

                            @${item.username}<br>

                            Topic  :${item.topics.size()}<br>

                            Subscription  :${item.subscriptions.size()}<br><br>

                            <g:link controller="user" action="viewimage2"  id="${item.id}">Click to view photo</g:link>
                        </div>

                </td>
            </tr>
        </g:each>
    </table>

</div>




<div id="right">

    <table class="table" border="1" style="width: 60%">
        <tr>
            <td colspan="2"><h4><b>Post</b></h4></td>
        </tr>

        <g:each in="${resource}" var="item">
            <tr>
                <td>

                   ${item.description}&nbsp;&nbsp;&nbsp;&nbsp;<br>ID : &nbsp;${item.id}<br>
                    <g:if test="${linksharing.DocumentResource.list().any(){
                        if(it.id.equals(item.id))
                            return true
                        else
                            return false
                    }}">

                        <g:link controller="documentResource" action=""  id="${item.id}">Download</g:link>

                    </g:if>

                    <g:else>

                        <g:link controller="linkResource" action="view"  id="${item.id}">view full site</g:link>

                    </g:else>&nbsp;&nbsp;


                    <g:link controller="resource" action="display" id="${item.id}">View post</g:link>
                    <br>&nbsp;

                </td>
            </tr>

        </g:each>
    </table>
<br><br><br>
    <div align="left" > <b><g:link controller="dashboard" action="index"><-- Back</b></g:link></div>

</div>

</body>

</html>