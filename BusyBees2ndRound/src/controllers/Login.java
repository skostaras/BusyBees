package controllers;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.CustomerDAO;
import dao.ProviderDAO;
import model.Customer;
import model.Provider;

@WebServlet("/beesLogIn")
public class Login extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public static int loginValue = 0;

  public Login() {
    super();
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    
    HttpSession session = request.getSession(true);
    CustomerDAO cdao = new CustomerDAO();
    Customer customer = null;
    ProviderDAO pdao = new ProviderDAO();
    Provider provider = null;
    
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    RequestDispatcher rdSuccess = request.getRequestDispatcher("/loginsuccess.jsp"); // success
    RequestDispatcher rdFail = request.getRequestDispatcher("/error.jsp"); // fail
    
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    try {
      
      customer = cdao.getCustomer(password, email);
      session.setAttribute("customer-object", customer);
      rdSuccess.forward(request, response);

    } catch (Exception e1) {

      try {
        provider = pdao.getProvider(password, email);
        session.setAttribute("provider-object", provider);
        rdSuccess.forward(request, response);

      } catch (Exception e2) {
        request.setAttribute("messageerror", e2.getMessage());
        System.out.println("provider login not found");
        rdFail.forward(request, response);

      }

      request.setAttribute("messageerror", e1.getMessage());
      System.out.println("customer login not found");
      rdFail.forward(request, response);

    }

    return;
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doPost(request, response);
  }
}
