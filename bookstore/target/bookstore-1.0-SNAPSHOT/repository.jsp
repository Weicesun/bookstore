<%@ page import="com.weice.bookstore.Book" %>
<%@ page import="com.weice.bookstore.Genre" %>
<%@ page import="com.googlecode.objectify.Key" %>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head>
    <link type="text/css" rel="stylesheet" href="/stylesheets/main.css"/>
</head>

<body>

<center>
<br>
<font size="+2"> Weice's Book Store </font> 
<br><br><br>
</center>

<p><a href="/browse.jsp?repositoryName=Fiction">Browse Fiction Genre</a></p>
<p><a href="/browse.jsp?repositoryName=Non-fiction">Browse Non-fiction Genre</a></p>
<p><a href="/browse.jsp?repositoryName=Thriller">Browse Thriller Genre</a></p>

<p><a href="/search.jsp">Search for Books by Author</a></p>
<p><a href="/addbook.jsp">Enter New book info</a></p>

</body>
</html>
