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
<font size="+2"> Search by Author </font>
<br><br><br>
</center>

<body>

<%
String repositoryName = (String)request.getAttribute("repositoryName");
String author_id = (String)request.getAttribute("author_id");

if(repositoryName != null && author_id != null)
{
if (repositoryName.length()!=0 && author_id.length()!=0 ){
    
    pageContext.setAttribute("repositoryName", repositoryName);
    pageContext.setAttribute("author_id", author_id);
%>
<p> BOOKS in GENRE '${fn:escapeXml(repositoryName)}' by AUTHOR '${fn:escapeXml(author_id)}'.</p>
<%

    // Create the correct Ancestor key
      Key<Genre> GenreName = Key.create(Genre.class, repositoryName);

    // Run an ancestor query to ensure we see the most up-to-date
    // view of the Greetings belonging to the selected Guestbook.
      List<Book> books = ObjectifyService.ofy()
          .load()
          .type(Book.class) // We want only Greetings
          .ancestor(GenreName)    // Anyone in this book
          .order("-date")       // Most recent first - date is indexed.
          .limit(10)             // Only show 10 of them.
          .list();

    if (books.isEmpty()) {
%>
<p> No Books Found. </p>
<%
    } else {

      // Look at all of our books
        for (Book book : books) {
%>

<% pageContext.setAttribute("stringtotest",book.author_id);
   pageContext.setAttribute("bookname",book.content);

%>
<c:if test="${fn:containsIgnoreCase(stringtotest,author_id)}">
<p><b>${stringtotest}</b> wrote: '${bookname}'</p>	
</c:if>

<%
        }
    }
}
else
{
%>
<p> Please Fill-in all fields. </p>
<%
}
}
%>

<form action="/search" method="get">
    <label for="author">Author</label>
    <div><textarea id="author" name="author" rows="1" cols="60"></textarea></div> 
    <label for="Genre">Genre:Fiction/Non-fiction/Thriller</label>
    <div><textarea id="Genre" name="Genre" rows="1" cols="60"></textarea></div> 
    
    <div><input type="submit" value="Search"/></div>

</form>

</body>
</html>
