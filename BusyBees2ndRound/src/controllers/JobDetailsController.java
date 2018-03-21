package controllers;

import java.io.IOException;
import java.io.PrintWriter;import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.JobDetailsDAO;
import model.Provider;
import model.JobDetails;

@WebServlet("/beesProvider")
public class JobDetailsController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public JobDetailsController() {
    super();
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    
    RequestDispatcher rd1 = request.getRequestDispatcher("/submitFormSuccess.jsp");
    RequestDispatcher rd2 = request.getRequestDispatcher("/apperror.jsp");
    
    HttpSession session = request.getSession(true);

    Provider provider = (Provider) session.getAttribute("provider-object");
   
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

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

    if (provider != null) {
      int idprovider = provider.getIdprovider();
      
      if (workemail == null || firstName == null || lastName == null || phone == null
          || webpage == null || address == null || pc == null || city == null || description == null
          || type == null || category == null || subcategory == null || service == null) {

        request.setAttribute("errormessage", "Not valid data!");
        rd2.forward(request, response);

      }

      try {
        JobDetailsDAO pjobdao = new JobDetailsDAO();

        JobDetails provider_jobinfo = null;

        provider_jobinfo = new JobDetails(workemail, firstName, lastName, phone, webpage, address,
            pc, city, description, price, type, category, subcategory, service);

        pjobdao.setProviderJobDetails(provider_jobinfo, idprovider);

        request.setAttribute("successmessage", "Registration completed successfully!");
        rd1.forward(request, response);

      } catch (Exception e) {
        System.out.println(e.getMessage());
        request.setAttribute("errormessage", e.getMessage());
        PrintWriter out = response.getWriter();
        out.println(e.getMessage());

        return;
      }
    } else
      System.out.println("no id");

  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }
}
