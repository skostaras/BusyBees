package beesControllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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

	public beesSignUp() {// genikos constractoras
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");// gia ellinika
		PrintWriter writer = response.getWriter();
	


		// anoigoi xoro gia antikimena username ,email, paswword)
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String userCategory = request.getParameter("userCategory");
		

		RequestDispatcher rd2 = request.getRequestDispatcher("/signupsuccess.jsp");
																		
		RequestDispatcher rd3 = request.getRequestDispatcher("/error.jsp"); 

		
		if (password.length()<6){
			request.setAttribute("shortpsw", "Το psw πρέπει να είναι τουλάχιστον 6 χαρακτήρες");
			rd3.forward(request, response);
			return;
			
		}
	
		
		// Episkeptis-------------------------------------------------------------------------------------------
		if (userCategory.equals("1")) {// elegxei ean to radio buton einai true kai
									// ektelei ola ta parakato
			// --------------------------------------------------------------------------------------------


			CustomerDAO cdao = new CustomerDAO(); // dimioyrgoyme ena antikimeno
													// ths klasis CustomerDAO
			Customer customerinfo = null; // dimioyrgei ena antikeimeno tis
											// klasis User
			
			
			
			// -----------------------------------------------------------------------------------------------------------------------------------------

			try {


				int customeremailflag = cdao.checkCustomerSignUp(email); // kali
																			// thn
																			// methodo
																	// getSignupSameUsers...to
																			// antikimeno
																			// resultlist
																			// dexete
																			// tin
																			// timi

				if (customeremailflag > 0) { // elenxei ean to antikimeno
												// resultlist
												// kai elegnei an eina
												// megalitero
												// toy midenos arra o xristeis
												// den
												// eixei grapsi kati opote einai
												// lathos
					request.setAttribute("customeremailexists", "Το email υπάρχει.");
					rd3.forward(request, response); // stelnei ton xristi sthn
													// login
				} else {


					customerinfo = new Customer(username, password, email);
					cdao.saveCustomer(customerinfo);// kalei thn saveUser methodo gia
												// na apothikeysei tis
												// plirofories poy dexete apo to
												// antikimeno customerinfo kai ta apothikeyei se ena antikimeno udao
					
					
					/**** Gia automato login *******/
					HttpSession session = request.getSession(true);
					Customer customer = null;
					customer = cdao.checkCustomerLogIn(password, email);
					session.setAttribute("customer-object", customer);
					
					/**************/
					
					request.setAttribute("successmessage", "...");
					rd2.forward(request, response); // stelnei ton xristi sthn
													// index
				}

			} catch (Exception e) {
				
				writer.println(e.getMessage());

				//request.setAttribute("messageerror", "<b>ωχ!! μας φάγανε </b><br>" + e.getMessage());// typonei

				//rd.forward(request, response);// stelnei ton xristi sthn
												// erropage
				return;

			}
		}
		
	

		// Epagelmatia--------------------------------------------------------------------------------------------
		if (userCategory.equals("2")) {// elegxei ean to radio buton einai true kai
									   // ektelei ola ta parakato
			// --------------------------------------------------------------------------------------------
			ProviderDAO pdao = new ProviderDAO(); // dimioyrgoyme ena antikimeno
													// ths klasis CustomerDAO
			Provider providerinfo = null; // dimioyrgei ena antikeimeno tis
											// klasis User

			// -----------------------------------------------------------------------------------------------------------------------------------------

			try {
				

				int provideremailflag = pdao.checkProviderSignUp(email); // kali
																			// thn
																			// methodo
																	// getSignupSameUsers...to
																			// antikimeno
																			// resultlist
																			// dexete
																			// tin
																			// timi

				if (provideremailflag > 0) { // elenxei ean to antikimeno
												// resultlist
												// kai elegnei an eina
												// megalitero
												// toy midenos arra o xristeis
												// den
												// eixei grapsi kati opote einai
												// lathos
					request.setAttribute("provideremailexists", "Το email υπάρχει.");
					rd3.forward(request, response); // stelnei ton xristi sthn
													// login
				} else {
//					writer.println("doylepseeee");

					providerinfo = new Provider(username, password, email);
					pdao.saveProvider(providerinfo);// kalei thn saveUser methodo gia
												// na apothikeysei tis
												// plirofories poy dexete apo to
												// antikimeno customerinfo kai ta apothikeyei se ena antikimeno udao
					
					
					
					
					
					/**** Gia automato login *******/
					HttpSession session = request.getSession(true);
					Provider provider = null;
					provider = pdao.checkProviderLogIn(password, email);
					session.setAttribute("provider-object", provider);
					
					/**************/
					
					
					
					
					
					request.setAttribute("successmessage", "Κάνε μπιζζζζζζ είσαι πλέον μέλισσα");
					rd2.forward(request, response); // stelnei ton xristi sthn
													// index
				}

			} catch (Exception e) {
				
				writer.println(e.getMessage());

				//request.setAttribute("messageerror", "<b>ωχ!! μας φάγανε </b><br>" + e.getMessage());// typonei
				// sth
				// error
				// page
				// to
				// sfalma
				// poy
				// grapsame

				//rd.forward(request, response);// stelnei ton xristi sthn
												// erropage
				return;

			}
		}
		// edo telionei to if toy
			// episkepti-----------------------------------------------------------------------------------------------------------------------------
	return;

	}

}