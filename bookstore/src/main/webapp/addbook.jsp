<%@ page import="com.weice.bookstore.Book" %>
<%@ page import="com.weice.bookstore.Genre" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>
<p><a href="/repository.jsp">Return To Main Page</a></p>
<center>
<br>
<font size="+2"> Add A Book </font>
<br><br><br>
</center>

<body>

<%
String repositoryName = (String)request.getAttribute("repositoryName");
String author_id = (String)request.getAttribute("author");
String content = (String)request.getAttribute("book");

if(repositoryName != null && author_id != null && content != null)
{
    if(repositoryName.length()==0 || author_id.length()==0 || content.length()==0)
    {
%>
<p> Please Fill-in all fields. </p>
<%
    }
}
%>
<form action="/add" method="post">
    <label for="content">Book Name</label>
    <div><textarea id="content" name="content" rows="3" cols="60"></textarea></div>
    <label for="author_id">Author</label>
    <div><textarea id="author_id" name="author_id" rows="1" cols="60"></textarea></div> 
    <label for="repositoryName">Genre:Non-fiction/Thriller/Fiction</label>
    <div><textarea id="repositoryName" name="repositoryName" rows="1" cols="60"></textarea></div>
    <div><input type="submit" value="Add Book Name"/></div>

</form>

</body>
</html>
