package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.SearchServices;
import model.JobDetails;

@WebServlet("/searchresults")
public class SearchByTermController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchByTermController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("searchresults");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String givenSearchTerm = request.getParameter("searchButton");

		RequestDispatcher rdError = request.getRequestDispatcher("/search"); // if error
		RequestDispatcher rdSuccess = request.getRequestDispatcher("/viewresults"); // success ViewResultsSnippet.java
		// RequestDispatcher rdSearchTerm =
		// request.getRequestDispatcher("/searchByFilterResults");

        SearchServices searchSrvc = new SearchServices();

		ArrayList<JobDetails> resultlist = null;

		try {
			resultlist = searchSrvc.findBySearchTerm(givenSearchTerm);
		} catch (Exception e) {
			request.setAttribute("message", "<b>Σφάλμα</b><br>" + e.getMessage());
			rdError.forward(request, response);
			return;
		}

		request.setAttribute("provider-list", resultlist);
		rdSuccess.forward(request, response);
		return;
	}

}
