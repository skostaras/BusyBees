<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/ico/favicon.ico">

<title>Busy Bees - Provider</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">


<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="js/modernizr.js"></script>
</head>

<body>

	<!-- Fixed navbar -->

	<%@ page import="beesControllers.beesLogIn"%>


	<% switch(beesLogIn.loginValue) {
		case 0:
		System.out.println("loged out"); %>
	<%@ include file="navbar_login.jsp"%>
	<%break;
		case 1:
			System.out.println("logedin provider"); %>
	<%@ include file="navbar_provider.jsp"%>
	<%break;
		case 2:
			System.out.println("logedin user"); %>
	<%@ include file="navbar_user.jsp"%>
	<%break;
	}
%>


	<div class="container">
		<br>
		<br>
		<br>
		<br>

		<div class="col-lg-8 col-lg-offset-2 himg">
			<img src="img/mainlogo.png" class="img-responsive">
		</div>
	</div>
	<!-- /container -->



	<div class="container mtb">

		<div class="row">

			<div class="col-lg-3">
				<img src="img/portfolio/household2.jpg" alt="artists" width="100%">

			</div>

			<div class="col-lg-9">
				<h4 style="color: #ffb726">
					Καλώς ήρθες <i> <%@ 
                page
							import="beesJava.Provider"%>
						<%@  
               page
							import="beesJava.Provider_job, beesDAO.Provider_jobDAO"%>


						<% Provider provider = (Provider)session.getAttribute("provider-object");	
					Provider_jobDAO provInfoDAO = new Provider_jobDAO();
					Provider_job infolist = new Provider_job();
					infolist = provInfoDAO.getProviderInfo(provider.getIdprovider());
				
				%> <%=provider.getProvidername()%>

					</i>
				</h4>
				<div class="hline"></div>
				<br>

				<p>Παρακάτω μπορείτε να ελέγξετε τα στοιχεία που έχετε
					καταχωρήσει στο Busy Bees.</p>
				<p>Μπορείτε επίσης να διαγράψετε τις πληροφορίες που έχετε
					καταχωρήσει πατώντας εδώ:</p>



				<button type="submit" class="btn btn-logout" data-toggle="modal"
					data-target=".bs-modal-sm">Διαγραφή Δεδομένων</button>


				<!-- Modal -->
				<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1"
					role="dialog" aria-labelledby="mySmallModalLabel"
					aria-hidden="true">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">


							<div class="modal-header forgotpsw">
								<h4 class="modal-title">Επιβεβαίωση Διαγραφής</h4>
							</div>

							<div class="modal-body">
								<form class="form-horizontal" action="deleteFromProvider"
									method="post">
									<fieldset>

										<br>
										<p>
											<big>Είστε βέβαιοι ότι θέλετε να διαγράψετε όλα τα
												στοιχεία που έχετε καταχωρήσει στο Busy Bees;</big>
										</p>

										<center>
											<div class="control-group">
												<label class="control-label" for="signin"></label>
												<div class="controls">
													<button type="submit" id="signin" name="signin"
														class="btn btn-logout">Διαγραφή</button>

													<button type="button" class="btn btn-theme"
														data-dismiss="modal">Ακύρωση</button>
												</div>

											</div>
										</center>

									</fieldset>
								</form>


							</div>

						</div>
					</div>
				</div>
				<%--MODAL --%>

			</div>
		</div>
	</div>




	<div class="container col-lg-offset-1">

		<table class="table table-hover">
			<thead>
				<tr>
					<th>Πεδίο Καταχώρησης</th>
					<th>Πληροφορίες</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<th>Κατηγορία</th>
					<td><%=infolist.getCategory() %></td>
				</tr>


				<tr>
					<th>Υποκατηγορία</th>
					<td><%=infolist.getSubcategory() %></td>
				</tr>

				<tr>
					<th>Όνομα</th>
					<td><%=infolist.getFirstName() %></td>
				</tr>

				<tr>
					<th>Επώνυμο</th>
					<td><%=infolist.getLastName() %></td>
				</tr>

				<tr>
					<th>Υπηρεσία</th>
					<td><%=infolist.getService() %></td>
				</tr>

				<tr>
					<th>Περιγραφή Υπηρεσίας</th>
					<td><%=infolist.getDescription() %></td>
				</tr>

				<tr>
					<th>Τιμή Υπηρεσίας</th>
					<td><%=infolist.getPrice() %></td>
				</tr>

				<tr>
					<th>Κατηγορία Τιμής</th>
					<td><%=infolist.getType() %></td>
				</tr>

				<tr>
					<th>Πόλη</th>
					<td><%=infolist.getCity() %></td>
				</tr>

				<tr>
					<th>Διεύθυνση</th>
					<td><%=infolist.getAddress() %></td>
				</tr>

				<tr>
					<th>Ταχυδρομικός Κώδικας</th>
					<td><%=infolist.getPc() %></td>
				</tr>

				<tr>
					<th>Τηλέφωνο</th>
					<td><%=infolist.getPhone() %></td>
				</tr>

				<tr>
					<th>E-mail</th>
					<td><%=infolist.getWorkemail() %></td>
				</tr>

				<tr>
					<th>Ιστοσελίδα</th>
					<td><%=infolist.getWebpage() %></td>
				</tr>


			</tbody>
		</table>
	</div>

	<br>
	
	<!-- *****************************************************************************************************************
	 FOOTER
	 ***************************************************************************************************************** -->
	<div id="footerwrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<h4>About</h4>
					<div class="hline-w"></div>
					<p>
						Το Busy Bees είναι ένα project που δημιουργήθηκε από την παραπάνω
						ομάδα στο πλαίσιο του 2nd Coding Bootcamp (<a
							href="http://www.afdemp.org/bootcamp/" target="blank">Alliance
							for Digital Employability</a>).
					</p>
				</div>
				<div class="col-lg-4">
					<h4>Ακολουθήστε μας</h4>
					<div class="hline-w"></div>
					<p>
						<a><i class="fa fa-facebook"></i></a> <a><i
							class="fa fa-twitter"></i></a> <a><i class="fa fa-linkedin"></i></a>
					</p>
				</div>
				<div class="col-lg-4">
					<h4>Επικοινωνία</h4>
					<div class="hline-w"></div>
					<p>
						<span class="glyphicon glyphicon glyphicon-earphone"
							aria-hidden="true"></span> &nbsp; 6972809585 <br> <span
							class="glyphicon glyphicon glyphicon-envelope" aria-hidden="true"></span>
						&nbsp; <a href="mailto:busybees@outlook.com" target="_top">busybees@outlook.com</a><br>
						<span class="glyphicon glyphicon glyphicon-map-marker"
							aria-hidden="true"></span> &nbsp; Ηρούς 4 & Κρέοντος 104 42,
						Αθήνα

					</p>
				</div>

			</div>
			<! --/row -->
		</div>
		<! --/container -->
	</div>
	<! --/footerwrap -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/retina-1.1.0.js"></script>
	<script src="js/jquery.hoverdir.js"></script>
	<script src="js/jquery.hoverex.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/custom.js"></script>


</body>
</html>
