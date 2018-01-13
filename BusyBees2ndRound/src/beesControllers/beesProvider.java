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
import beesJava.Provider_job;
//---------------------------------------------------------------

@WebServlet("/beesProvider")
public class beesProvider extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public beesProvider() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8"); // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SOS
		response.setCharacterEncoding("UTF-8"); // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SOS
		request.setCharacterEncoding("UTF-8");// gia ellinika

		String workemail = request.getParameter("workemail");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phone = request.getParameter("phone");
		String webpage = request.getParameter("webpage");
		String address = request.getParameter("address");
		String pc = request.getParameter("pc");
		String city = request.getParameter("city");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String type = request.getParameter("type");
		String category = request.getParameter("category");
		String subcategory = request.getParameter("subcategory");
		String service = request.getParameter("service");

		RequestDispatcher rd = request.getRequestDispatcher("/submitFormSuccess.jsp");
		RequestDispatcher rd3 = request.getRequestDispatcher("/apperror.jsp");

		
		
		
		// ---------------------------------------------------------------------------------------------------------------------------

		HttpSession session = request.getSession(true); // pernei oles tis egrafes se cookys katholh thn diarkia poy einai o user sto site
		Provider provider = (Provider) session.getAttribute("provider-object"); // apothikeyei ena sto antikimeno provider ths Provider
      if(provider!=null){  int idprovider=provider.getIdprovider(); // pernoyme apo tis tri parametrous email Password ktl pernoyme mono to idprovider 
        //--------------------------------------------------------------------------------------------------------------------------
        
//Den eimai sigouros an leitourgei to parakato afou mporo kai kataxoro misa dedomena
        
		if (workemail == null || firstName == null || lastName == null || phone == null || webpage == null
				|| address == null || pc == null || city == null || description == null
				 || type == null || category == null || subcategory == null || service == null) {

			request.setAttribute("errormessage", "Not valid data!");
			rd3.forward(request, response);

		}
		// telos tis doPost fernei ta dedomena apo tis jsp
		// selides++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		// [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[

		try {
			Provider_jobDAO pjobdao = new Provider_jobDAO(); // dimioyrgei ena antikeimeno  tis klasis Provider_jobDAO
			Provider_job provider_jobinfo = null; // dimioyrgei ena antikeimeno tis klasis Provider_job		
			
			
			provider_jobinfo = new Provider_job( workemail,  firstName,  lastName,  phone,  webpage,
					 address,   pc,  city,  description,  price,
					 type,  category,  subcategory,  service);

			
			
			pjobdao.saveProvider_job(provider_jobinfo, idprovider); // store provider_jobinfo to database sthn klasi DAO
			request.setAttribute("successmessage", "Registration completed successfully!");
			rd.forward(request, response);

		} catch (Exception e) {
			System.out.println(e.getMessage());
			request.setAttribute("errormessage", e.getMessage());

			PrintWriter out = response.getWriter();
			out.println(e.getMessage());
			
        
			return;
		}
      }
      else System.out.println("no id");

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
}
