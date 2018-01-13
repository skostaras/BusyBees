package beesControllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beesDAO.CustomerDAO;
import beesDAO.ProviderDAO;
import beesJava.Customer;
import beesJava.Provider;

@WebServlet("/beesLogIn")
public class beesLogIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static int loginValue = 0; // Ξ— ΞΌΞµΟ„Ξ±Ξ²Ξ»Ξ·Ο„Ξ® Ξ±Ο…Ο„Ξ® ΞΏΟ�Ξ―Ξ¶ΞµΞΉ Ο„Ξ·Ξ½ ΞΊΞ±Ο„Ξ¬ΟƒΟ„Ξ±ΟƒΞ· login
	// ΞΊΞ±ΞΉ Ο€Ξ±Ξ―Ο�Ξ½ΞµΞΉ Ο„Ο�ΞµΞΉΟ‚ Ο„ΞΉΞΌΞ­Ο‚: 0: Ξ”ΞµΞ½ Ξ­Ο‡ΞµΞΉ Ξ³Ξ―Ξ½ΞµΞΉ login,
	// 1: Ξ�Ο‡ΞµΞΉ ΞΊΞ¬Ξ½ΞµΞΉ login ΞΏ provider, 2: Ξ­Ο‡ΞµΞΉ ΞΊΞ¬Ξ½ΞµΞΉ
	// login ΞΏ user


	public beesLogIn() {
		super();

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		RequestDispatcher rdSuccess = request.getRequestDispatcher("/loginsuccess.jsp"); //success
		RequestDispatcher rdFail = request.getRequestDispatcher("/error.jsp");  //fail
		
		HttpSession session = request.getSession(true);
		
		CustomerDAO cdao = new CustomerDAO(); 
		Customer customer = null; 

		ProviderDAO pdao = new ProviderDAO(); 
		Provider provider = null; 	


		try {
			customer = cdao.checkCustomerLogIn(password, email);
			session.setAttribute("customer-object", customer);
			rdSuccess.forward(request, response);	
	
		} 

		catch (Exception e) {
			
			
			try {

				provider = pdao.checkProviderLogIn(password, email);
				session.setAttribute("provider-object", provider);
				rdSuccess.forward(request, response);
				
			}
			catch (Exception e2) {
				request.setAttribute("messageerror", e2.getMessage());
				System.out.println("provider login not found");
				rdFail.forward(request, response);
				
			}

			request.setAttribute("messageerror", e.getMessage());
			System.out.println("customer login not found");
			rdFail.forward(request, response);
			
		}			
			
			
			
		
				
			
		
		return;

	}//doPost

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}
