package views;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controllers.Login;
import model.JobDetails;

@WebServlet("/viewresults")
public class ViewResults extends HttpServlet {

  private static final long serialVersionUID = 1L;
  int i = 0;

  public ViewResults() {
    super();
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.getWriter().append("Served at: ").append(request.getContextPath());
  }

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    response.setContentType("text/html;charset=UTF-8");

    ArrayList<JobDetails> resultlist =
        (ArrayList<JobDetails>) request.getAttribute("provider-list");

    PrintWriter out = new PrintWriter(response.getWriter());

    /*********** HEADER *********/

    out.println(
        "<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'>");
    out.println("<html lang='en'>");
    out.println("  <head>");
    out.println("    <meta charset='utf-8'>");
    out.println("    <meta http-equiv='X-UA-Compatible' content='IE=edge'>");
    out.println("    <meta name='viewport' content='width=device-width, initial-scale=1'>");
    out.println("    <link rel='shortcut icon' href='ico/favicon.ico'>");
    out.println("    <title>Busy Bees - Αποτελέσματα Αναζήτησης</title>");
    out.println("    <!-- Bootstrap core CSS -->");
    out.println("    <link href='css/bootstrap.css' rel='stylesheet'>");
    out.println("    <!-- Custom styles for this template -->");
    out.println("    <link href='css/style.css' rel='stylesheet'>");
    out.println("    <link href='css/font-awesome.min.css' rel='stylesheet'>");
    out.println("  </head>");
    out.println("  <body>");

    switch (Login.loginValue) {
      case 0:
        System.out.println("loged out");
        request.getRequestDispatcher("/navbar_login.jsp").include(request, response);
        break;
      case 1:
        System.out.println("logedin provider");
        request.getRequestDispatcher("/navbar_provider.jsp").include(request, response);
        break;
      case 2:
        System.out.println("logedin user");
        request.getRequestDispatcher("/navbar_user.jsp").include(request, response);
        break;
    }

    out.println("<div class='container mtb'>"); // κλείνει στο τέλος πριν το footer
    out.println("");
    out.println("   <div class='row'>"); // κλείνει στο τέλος πριν το footer

    request.getRequestDispatcher("/searchFilters.jsp").include(request, response);

    out.println("");
    out.println("        <div class='col-lg-9 centered'>");
    out.println("<h2 style = 'color:#ffb726'>Αποτελέσματα Αναζήτησης</h2>");
    out.println("	 			<div class='hline'></div>");
    out.println("	 			<br>");
    out.println("	<form action='searchresults' method='post'>");
    out.println("			<input type='text' id='searchbox2' name='searchButton'");
    out.println("				placeholder='Νέα Αναζήτηση...'>");
    out.println("		</form>");

    if (resultlist != null && resultlist.size() > 0) {

      if (resultlist.size() == 1) {
        out.println(
            "        	<p><i><big>Βρέθηκε <b><span style = 'color: #fc7835'>1</span></b> αποτέλεσμα.</big></i></p>");
      } else {
        out.println("        	<p><i><big>Βρέθηκαν <b><span style = 'color: #fc7835'>"
            + resultlist.size() + "</span></b> αποτελέσματα.</big></i></p>");
      }
      out.println("      <div class = 'scrollable row'>");
    }

    if (resultlist == null || resultlist.size() == 0) {

      if (request.getParameter("searchButton") == null) {

        out.println("        	<p><i><big>Δεν βρέθηκαν αποτελέσματα. </big></i></p>");

      } else {

        out.println("        	<p><i><big>Δεν βρέθηκαν αποτελέσματα για το '"
            + request.getParameter("searchButton") + "'</big></i></p>");
      }

    } else {

      for (JobDetails pjob : resultlist) {
        
        out.println("        <br>");
        out.println("<div class = 'container col-lg-9 col-lg-offset-1'>");
        out.println("<div class='row well displayProfiles '>");
        out.println("     <div class='col-lg-12 col-sm-12'>");
        out.println("      <div class='card'>");
        out.println("        <div class='avatar'>");

        switch (pjob.getSubcategory()) {
          case "Φιλόλογος":
            out.println("          <img  src='img/generic/teachers/teacher1.jpg' alt='image'>");
            break;
          case "Δάσκαλος":
            out.println("          <img  src='img/generic/teachers/teacher3.jpg' alt='image'>");
            break;
          case "Μαθηματικός":
            out.println("          <img  src='img/generic/teachers/teacher4.jpg' alt='image'>");
            break;
          case "Φυσικός":
            out.println("          <img  src='img/generic/teachers/teacher2.jpg' alt='image'>");
            break;
          case "Ηλεκτρολόγος":
            out.println("          <img  src='img/generic/workers/el.jpg' alt='image'>");
            break;
          case "Υδραυλικός":
            out.println("          <img  src='img/generic/workers/pl.jpg' alt='image'>");
            break;
          case "Ελαιοχρωματιστής":
            out.println("          <img  src='img/generic/workers/painter.jpg' alt='image'>");
            break;
          case "Ξυλουργός":
            out.println("          <img  src='img/generic/workers/car.jpg' alt='image'>");
            break;
          case "Developer":
            out.println("          <img  src='img/generic/programmers/developer.jpg' alt='image'>");
            break;
          case "Web Designer":
            out.println("          <img  src='img/generic/programmers/designer.jpg' alt='image'>");
            break;
          case "Windows Expert":
            out.println("          <img  src='img/generic/programmers/windows.jpg' alt='image'>");
            break;
          case "Τεχνικός Δικτύων":
            out.println("          <img  src='img/generic/programmers/diktion.jpg' alt='image'>");
            break;
          case "Μουσικός":
            out.println("          <img  src='img/generic/artists/music.jpg' alt='image'>");
            break;
          case "Κλόουν":
            out.println("          <img  src='img/generic/artists/clown.jpg' alt='image'>");
            break;
          case "Ηθοποιός":
            out.println("          <img  src='img/generic/artists/actor.jpg' alt='image'>");
            break;
          case "Τραγουδιστής":
            out.println("          <img  src='img/generic/artists/singer.jpg' alt='image'>");
            break;
          case "Παθολόγος":
            out.println("          <img  src='img/generic/doctors/path.jpg' alt='image'>");
            break;
          case "Γυναικολόγος":
            out.println("          <img  src='img/generic/doctors/wooman.jpg' alt='image'>");
            break;
          case "Οδοντίατρος":
            out.println("          <img  src='img/generic/doctors/teeth.jpg' alt='image'>");
            break;
          case "Οφθαλμίατρος":
            out.println("          <img  src='img/generic/doctors/eye.jpg' alt='image'>");
            break;
        }

        out.println("        </div>");
        out.println("        <div>");
        out.println("");
        out.println("          <p class='priceInfo'><span id = 'price'>" + pjob.getPrice()
            + "</span><span>&nbsp&euro;</span></p>");
        out.println("          <p class='servicekindinfo'><span id='servicekind'>" + pjob.getType()
            + "</span></p>");
        out.println("");
        out.println("");
        out.println("        </div>");
        out.println("");
        out.println("        <div class = 'container'>");
        out.println("        <div class='content col-md-3'>");
        out.println("          <p> <span class='personName' id = 'fullname'>" + pjob.getLastName()
            + " " + pjob.getFirstName() + "</span>");
        out.println("            <span>&nbsp</span>");
        out.println("");
        out.println("          <span class='profInfo' id='type' style = 'font-weight:bold'>"
            + pjob.getSubcategory() + "</span></p>");
        out.println("");
        out.println("");
        out.println("          <p class='profInfo' id='service1'>" + pjob.getService() + "</p>");
        out.println(
            "          <p class='profInfo' id='serviceDescr'>" + pjob.getDescription() + "</p>");
        out.println("         </div>");
        out.println("");
        out.println("      </div>");
        out.println("");
        out.println("         <a data-toggle='collapse' data-target='#collapseExampleDong" + i
            + "' aria-expanded='false' aria-controls='collapseExample'>");
        out.println("         <div class='arrow'>");
        out.println("            <i class='fa fa-chevron-down' aria-hidden='true'></i>");
        out.println("        </div>");
        out.println("        </a>");
        out.println("        <div class='collapse' id='collapseExampleDong" + i + "'>");
        out.println("          <div class='card card-block'>");
        out.println("            <table class='table table-user-information'>");
        out.println("              <tbody>");
        out.println("");
        out.println("                <tr>");
        out.println("                  <td>Τηλέφωνο:</td>");
        out.println("                  <td id='tel'>" + pjob.getPhone() + "</td>");
        out.println("                </tr>");
        out.println("");
        out.println("                <tr>");
        out.println("                  <td>Πόλη:</td>");
        out.println("                  <td id='city'>" + pjob.getCity() + "</td>");
        out.println("                </tr>");
        out.println("");
        out.println("                <tr>");
        out.println("                  <td>Διεύθυνση:</td>");
        out.println("                  <td id='address'>" + pjob.getAddress() + "</td>");
        out.println("                </tr>");
        out.println("");
        out.println("                <tr>");
        out.println("                  <td>ΤΚ:</td>");
        out.println("                  <td id='tk'>" + pjob.getPc() + "</td>");
        out.println("                </tr>");
        out.println("");
        out.println("                <tr>");
        out.println("                  <td>e-mail:</td>");
        out.println("                  <td id='email'><a href='mailto:" + pjob.getWorkemail() + "'>"
            + pjob.getWorkemail() + "</a></td>");
        out.println("                </tr>");
        out.println("");
        out.println("                <tr>");
        out.println("                  <td>Ιστοσελίδα:</td>");
        out.println("                  <td id='url'><a href='" + pjob.getWebpage() + "'>"
            + pjob.getWebpage() + "</a></td>");
        out.println("                </tr>");
        out.println("");
        out.println("              </tbody>");
        out.println("            </table>");
        out.println("");
        out.println("          </div>");
        out.println("        </div>");
        out.println("      </div>");
        out.println("</div>");
        out.println("    </div>");
        out.println("</div>");

        i++;

      } // for

    } // else

    i = 0;

    out.println("    </div>");
    out.println("</div>");
    out.println("    </div>"); // row
    out.println("</div>"); // container mtb

    /*********** FOOTER *********/

    // request.getRequestDispatcher("/footer.jsp").include(request, response); //mou
    // to bgazei xalia

    out.println(
        "<!-- *****************************************************************************************************************");
    out.println("	 FOOTER");
    out.println(
        "	 ***************************************************************************************************************** -->");
    out.println("	");
    out.println("	<div id='footerwrap'>");
    out.println("		<div class='container'>");
    out.println("			<div class='row'>");
    out.println("				<div class='col-lg-4'>");
    out.println("					<h4>About</h4>");
    out.println("					<div class='hline-w'></div>");
    out.println("					<p>");
    out.println(
        "						Το Busy Bees είναι ένα project που δημιουργήθηκε από την παραπάνω");
    out.println("						ομάδα στο πλαίσιο του 2nd Coding Bootcamp (<a");
    out.println(
        "							href='http://www.afdemp.org/bootcamp/' target='blank'>Alliance");
    out.println("							for Digital Employability</a>).");
    out.println("					</p>");
    out.println("				</div>");
    out.println("				<div class='col-lg-4'>");
    out.println("					<h4>Ακολουθήστε μας</h4>");
    out.println("					<div class='hline-w'></div>");
    out.println("					<p>");
    out.println("						<a><i class='fa fa-facebook'></i></a> <a><i");
    out.println(
        "							class='fa fa-twitter'></i></a> <a><i class='fa fa-linkedin'></i></a>");
    out.println("					</p>");
    out.println("				</div>");
    out.println("				<div class='col-lg-4'>");
    out.println("					<h4>Επικοινωνία</h4>");
    out.println("					<div class='hline-w'></div>");
    out.println("					<p>");
    out.println("						<span class='glyphicon glyphicon glyphicon-earphone'");
    out.println(
        "							aria-hidden='true'></span> &nbsp 6972809585 <br> <span");
    out.println(
        "							class='glyphicon glyphicon glyphicon-envelope' aria-hidden='true'></span>");
    out.println(
        "						&nbsp <a href='mailto:busybees@outlook.com' target='_top'>busybees@outlook.com</a><br>");
    out.println("						<span class='glyphicon glyphicon glyphicon-map-marker'");
    out.println(
        "							aria-hidden='true'></span> &nbsp Ηρούς 4 & Κρέοντος 104 42, Αθήνα");
    out.println("");
    out.println("");
    out.println("					</p>");
    out.println("				</div>");
    out.println("");
    out.println("			</div>");
    out.println("			<! --/row -->");
    out.println("		</div>");
    out.println("		<! --/container -->");
    out.println("	</div>");
    out.println("	<! --/footerwrap -->");

    out.println("    <!-- Bootstrap core JavaScript");
    out.println("    ================================================== -->");
    out.println("    <!-- Placed at the end of the document so the pages load faster -->");
    out.println(
        "    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'></script>");
    out.println("    <script src='js/bootstrap.min.js'></script>");
    out.println("	<script src='js/retina-1.1.0.js'></script>");
    out.println("	<script src='js/jquery.hoverdir.js'></script>");
    out.println("	<script src='js/jquery.hoverex.min.js'></script>");
    out.println("	<script src='js/jquery.prettyPhoto.js'></script>");
    out.println("  	<script src='js/jquery.isotope.min.js'></script>");
    out.println("  	<script src='js/custom.js'></script>");
    out.println("    <script src='js/modernizr.js'></script>");
    out.println("");
    out.println("");
    out.println("");
    out.println("");
    out.println("  </body>");
    out.println("</html>");
    out.println("");

    /*************/

  }

}
