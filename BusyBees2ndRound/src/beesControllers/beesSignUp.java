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

import beesDAO.CustomerDAO;
import beesDAO.ProviderDAO;
import beesJava.Customer;
import beesJava.Provider;

//-------------------------------------------------------------------------------------------------------------------------------

@WebServlet("/beesSignUp")
public class beesSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public beesSignUp() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();

		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String userCategory = request.getParameter("userCategory");

		RequestDispatcher rd2 = request.getRequestDispatcher("/signupsuccess.jsp");
		RequestDispatcher rd3 = request.getRequestDispatcher("/error.jsp");

		if (password.length() < 6) {
			request.setAttribute("shortpsw",
					"Î¤Î¿ psw Ï€Ï�Î­Ï€ÎµÎ¹ Î½Î± ÎµÎ¯Î½Î±Î¹ Ï„Î¿Ï…Î»Î¬Ï‡Î¹ÏƒÏ„Î¿Î½ 6 Ï‡Î±Ï�Î±ÎºÏ„Î®Ï�ÎµÏ‚");
			rd3.forward(request, response);
			return;
		}

		// User -----------------------------------------------------------------
		if (userCategory.equals("1")) {

			CustomerDAO cdao = new CustomerDAO();
			Customer customerinfo = null;

			try {

				int customeremailflag = cdao.checkCustomerSignUp(email);

				if (customeremailflag > 0) {

					request.setAttribute("customeremailexists", "Î¤Î¿ email Ï…Ï€Î¬Ï�Ï‡ÎµÎ¹.");
					rd3.forward(request, response);

				} else {

					customerinfo = new Customer(username, password, email);
					cdao.saveCustomer(customerinfo);

					/**** for auto login *******/
					HttpSession session = request.getSession(true);
					Customer customer = null;
					customer = cdao.checkCustomerLogIn(password, email);
					session.setAttribute("customer-object", customer);
					/**************/

					request.setAttribute("successmessage", "...");
					rd2.forward(request, response);

				}

			} catch (Exception e) {

				writer.println(e.getMessage());
				// request.setAttribute("messageerror", "<b>Ï‰Ï‡!! Î¼Î±Ï‚ Ï†Î¬Î³Î±Î½Îµ </b><br>"
				// + e.getMessage());
				// rd.forward(request, response);
				return;

			}
		}

		// Provider--------------------------------------------------------------------------------------------
		if (userCategory.equals("2")) {

			ProviderDAO pdao = new ProviderDAO();
			Provider providerinfo = null;

			try {

				int provideremailflag = pdao.checkProviderSignUp(email);

				if (provideremailflag > 0) {

					request.setAttribute("provideremailexists", "Î¤Î¿ email Ï…Ï€Î¬Ï�Ï‡ÎµÎ¹.");
					rd3.forward(request, response);

				} else {

					providerinfo = new Provider(username, password, email);
					pdao.saveProvider(providerinfo);

					/**** for auto login *******/
					HttpSession session = request.getSession(true);
					Provider provider = null;
					provider = pdao.checkProviderLogIn(password, email);
					session.setAttribute("provider-object", provider);
					/**************/

					request.setAttribute("successmessage",
							"ÎšÎ¬Î½Îµ Î¼Ï€Î¹Î¶Î¶Î¶Î¶Î¶Î¶ ÎµÎ¯ÏƒÎ±Î¹ Ï€Î»Î­Î¿Î½ Î¼Î­Î»Î¹ÏƒÏƒÎ±");
					rd2.forward(request, response);

				}

			} catch (Exception e) {

				writer.println(e.getMessage());
				// request.setAttribute("messageerror", "<b>Ï‰Ï‡!! Î¼Î±Ï‚ Ï†Î¬Î³Î±Î½Îµ </b><br>"
				// + e.getMessage());
				// rd.forward(request, response);
				return;

			}
		}
		return;

	}

}