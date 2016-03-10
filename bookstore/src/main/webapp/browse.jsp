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

<p><a href="/repository.jsp">Return To Main Page</a></p>

<body>

<%
    String repositoryName = request.getParameter("repositoryName");
    if (repositoryName == null) {
        repositoryName = "default";
    }
    pageContext.setAttribute("repositoryName", repositoryName);
%>

<center>
<br>
<font size="+2"> BOOKS in GENRE '${fn:escapeXml(repositoryName)}' </font>
<br><br><br>
</center>

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
          .limit(50)             // Only show 50 of them.
          .list();

    if (books.isEmpty()) {
%>
<p> No Books added in repository: '${fn:escapeXml(repositoryName)}'. Please add.</p>
<%
    } else {
%>

<%
      // Look at all of our books
        for (Book book : books) {
            pageContext.setAttribute("Book_Names", book.content);
      //    String author;
            pageContext.setAttribute("Book_Author",book.author_id);
%>
<p><b>${fn:escapeXml(Book_Author)}</b> wrote: '${fn:escapeXml(Book_Names)}'</p>
<%
        }
    }
%>

</body>
</html>
