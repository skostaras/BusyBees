package beesControllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import beesDAO.Provider_jobDAO;
import beesJava.Provider;

/**
 * Servlet implementation class deleteFromProvider
 */
@WebServlet("/deleteFromProvider")
public class deleteFromProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteFromProvider() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8"); 
		response.setCharacterEncoding("UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		

		
		RequestDispatcher rd = request.getRequestDispatcher("/deleteFormSuccess.jsp");
		RequestDispatcher rd3 = request.getRequestDispatcher("/apperror.jsp");
		
		HttpSession session = request.getSession(true); // pernei oles tis egrafes se cookys katholh thn diarkia poy einai o user sto site
		Provider provider = (Provider) session.getAttribute("provider-object"); // apothikeyei ena sto antikimeno provider ths Provider
      if(provider!=null){  int idprovider=provider.getIdprovider(); // pernoyme apo tis tri parametrous email Password ktl pernoyme mono to idprovider
		
      
      
      
      try {
			Provider_jobDAO pjobdao = new Provider_jobDAO(); 
			pjobdao.deleteProviderInfo(idprovider); 
			request.setAttribute("successmessage", "Delete completed successfully!");
			rd.forward(request, response);

		} catch (Exception e) {
			request.setAttribute("errormessage", e.getMessage());

			PrintWriter out = response.getWriter();
			out.println(e.getMessage());
			
      
			return;
		}
      
      
		
		
		
		doGet(request, response);
	}

}
}
