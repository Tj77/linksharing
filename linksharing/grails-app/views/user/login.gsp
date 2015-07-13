

<%@ page  import="groovy.Visibility; linksharing.User;groovy.Seriousness; linksharing.Topic" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>DashBoard</title>
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
    #right{
        height: 600px;
        width: 450px;
        float:right;
        padding: 5px;

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
        <g:form align="right" controller="topic" action="search" >
                <g:textField name="search" placeholder="search"/>
                <g:submitButton name="s" value="Search"/>
                &nbsp;&nbsp; ${session['f']} &nbsp;&nbsp;
                <g:select name="n" from="${['Profile','Users','Topics','Posts','Logout']}"/>
                <g:link controller="user" action="logout" >Logout</g:link>
                <g:link controller="user" action="edit">Edit Profile</g:link>
        </g:form>
</div>



<fieldset style="width: 20%;height: 23%;border: solid  " >


        <img class="Photo" src="${createLink(controller: 'user',action: 'viewImage')}" width="80" height="100"/>


        <div style="font-size: large ;position: relative;left: 105px;bottom: 90px;">
             ${user.firstname}<br>

             @${user.username}<br>

            <g:each in="${user}" var="item">

                 User Id:&nbsp;&nbsp;&nbsp;${item.id}</g:each> <br>

                 <g:link controller="topic" action="alltopic">Topic :${topic.size()}</g:link><br>

                 <g:link controller="subscription" action="show">Subscription :${subs.size()}</g:link>
        </div>

</fieldset>
<br>

<div id= "right" style="position: relative;bottom: 130px;">

    <table border="1" class="table">
        <tr>
            <td colspan="2"><h4><b>Inbox</b></h4></td>
        </tr>

        <g:each in="${ritem}" var="item">
            <tr>
                <td>

                    <img class="Photo" src="${createLink(controller: 'user',action: 'viewimage1') }" id="${item.id}" width="80" height="100"/>
                <td>
                    ${item.topics.user.firstname}<br>
                    @${item.topics.user.username}<br>
                    ${item.description} <br>Resource Id :${item.id}<br><br>

                        <g:if test="${linksharing.DocumentResource.list().any(){if(it.id.equals(item.id))
                                return true
                            else
                                return false }}">

                            <g:link controller="documentResource" action="" >Download</g:link>

                        </g:if>
                    <g:else>

                        <g:link controller="linkResource" action="view"  id="${item.id}">view full site</g:link>

                    </g:else>

                        <g:link controller="resource" action="display" id="${item.id}">View post</g:link>&nbsp;&nbsp;

                    <g:if test="${item.readingItems.any(){ if(it.isRead.equals(false))
                            return true
                        else
                            return false }}">
               
                        <g:remoteLink controller="readingItem" action="read" id="${item.id}">Mark as Read</g:remoteLink>
                        <br>

                    </g:if>

                    <g:else>
                        <g:remoteLink controller="readingItem" action="notread" id="${item.id}">Mark as Unread</g:remoteLink>
                    </g:else><br>
            </g:each>

        </td>
    </tr>
</table>

    <br><br>

<table class="table" border="1">
        <tr>
            <td colspan="2"><h4><b>Share Document</b></h4></td>
        </tr>
        <tr>
            <td>
                <g:form controller="documentResource" action="create">
                    <label for="path">Document:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <g:field type="file" name="path"/><br>
                    <label for="description">Description:</label>
                    <g:textArea name="description"/><br>
                    <label for="topics">Topic:</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <g:select name="topics" optionKey="id" value="topic.id" from="${topic.asList()}"/><br>&nbsp;&nbsp;&nbsp;
                    <g:submitButton name="submit"/>
                </g:form>
            </td>
        </tr>
</table>
    <br><br>


<table class="table" border="1">
        <tr>
            <td><h4><b>Share Link</b></h4></td>
        </tr>
        <tr>
            <td>
                <g:form controller="linkResource" action="create" align="right">
                    <label for="url">Link:</label>
                    <g:textField name="url"/><br>
                    <label for="description">Description:</label>
                    <g:textArea name="description"/><br>
                    <label for="topics">Topic:</label>
                    <g:select name="topics" optionKey="id" value="topic.id" from="${topic.asList()}"/><br>
                    <g:submitButton name="submit"/>
                </g:form>
            </td>
        </tr>
</table>

    <br><br>


    <table  class="table" border="1" >
        <tr>
            <td colspan="2"><h4><b>Create Topics</b></h4></td>
        </tr>
        <tr><td>
            <g:form controller="topic" action="create" >
                <label>Name:</label>
                <g:textField name="name"/><br><br>
                <label>Visibility:</label>

                <g:select name="visibility" from="${groovy.Visibility}"/><br><br>
                <g:submitButton name="save"/>
                <g:actionSubmit action="cancel" value="cancel" name="cancel"/>
            </g:form>
        </td></tr>
    </table>
</div>


<div  id="left" >
<div>
    <table border="1" class="table">
        <tr>
            <td colspan="2"><h3><b>Subscription</b></h3>@${session['usr']}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Subscription :<g:link controller="subscription" action="show">${subs.size()}</g:link>&nbsp;&nbsp;&nbsp;&nbsp;
                <g:link controller="subscription" action="show" style="position:relative;left:60px;bottom: 30px">View All</g:link>
            </td>
        </tr>

        <g:each in="${subs}" var="item">

            <tr>
                <td>
                    <br>
                    <g:link controller="topic" action="show1" params="[topic:item.topics.id]">

                        ${item.topics.name}(Id :${item.topics.id})

                    </g:link>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        User Id:&nbsp;&nbsp;&nbsp;${item.topics.user.id}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <g:link controller="subscription" action="unsubscribe" id="${item.id}">Unsubscribe</g:link>

                </td>
            </tr>
        </g:each>


    </table>
</div>

        <br><br>

<div >
    <table border="1" class="table">
        <tr>
            <td colspan="2"><h3><b>Trending Topic</b></h3>@${session['usr']}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                Subscription :<g:link controller="subscription" action="show">${subs.size()}</g:link>&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>

        <g:each in="${topres}" var="item">

            <tr>
                <td><br>
                     ${item.key.name}(Id :${item.key.id})<br><br>${item.key.user.firstname}(Id :${item.key.user.id})&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <g:if test="${subs.any(){if(it.topics.id.equals(item.key.id))
                    return true
                        else
                    return false }}">

                    <g:remoteLink controller="subscription" action="unsubscribe1">Unsubscribe</g:remoteLink>

                </g:if>

            <g:else>
                    <g:remoteLink controller="subscription" action="subscribe"  id="${item.key.id}">subscribe</g:remoteLink>

            </g:else><br><br>

                <g:if test="${item.key.user.username==user.username}">

                    <g:uploadForm controller="topic" action="change" id="${item.key.id}>
                        <g:submitButton name="Save"/>
                        %{--${item.key.id}--}%
                        <g:select from="${Visibility}" name="visibility" />
                        <g:select name="seriousness" from="${Seriousness}" />
                    </g:uploadForm>
                    
                    <g:remoteLink controller="topic" action="delete" id="${item.key.id}">Delete</g:remoteLink>

                </g:if>
        </g:each>
            </td>
        </tr>
    </table>
</div>

        <br><br>

    </div>

</body>
</html>
