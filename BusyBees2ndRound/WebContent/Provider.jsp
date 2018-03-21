<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="assets/ico/favicon.ico">

<title>Busy Bees - User</title>

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

	<%@ page import="controllers.Login"%>


	<% switch(Login.loginValue) {
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

	<!-- *****************************************************************************************************************
	 FORMS
	 ***************************************************************************************************************** -->

	<div class="container mtb">

		<div class="row">


			<div class="col-lg-3">
				<img src="img/portfolio/household2.jpg" alt="artists" width="100%">

			</div>

			<div class="col-lg-9">
				<h4 style="color: #ffb726">
					Καλώς ήρθες <i> <%@ page import="model.Provider"%>

						<% Provider provider = (Provider)session.getAttribute("provider-object");	%>

						<%=provider.getProvidername()%>


					</i>
				</h4>
				<div class="hline"></div>
				<br>

				<p>Παρακαλώ επιλέξτε την ιδιότητά σας:</p>


				<!-- Nav tabs -->
				<ul class="nav nav-pills" role="tablist">
					<li><a href=".teachersform" class="btn hoverbutton" role="tab"
						data-toggle="tab">Εκπαιδευτικός</a></li>
					<li><a href=".workersform" class="btn hoverbutton" role="tab"
						data-toggle="tab">Μάστορας</a></li>
					<li><a href=".programmersform" class="btn hoverbutton"
						role="tab" data-toggle="tab">Κομπιουτεράς</a></li>
					<li><a href=".artistsform" class="btn hoverbutton" role="tab"
						data-toggle="tab">Καλλιτέχνης</a></li>
					<li><a href=".doctorsform" class="btn hoverbutton" role="tab"
						data-toggle="tab">Γιατρός</a></li>
				</ul>

			</div>
			<div class="col-lg-12">
				<!-- Tab panes -->
				<div class="tab-content">


					<!-- Teachers Form -->
					<div class="tab-pane teachersform">

						<div class="container mtb">
							<div class="row">
								<div class="col-lg-3">
									<img src="img/portfolio/teacher1.jpg" alt="teachers"
										width="100%">
								</div>
								<div class="col-lg-9">
									<h4 style="color: #ffb726">Φόρμα Καταχώρησης Στοιχείων
										Εκπαιδευτικών</h4>
									<div class="hline"></div>
									<p>
										Παρακαλούμε εισάγετε τα στοιχεία σας όπως θέλετε να
										εμφανίζονται στις αναζητήσεις των επισκεπτών της σελίδας. <br>
										Τα στοιχεία με * είναι υποχρεωτικά.
									</p>
									<form role="form" action="beesProvider" method="post">

										<div class="form-group">
											<input type="hidden" name="category" value="Εκπαιδευτικός">
											<label for="subcategory">Εκπαιδευτικός *</label> <select
												class="form-control" name="subcategory" required>
												<option value="Φιλόλογος">Φιλόλογος</option>
												<option value="Δάσκαλος">Δάσκαλος</option>
												<option value="Μαθηματικός">Μαθηματικός</option>
												<option value="Φυσικός">Φυσικός</option>
											</select>
										</div>

										<div class="form-group">
											<label for="firstName">Όνομα *</label> <input type="text"
												class="form-control" name="firstName" required>
										</div>

										<div class="form-group">
											<label for="lastName">Επώνυμο *</label> <input type="text"
												class="form-control" name="lastName" required>
										</div>

										<div class="form-group">
											<label for="service">Υπηρεσία *</label> <input type="text"
												class="form-control" name="service"
												placeholder="πχ. Ιδιαίτερα Λατινικών" required>
										</div>

										<div class="form-group">
											<label for="description">Περιγραφή Υπηρεσίας</label>
											<textarea class="form-control" rows="3" name="description"></textarea>
										</div>

										<div class="form-group">
											<label for="price">Τιμή Υπηρεσίας *</label> <input
												type="number" class="form-control" name="price"
												placeholder="Σε ευρώ" required>
										</div>

										<div class="form-group">
											<label for="type">Κατηγορία Τιμής *</label> <select
												class="form-control" name="type" required>
												<option value="Εφάπαξ">Εφάπαξ</option>
												<option value="Την ώρα">Την ώρα</option>
												<option value="Τον μήνα">Τον μήνα</option>
												<option value="Άλλο">Άλλο</option>
											</select>
										</div>

										<div class="form-group">
											<label for="city">Πόλη *</label> <select class="form-control"
												name="city" required>
												<option value="Αθήνα">Αθήνα</option>
												<option value="Θεσσαλονίκη">Θεσσαλονίκη</option>
												<option value="Πάτρα">Πάτρα</option>
												<option value="Λάρισα">Λάρισα</option>
												<option value="Χανιά">Χανιά</option>
												<option value="Ιωάννινα">Ιωάννινα</option>
											</select>
										</div>

										<div class="form-group">
											<label for="address">Διεύθυνση</label> <input type="text"
												class="form-control" name="address">
										</div>

										<div class="form-group">
											<label for="pc">Ταχυδρομικός Κώδικας</label> <input
												type="text" class="form-control" name="pc">
										</div>

										<div class="form-group">
											<label for="phone">Τηλέφωνο *</label> <input type="text"
												class="form-control" name="phone" required>
										</div>

										<div class="form-group">
											<label for="workemail">E-mail</label> <input type="email"
												class="form-control" name="workemail">
										</div>

										<div class="form-group">
											<label for="webpage">Ιστοσελίδα</label> <input type="text"
												class="form-control" name="webpage">
										</div>

										<button type="submit" class="btn btn-theme">Υποβολή</button>
									</form>
								</div>
								<! --/col-lg-8 -->

							</div>
							<! --/row -->
						</div>
						<! --/container -->

					</div>


					<!-- Workers Form -->
					<div class="tab-pane workersform">

						<div class="container mtb">

							<div class="row">

								<div class="col-lg-3">
									<img src="img/portfolio/worker3.jpg" alt="workers" width="100%">

								</div>
								<div class="col-lg-9">
									<h4 style="color: #ffb726">Φόρμα Καταχώρησης Στοιχείων
										Μαστόρων</h4>
									<div class="hline"></div>
									<p>
										Παρακαλούμε εισάγετε τα στοιχεία σας όπως θέλετε να
										εμφανίζονται στις αναζητήσεις των επισκεπτών της σελίδας. <br>
										Τα στοιχεία με * είναι υποχρεωτικά.
									</p>

									<form role="form" action="beesProvider" method="post"
										oninput="x.value=parseInt(a.value)">

										<div class="form-group">
											<input type="hidden" name="category" value="Μάστορας">
											<label for="subcategory">Μάστορας *</label> <select
												class="form-control" name="subcategory" required>
												<option value="Ηλεκτρολόγος">Ηλεκτρολόγος</option>
												<option value="Υδραυλικός">Υδραυλικός</option>
												<option value="Ελαιοχρωματιστής">Ελαιοχρωματιστής</option>
												<option value="Ξυλουργός">Ξυλουργός</option>
											</select>
										</div>

										<div class="form-group">
											<label for="firstName">Όνομα *</label> <input type="text"
												class="form-control" name="firstName" required>
										</div>

										<div class="form-group">
											<label for="lastName">Επώνυμο *</label> <input type="text"
												class="form-control" name="lastName" required>
										</div>

										<div class="form-group">
											<label for="service">Υπηρεσία *</label> <input type="text"
												class="form-control" name="service"
												placeholder="πχ. Εγκατάσταση Φωτιστικών" required>
										</div>

										<div class="form-group">
											<label for="description">Περιγραφή Υπηρεσίας</label>
											<textarea class="form-control" rows="3" name="description"></textarea>
										</div>

										<div class="form-group">
											<label for="price">Τιμή Υπηρεσίας *</label> <input
												type="number" class="form-control" name="price"
												placeholder="Σε ευρώ" required>
										</div>

										<div class="form-group">
											<label for="type">Κατηγορία Τιμής *</label> <select
												class="form-control" name="type" required>
												<option value="Εφάπαξ">Εφάπαξ</option>
												<option value="Την ώρα">Την ώρα</option>
												<option value="Τον μήνα">Τον μήνα</option>
												<option value="Άλλο">Άλλο</option>
											</select>
										</div>

										<div class="form-group">
											<label for="city">Πόλη *</label> <select class="form-control"
												name="city" required>
												<option value="Αθήνα">Αθήνα</option>
												<option value="Θεσσαλονίκη">Θεσσαλονίκη</option>
												<option value="Πάτρα">Πάτρα</option>
												<option value="Λάρισα">Λάρισα</option>
												<option value="Χανιά">Χανιά</option>
												<option value="Ιωάννινα">Ιωάννινα</option>
											</select>
										</div>

										<div class="form-group">
											<label for="address">Διεύθυνση</label> <input type="text"
												class="form-control" name="address">
										</div>

										<div class="form-group">
											<label for="pc">Ταχυδρομικός Κώδικας</label> <input
												type="text" class="form-control" name="pc">
										</div>

										<div class="form-group">
											<label for="phone">Τηλέφωνο *</label> <input type="text"
												class="form-control" name="phone" required>
										</div>

										<div class="form-group">
											<label for="workemail">E-mail</label> <input type="email"
												class="form-control" name="workemail">
										</div>

										<div class="form-group">
											<label for="webpage">Ιστοσελίδα</label> <input type="text"
												class="form-control" name="webpage">
										</div>


										<button type="submit" class="btn btn-theme">Υποβολή</button>
									</form>
								</div>
								<! --/col-lg-8 -->
							</div>
							<! --/row -->
						</div>
						<! --/container -->
					</div>


					<!-- Programmers Form ------------------------------------------------------------------------------------------------------------------>
					<div class="tab-pane programmersform">
						<div class="container mtb">


							<div class="row">

								<div class="col-lg-3">
									<img src="img/portfolio/programmer2.jpg" alt="programmers"
										width="100%">
								</div>

								<div class="col-lg-9">
									<h4 style="color: #ffb726">Φόρμα Καταχώρησης Στοιχείων
										Κομπιουτεράδων</h4>
									<div class="hline"></div>
									<p>
										Παρακαλούμε εισάγετε τα στοιχεία σας όπως θέλετε να
										εμφανίζονται στις αναζητήσεις των επισκεπτών της σελίδας. <br>
										Τα στοιχεία με * είναι υποχρεωτικά.
									</p>
									<form role="form" action="beesProvider" method="post"
										oninput="x.value=parseInt(a.value)">
										<input type="hidden" name="category" value="Κομπιουτεράς">
										<div class="form-group">
											<label for="subcategory">Κομπιουτεράς *</label> <select
												class="form-control" name="subcategory" required>
												<option value="Developer">Developer</option>
												<option value="Web Designer">Web Designer</option>
												<option value="Τεχνικός Δικτύων">Τεχνικός Δικτύων</option>
												<option value="Windows Expert">Windows Expert</option>
											</select>
										</div>

										<div class="form-group">
											<label for="firstName">Όνομα *</label> <input type="text"
												class="form-control" name="firstName" required>
										</div>

										<div class="form-group">
											<label for="lastName">Επώνυμο *</label> <input type="text"
												class="form-control" name="lastName" required>
										</div>

										<div class="form-group">
											<label for="service">Υπηρεσία *</label> <input type="text"
												class="form-control" name="service"
												placeholder="πχ. Καθάρισμα από ιούς" required>
										</div>

										<div class="form-group">
											<label for="description">Περιγραφή Υπηρεσίας</label>
											<textarea class="form-control" rows="3" name="description"></textarea>
										</div>

										<div class="form-group">
											<label for="price">Τιμή Υπηρεσίας *</label> <input
												type="number" class="form-control" name="price"
												placeholder="Σε ευρώ" required>
										</div>

										<div class="form-group">
											<label for="type">Κατηγορία Τιμής *</label> <select
												class="form-control" name="type" required>
												<option value="Εφάπαξ">Εφάπαξ</option>
												<option value="Την ώρα">Την ώρα</option>
												<option value="Τον μήνα">Τον μήνα</option>
												<option value="Άλλο">Άλλο</option>
											</select>
										</div>

										<div class="form-group">
											<label for="city">Πόλη *</label> <select class="form-control"
												name="city" required>
												<option value="Αθήνα">Αθήνα</option>
												<option value="Θεσσαλονίκη">Θεσσαλονίκη</option>
												<option value="Πάτρα">Πάτρα</option>
												<option value="Λάρισα">Λάρισα</option>
												<option value="Χανιά">Χανιά</option>
												<option value="Ιωάννινα">Ιωάννινα</option>
											</select>
										</div>

										<div class="form-group">
											<label for="address">Διεύθυνση</label> <input type="text"
												class="form-control" name="address">
										</div>

										<div class="form-group">
											<label for="pc">Ταχυδρομικός Κώδικας</label> <input
												type="text" class="form-control" name="pc">
										</div>

										<div class="form-group">
											<label for="phone">Τηλέφωνο *</label> <input type="text"
												class="form-control" name="phone" required>
										</div>

										<div class="form-group">
											<label for="workemail">E-mail</label> <input type="email"
												class="form-control" name="workemail">
										</div>

										<div class="form-group">
											<label for="webpage">Ιστοσελίδα</label> <input type="text"
												class="form-control" name="webpage">
										</div>



										<button type="submit" class="btn btn-theme">Υποβολή</button>
									</form>
								</div>
								<! --/col-lg-8 -->

							</div>
							<! --/row -->
						</div>
						<! --/container -->
					</div>

					<!-- Artists Form ------------------------------------------------------------------------------------------------------------------------>
					<div class="tab-pane artistsform">
						<div class="container mtb">

							<div class="row">

								<div class="col-lg-3">
									<img src="img/portfolio/musician1.jpg" alt="artists"
										width="100%">

								</div>

								<div class="col-lg-9">
									<h4 style="color: #ffb726">Φόρμα Καταχώρησης Στοιχείων
										Καλλιτεχνών</h4>
									<div class="hline"></div>
									<p>
										Παρακαλούμε εισάγετε τα στοιχεία σας όπως θέλετε να
										εμφανίζονται στις αναζητήσεις των επισκεπτών της σελίδας. <br>
										Τα στοιχεία με * είναι υποχρεωτικά.
									</p>
									<form role="form" action="beesProvider" method="post"
										oninput="x.value=parseInt(a.value)">
										<input type="hidden" name="category" value="Καλλιτέχνης">
										<div class="form-group">
											<label for="subcategory">Καλλιτέχνης *</label> <select
												class="form-control" name="subcategory" required>
												<option value="Μουσικός">Μουσικός</option>
												<option value="Τραγουδιστής">Τραγουδιστής</option>
												<option value="Ηθοποιός">Ηθοποιός</option>
												<option value="Κλόουν">Κλόουν</option>
											</select>
										</div>

										<div class="form-group">
											<label for="firstName">Όνομα *</label> <input type="text"
												class="form-control" name="firstName" required>
										</div>

										<div class="form-group">
											<label for="lastName">Επώνυμο *</label> <input type="text"
												class="form-control" name="lastName" required>
										</div>

										<div class="form-group">
											<label for="service">Υπηρεσία *</label> <input type="text"
												class="form-control" name="service"
												placeholder="πχ. Performance" required>
										</div>

										<div class="form-group">
											<label for="description">Περιγραφή Υπηρεσίας</label>
											<textarea class="form-control" rows="3" name="description"></textarea>
										</div>

										<div class="form-group">
											<label for="price">Τιμή Υπηρεσίας *</label> <input
												type="number" class="form-control" name="price"
												placeholder="Σε ευρώ" required>
										</div>

										<div class="form-group">
											<label for="type">Κατηγορία Τιμής *</label> <select
												class="form-control" name="type" required>
												<option value="Εφάπαξ">Εφάπαξ</option>
												<option value="Την ώρα">Την ώρα</option>
												<option value="Τον μήνα">Τον μήνα</option>
												<option value="Άλλο">Άλλο</option>
											</select>
										</div>

										<div class="form-group">
											<label for="city">Πόλη *</label> <select class="form-control"
												name="city" required>
												<option value="Αθήνα">Αθήνα</option>
												<option value="Θεσσαλονίκη">Θεσσαλονίκη</option>
												<option value="Πάτρα">Πάτρα</option>
												<option value="Λάρισα">Λάρισα</option>
												<option value="Χανιά">Χανιά</option>
												<option value="Ιωάννινα">Ιωάννινα</option>
											</select>
										</div>

										<div class="form-group">
											<label for="address">Διεύθυνση</label> <input type="text"
												class="form-control" name="address">
										</div>

										<div class="form-group">
											<label for="pc">Ταχυδρομικός Κώδικας</label> <input
												type="text" class="form-control" name="pc">
										</div>

										<div class="form-group">
											<label for="phone">Τηλέφωνο *</label> <input type="text"
												class="form-control" name="phone" required>
										</div>

										<div class="form-group">
											<label for="workemail">E-mail</label> <input type="email"
												class="form-control" name="workemail">
										</div>

										<div class="form-group">
											<label for="webpage">Ιστοσελίδα</label> <input type="text"
												class="form-control" name="webpage">
										</div>



										<button type="submit" class="btn btn-theme">Υποβολή</button>
									</form>
								</div>
								<! --/col-lg-8 -->

							</div>
							<! --/row -->
						</div>
						<! --/container -->
					</div>

					<!-- Doctors Form -->
					<div class="tab-pane doctorsform">
						<div class="container mtb">

							<div class="row">
								<div class="col-lg-3">
									<img src="img/portfolio/doc3.jpg" alt="doctors" width="100%">

								</div>

								<div class="col-lg-9">
									<h4 style="color: #ffb726">Φόρμα Καταχώρησης Στοιχείων
										Γιατρών</h4>
									<div class="hline"></div>
									<p>
										Παρακαλούμε εισάγετε τα στοιχεία σας όπως θέλετε να
										εμφανίζονται στις αναζητήσεις των επισκεπτών της σελίδας. <br>
										Τα στοιχεία με * είναι υποχρεωτικά.
									</p>
									<form role="form" action="beesProvider" method="post"
										oninput="x.value=parseInt(a.value)">
										<input type="hidden" name="category" value="Γιατρός">
										<div class="form-group">
											<label for="subcategory">Γιατρός *</label> <select
												class="form-control" name="subcategory" required>
												<option value="Παθολόγος">Παθολόγος</option>
												<option value="Γυναικολόγος">Γυναικολόγος</option>
												<option value="Οδοντίατρος">Οδοντίατρος</option>
												<option value="Οφθαλμίατρος">Οφθαλμίατρος</option>
											</select>
										</div>

										<div class="form-group">
											<label for="firstName">Όνομα *</label> <input type="text"
												class="form-control" name="firstName" required>
										</div>

										<div class="form-group">
											<label for="lastName">Επώνυμο *</label> <input type="text"
												class="form-control" name="lastName" required>
										</div>

										<div class="form-group">
											<label for="service">Υπηρεσία *</label> <input type="text"
												class="form-control" name="service"
												placeholder="πχ. Υπερηχογράφημα" required>
										</div>

										<div class="form-group">
											<label for="description">Περιγραφή Υπηρεσίας</label>
											<textarea class="form-control" rows="3" name="description"></textarea>
										</div>

										<div class="form-group">
											<label for="price">Τιμή Υπηρεσίας *</label> <input
												type="number" class="form-control" name="price"
												placeholder="Σε ευρώ" required>
										</div>

										<div class="form-group">
											<label for="type">Κατηγορία Τιμής *</label> <select
												class="form-control" name="type" required>
												<option value="Εφάπαξ">Εφάπαξ</option>
												<option value="Την ώρα">Την ώρα</option>
												<option value="Τον μήνα">Τον μήνα</option>
												<option value="Άλλο">Άλλο</option>
											</select>
										</div>

										<div class="form-group">
											<label for="city">Πόλη *</label> <select class="form-control"
												name="city" required>
												<option value="Αθήνα">Αθήνα</option>
												<option value="Θεσσαλονίκη">Θεσσαλονίκη</option>
												<option value="Πάτρα">Πάτρα</option>
												<option value="Λάρισα">Λάρισα</option>
												<option value="Χανιά">Χανιά</option>
												<option value="Ιωάννινα">Ιωάννινα</option>
											</select>
										</div>

										<div class="form-group">
											<label for="address">Διεύθυνση</label> <input type="text"
												class="form-control" name="address">
										</div>

										<div class="form-group">
											<label for="pc">Ταχυδρομικός Κώδικας</label> <input
												type="text" class="form-control" name="pc">
										</div>

										<div class="form-group">
											<label for="phone">Τηλέφωνο *</label> <input type="text"
												class="form-control" name="phone" required>
										</div>

										<div class="form-group">
											<label for="workemail">E-mail</label> <input type="email"
												class="form-control" name="workemail">
										</div>

										<div class="form-group">
											<label for="webpage">Ιστοσελίδα</label> <input type="text"
												class="form-control" name="webpage">
										</div>


										<button type="submit" class="btn btn-theme">Υποβολή</button>
									</form>
								</div>
								<! --/col-lg-8 -->

							</div>
							<! --/row -->
						</div>
						<! --/container -->

					</div>
				</div>

			</div>
			<! --/col-lg-8 -->

		</div>
		<! --/row -->
	</div>
	<! --/container -->


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
