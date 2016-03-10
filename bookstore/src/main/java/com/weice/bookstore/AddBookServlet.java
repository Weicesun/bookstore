package com.weice.bookstore;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

/**
 * Form Handling Servlet
 * Most of the action for this sample is in webapp/guestbook.jsp, which displays the
 * {@link Greeting}'s. This servlet has one method
 * {@link #doPost(<#HttpServletRequest req#>, <#HttpServletResponse resp#>)} which takes the form
 * data and saves it.
 */
public class AddBookServlet extends HttpServlet {

  // Process the http POST of the form
  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    Book book;
    
    String GenreName = req.getParameter("repositoryName");
    String content = req.getParameter("content");
    String author_id = req.getParameter("author_id");
    
    if(GenreName.length()!=0 && content.length()!=0 && author_id.length()!=0)
    {
    book = new Book(GenreName, content, author_id);

    // Use Objectify to save the greeting and now() is used to make the call synchronously as we
    // will immediately get a new page using redirect and we want the data to be present.
    ObjectifyService.ofy().save().entity(book).now();

    resp.sendRedirect("/repository.jsp");
    }
    else
    {
        req.setAttribute("author",author_id);
        req.setAttribute("repositoryName", GenreName);
        req.setAttribute("book",content);
        
        RequestDispatcher rd = req.getRequestDispatcher("addbook.jsp");
        rd.forward(req,resp);
        //resp.sendRedirect("/search.jsp");

    }
  }
}
