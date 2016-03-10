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
public class SearchServlet extends HttpServlet {

  // Process the http POST of the form
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    Book book;

    String GenreName = req.getParameter("Genre");
    String author = req.getParameter("author");
    
    req.setAttribute("author_id",author);
    req.setAttribute("repositoryName", GenreName);
      
    RequestDispatcher rd = req.getRequestDispatcher("search.jsp");
    rd.forward(req,resp);
    //resp.sendRedirect("/search.jsp");
  }
}
