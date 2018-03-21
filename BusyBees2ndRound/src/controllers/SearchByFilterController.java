package controllers;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.JobDetailsDAO;
import dao.SearchServices;
import model.JobDetails;

@WebServlet("/searchByFilterResults")
public class SearchByFilterController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  public SearchByFilterController() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.sendRedirect("searchByCategory");
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");

    String givenCategory = request.getParameter("category");
    String givenSubcategory = null; // To parakato switch to kano epeidi ta sigkekrimena fields stin
                                    // forma einai
                                    // hidden me javascript kai an den paro times apo ola ta hidden
                                    // fields, tote
                                    // pairnei to value apo to proto select-option pou tha vrei.
    String givenSubcategory1 = request.getParameter("subcategory1");
    String givenSubcategory2 = request.getParameter("subcategory2");
    String givenSubcategory3 = request.getParameter("subcategory3");
    String givenSubcategory4 = request.getParameter("subcategory4");
    String givenSubcategory5 = request.getParameter("subcategory5");

    switch (givenCategory) {
      case "Εκπαιδευτικός":
        givenSubcategory = givenSubcategory1;
        break;
      case "Μάστορας":
        givenSubcategory = givenSubcategory2;
        break;
      case "Κομπιουτεράς":
        givenSubcategory = givenSubcategory3;
        break;
      case "Καλλιτέχνης":
        givenSubcategory = givenSubcategory4;
        break;
      case "Γιατρός":
        givenSubcategory = givenSubcategory5;
        break;
    }

    String givenCity = request.getParameter("city");
    String givenType = request.getParameter("type");
    String givenPhone = request.getParameter("phone");

    if (givenPhone == null)
      givenPhone = "%";
    
    String givenwebpage = request.getParameter("webpage");

    if (givenwebpage == null)
      givenwebpage = "%";

    int givenMinMoney = Integer.parseInt(request.getParameter("minMoney"));
    int givenMaxMoney = Integer.parseInt(request.getParameter("maxMoney"));

    RequestDispatcher rdError = request.getRequestDispatcher("/search"); // if error
    RequestDispatcher rdSuccess = request.getRequestDispatcher("/viewresults"); // success
                                                                                // ViewResultsSnippet.java

    SearchServices searchSrvc = new SearchServices();
    ArrayList<JobDetails> resultlist = null;

    try {
      resultlist = searchSrvc.findByFilter(givenCategory, givenSubcategory, givenCity, givenType,
          givenPhone, givenwebpage, givenMinMoney, givenMaxMoney);
      // resultlistbyTerm = pjobdao.findProviderDetails(givenSearchTerm);

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
