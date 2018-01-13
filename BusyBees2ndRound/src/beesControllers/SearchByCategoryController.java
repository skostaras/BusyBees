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


@WebServlet("/searchByCategory")
public class SearchByCategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchByCategoryController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		response.sendRedirect("searchByCategory");	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
	
		String givenSearchCategory = request.getParameter("category");
		
		RequestDispatcher rdError = request.getRequestDispatcher("/searchByCategory"); //if error
		RequestDispatcher rdSuccess = request.getRequestDispatcher("/viewresults"); //success ViewResultsSnippet.java
			
	
		Provider_jobDAO pjobdao = new Provider_jobDAO();
		ArrayList<Provider_job> resultlist = null;
		
		try {
			
			resultlist = pjobdao.findByCategory(givenSearchCategory);
			
			
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
