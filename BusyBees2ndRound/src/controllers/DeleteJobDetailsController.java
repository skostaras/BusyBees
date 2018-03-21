package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.JobDetailsDAO;
import model.Provider;

@WebServlet("/deleteFromProvider")
public class DeleteJobDetailsController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public DeleteJobDetailsController() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    RequestDispatcher rd = request.getRequestDispatcher("/deleteFormSuccess.jsp");
    HttpSession session = request.getSession(true);
    Provider provider = (Provider) session.getAttribute("provider-object");

    if (provider != null) {
      int idprovider = provider.getIdprovider();

      try {
        JobDetailsDAO pjobdao = new JobDetailsDAO();
        pjobdao.deleteProviderJobDetails(idprovider);
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
