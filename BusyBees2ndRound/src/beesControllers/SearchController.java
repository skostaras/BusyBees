package beesControllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import beesDAO.Provider_jobDAO;
import beesJava.Provider_job;

@WebServlet("/searchresults")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchController() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.sendRedirect("searchresults");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		// HttpSession session = request.getSession(true);

		String givenSearchTerm = request.getParameter("searchButton");

		RequestDispatcher rdError = request.getRequestDispatcher("/search"); // if error
		RequestDispatcher rdSuccess = request.getRequestDispatcher("/viewresults"); // success ViewResultsSnippet.java
		// RequestDispatcher rdSearchTerm =
		// request.getRequestDispatcher("/searchByFilterResults");

		Provider_jobDAO pjobdao = new Provider_jobDAO();
		ArrayList<Provider_job> resultlist = null;

		try {

			resultlist = pjobdao.findProviderDetails(givenSearchTerm);

		} catch (Exception e) {

			request.setAttribute("message", "<b>Σφάλμα</b><br>" + e.getMessage());

			rdError.forward(request, response);
			return;

		}

		request.setAttribute("provider-list", resultlist);

		// session.setAttribute("searchTerm", givenSearchTerm);

		rdSuccess.forward(request, response);
		// rdSearchTerm.forward(request, response);
		return;

	}

}
