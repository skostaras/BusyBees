<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="ico/favicon.ico">

<title>Busy Bees</title>

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


	<%
		switch (beesLogIn.loginValue) {
			case 0 :
				System.out.println("loged out");
	%>
	<%@ include file="navbar_login.jsp"%>
	<%
		break;
			case 1 :
				System.out.println("logedin provider");
	%>
	<%@ include file="navbar_provider.jsp"%>
	<%
		break;
			case 2 :
				System.out.println("logedin user");
	%>
	<%@ include file="navbar_user.jsp"%>
	<%
		break;
		}
	%>



	<!-- *****************************************************************************************************************
	 HEADERWRAP
	 ***************************************************************************************************************** -->

	<div class="container">
		<br>



		<div class="col-lg-8 col-lg-offset-2 himg">
			<img src="img/mainlogo.png" class="img-responsive">
		</div>
	</div>
	<!-- /container -->

	<br>
	<div class="container centered">
		<form action="searchresults" method="post">
			<input type="image" src="img/search.png" /> <br> <input
				type="text" id="searchbox" name="searchButton"
				placeholder="Search...">
		</form>
	</div>

	<!-- *****************************************************************************************************************
	 Κατηγορίες Επαγγελμάτων
	 ***************************************************************************************************************** -->
	<div id="portfoliowrap">


		<h2 style="color: #ffb726">Κατηγορίες Επαγγελμάτων</h2>

		<div class="portfolio-centered">
			<div class="recentitems portfolio">

				<div class="portfolio-item web-design">

					<div class="he-wrap tpl6">

						<img src="img/portfolio/teacher1.jpg" alt="teachers">
						<div class="he-view">

							<div class="bg a0" data-animate="fadeIn">

								<h3 class="a1" data-animate="fadeInDown">Εκπαιδευτικοι</h3>
								<br>

								<form action="searchByCategory" method="post">

									<input type="hidden" name="category" value="Εκπαιδευτικός">

									<button type="submit" class="dmbutton a2"
										data-animate="fadeInUp" value="Submit">
										<i class="fa fa-search"></i> Αναζήτηση
									</button>


								</form>

								<!-- <a href="resultsOfSearch.jsp" class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Φιλόλογοι</a>
                              <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Δάσκαλοι</a><br>
                              <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i>  Μαθηματικοί</a>
                              <a href=".........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Φυσικοί</a>-->
							</div>
						</div>
						<!-- he bg -->
					</div>
					<!-- he view -->
				</div>
				<!-- he wrap -->



				<div class="portfolio-item web-design">

					<div class="he-wrap tpl6">
						<img src="img/portfolio/worker3.jpg" alt="workers">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">Μαστορες</h3>
								<br>

								<form action="searchByCategory" method="post">

									<input type="hidden" name="category" value="Μάστορας">

									<button type="submit" class="dmbutton a2"
										data-animate="fadeInUp" value="Submit">
										<i class="fa fa-search"></i> Αναζήτηση
									</button>


								</form>


								<!--   <a href="....." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Ηλεκτρολόγοι</a>
                                <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Υδραυλικοί</a><br>
                                <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Ελαιοχρωματιστές</a>
                                <a href=".........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Ξυλουργοί</a>-->
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->



				<div class="portfolio-item web-design">
					<div class="he-wrap tpl6">
						<img src="img/portfolio/programmer2.jpg" alt="programmer">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">Κομπιουτεραδες</h3>
								<br>


								<form action="searchByCategory" method="post">

									<input type="hidden" name="category" value="Κομπιουτεράς">

									<button type="submit" class="dmbutton a2"
										data-animate="fadeInUp" value="Submit">
										<i class="fa fa-search"></i> Αναζήτηση
									</button>


								</form>


								<!-- <a href="....." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Developers</a>
                        <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Web Designers</a><br>
                        <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i>  Τεχνικοί Δικτύων</a>
                        <a href=".........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Windows Experts</a> -->
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->


				<div class="portfolio-item web-design">
					<div class="he-wrap tpl6">
						<img src="img/portfolio/musician1.jpg" alt="workers">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">Καλλιτεχνες</h3>
								<br>

								<form action="searchByCategory" method="post">

									<input type="hidden" name="category" value="Καλλιτέχνης">

									<button type="submit" class="dmbutton a2"
										data-animate="fadeInUp" value="Submit">
										<i class="fa fa-search"></i> Αναζήτηση
									</button>


								</form>

								<!--  <a href="....." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Μουσικοί</a>
                    <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Τραγουδιστές</a><br>
                    <a href="....." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Ηθοποιοί</a>
                    <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> <small>(καθόλου τρομαχτικοί)</small> Κλόουν</a>-->
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->




				<div class="portfolio-item web-design">
					<div class="he-wrap tpl6">
						<img src="img/portfolio/doc3.jpg" alt="doctors">
						<div class="he-view">
							<div class="bg a0" data-animate="fadeIn">
								<h3 class="a1" data-animate="fadeInDown">Γιατροι</h3>
								<br>


								<form action="searchByCategory" method="post">

									<input type="hidden" name="category" value="Γιατρός">

									<button type="submit" class="dmbutton a2"
										data-animate="fadeInUp" value="Submit">
										<i class="fa fa-search"></i> Αναζήτηση
									</button>


								</form>

								<!--  <a href="....." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Παθολόγοι</a>
                <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Γυναικολόγοι</a><br>
                <a href="........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Οδοντίατροι</a>
                <a href=".........." class="dmbutton a2" data-animate="fadeInUp"><i class="fa fa-search"></i> Οφθαλμίατροι</a>-->
							</div>
							<!-- he bg -->
						</div>
						<!-- he view -->
					</div>
					<!-- he wrap -->
				</div>
				<!-- end col-12 -->


			</div>
			<!-- portfolio -->
		</div>
		<!-- portfolio container -->
	</div>
	<!--/Portfoliowrap -->



	<!--****************FAQ--------------------->

	<div id="faq"></div>
	<div class="container ">
		<h2 style="text-align: center; color: #ffb726">FAQ</h2>
		<div class="panel-group" id="faqAccordion">

			<div class="panel panel-default ">
				<div
					class="panel-heading accordion-toggle collapsed question-toggle"
					data-toggle="collapse" data-parent="#faqAccordion"
					data-target="#question6">
					<h4 class="panel-title">
						<a class="ing">​​Τι είναι το Busy Bees;</a>
					</h4>
				</div>
				<div id="question6" class="panel-collapse collapse"
					style="height: 0px;">
					<div class="panel-body">
						<p>
							Το Busy Bees είναι μία σύγχρονη πλατφόρφμα αναζήτησης υπηρεσιών
							και επαγγελματιών που έχει ως βασικό σκοπό να εξοικονομήσει
							χρήματα από το πορτοφόλι σας, επιλέγοντας τον πιο φθηνό
							επαγγελματία σύμφωνα με την υπηρεσία που ψάχνετε! <small>Ναι,
								κάτι σαν το Skroutz αλλά για υπηρεσίες. Δεν είπε κανένας ότι
								ανακαλύψαμε τον τροχό...</small>
						</p>
					</div>
				</div>
			</div>

			<div class="panel panel-default ">
				<div
					class="panel-heading accordion-toggle question-toggle collapsed"
					data-toggle="collapse" data-parent="#faqAccordion"
					data-target="#question0">
					<h4 class="panel-title">
						<a class="ing">​Σε τι διαφέρει το Busy Bees από τα υπόλοιπα
							σχετικά websites;</a>
					</h4>
				</div>
				<div id="question0" class="panel-collapse collapse"
					style="height: 0px;">
					<div class="panel-body">
						<p>​Έχει πιο όμορφο περιτύλγμα.</p>
					</div>
				</div>
			</div>


			<div class="panel panel-default ">
				<div
					class="panel-heading accordion-toggle collapsed question-toggle"
					data-toggle="collapse" data-parent="#faqAccordion"
					data-target="#question2">
					<h4 class="panel-title">
						<a class="ing">​Που βάζω την πιστωτική μου κάρτα;</a>
					</h4>
				</div>
				<div id="question2" class="panel-collapse collapse"
					style="height: 0px;">
					<div class="panel-body">
						<p>​Πουθενά! Προς το παρόν κανονίζετε τις πληρωμές με τον
							εκάστοτε επαγγελματία.</p>
					</div>
				</div>
			</div>

			<div class="panel panel-default ">
				<div
					class="panel-heading accordion-toggle collapsed question-toggle"
					data-toggle="collapse" data-parent="#faqAccordion"
					data-target="#question3">
					<h4 class="panel-title">
						<a class="ing">​Τι γίνεται αν δεν μείνω ευχαριστημένος από τον
							επαγγελματία που επέλεξα;</a>
					</h4>
				</div>
				<div id="question3" class="panel-collapse collapse"
					style="height: 0px;">
					<div class="panel-body">
						<p>​Προς το παρόν δεν υπάρχει η δυνατότητα βαθμολογιών ή
							reviews. Μείνετε όμως συντονισμένοι!</p>
					</div>
				</div>
			</div>

			<div class="panel panel-default ">
				<div
					class="panel-heading accordion-toggle collapsed question-toggle"
					data-toggle="collapse" data-parent="#faqAccordion"
					data-target="#question1">
					<h4 class="panel-title">
						<a class="ing"​>Γιατί ονομάσετε την ιστοσελίδα σας "Busy
							Bees";</a>
					</h4>
				</div>
				<div id="question1" class="panel-collapse collapse"
					style="height: 0px;">
					<div class="panel-body">
						<p>​Γιατί το busy waiting ήταν πιασμένο.</p>
					</div>
				</div>
			</div>



			<div class="panel panel-default ">
				<div
					class="panel-heading accordion-toggle collapsed question-toggle"
					data-toggle="collapse" data-parent="#faqAccordion"
					data-target="#question4">
					<h4 class="panel-title">
						<a class="ing"​>Έχω μία νέα ιδέα για την σελίδα σας!</a>
					</h4>
				</div>
				<div id="question4" class="panel-collapse collapse"
					style="height: 0px;">
					<div class="panel-body">
						<p>
							​Εκπληκτικά! Θα θέλαμε πολύ να την ακούσουμε. Στείλτε μας email <a
								href data-toggle="modal" data-target="#newemail">εδώ.</a>
						</p>

						<!-- Modal -->
						<div class="modal fade" id="newemail" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header forgotpsw">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">Αποστολή νέας ιδέας στο Busy
											Bees!</h4>
									</div>
									<div class="modal-body">
										<form
											action="https://cdn.someecards.com/someecards/usercards/MjAxMy1kYTQyZDgzYWY5YWNjZGYx.png"
											target="_blank">
											<p>Παρακαλoύμε, περιγράψτε παρακάτω αναλυτικά την ιδέα
												σας.</p>
											<textarea class="form-control" rows="3"></textarea>


											<div class="modal-footer">
												<button type="submit" class="btn btn-theme">Αποστολή</button>
											</div>
										</form>
									</div>

								</div>

							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
		<!--/panel-group-->
	</div>


	<!-- *****************************************************************************************************************
	 CAROUSEL
	 ***************************************************************************************************************** -->

	<br>

	<div class="container" style="width: 35%">
		<h2 class="centered" style="color: #ffb726">Είπανε για εμάς</h2>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" data-interval="10000">

				<div class="item active">
					<img src="img/carousel/carousel1.jpg" alt="carousel1">
					<div class="carousel-caption">
						<h5>
							<b>Μαρίκα Κοροντογέρου, νοικοκυρά</b>
						</h5>
						<p style="text-shadow: 1px 1px black; color: white"
							class="carouselfont">
							<small>Μου είχε χαλάσει ο νιπτήρας. Έψαχνα για μέρες
								μέχρι να βρω τον τέλειο υδραυλικό, αλλά μάταια. Με το Busy Bees
								έγιναν όλα τόσο γρήγορα... Ένα τηλέφωνο και εντός μισής ώρας
								σκάει μύτη στο μπάνιο μου, ο Σάκης ο Παίδαρος! Ευχαριστώ Busy
								Bees!</small>
						</p>
					</div>
				</div>

				<div class="item">
					<img src="img/carousel/carousel2.jpg" alt="carousel2">
					<div class="carousel-caption">
						<h5>
							<b>Βασίλης Γκεϊτίδης, ταξιτζής</b>
						</h5>
						<p style="text-shadow: 1px 1px white" class="carouselfont">
							<small>Εκεί που χάζευα στο contra.γρ, μου πετάγεται ένα
								παράθυρο και επέλεξα παντού "I Agree" και "Next, next, next" και
								πάρε τον ιό! Καλά που βρήκα τον κομπιουτερά μου από Busy Bees!
								Με σώσατε!!!</small>
						</p>
					</div>
				</div>

				<div class="item">
					<img src="img/carousel/carousel3.jpg" alt="carousel3">
					<div class="carousel-caption">
						<h5>
							<b>Άγγελος Καλοκαρδόπουλος, εισοδηματίας</b>
						</h5>
						<p style="text-shadow: 1px 1px black; color: white"
							class="carouselfont">
							<small>Είχα μία γιαγιά που κάθε βράδυ ροχάλιζε σαν
								νταλικιέρης. "Πάμε στο ΙΚΑ βρε γιαγιά να κοιτάξουνε τα
								αναπνευστικά σου", τίποτα αυτή, ξεροκέφαλη. Ώσπου ανακάλυψα ένα
								γιατρουδάκι από το Busy Bees που με 20&euro; την ξέκανε!
								Επιτέλους, κοιμάμαι σαν άνθρωπος!!!</small>
						</p>
					</div>
				</div>

			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>




	<!-- ==== TEAM MEMBERS ==== -->
	<br>
	<div class="container" id="team" name="team">
		<br>
		<div class="row white centered">
			<h2 class="centered" style="color: #ffb726">Ποιοί Είμαστε;</h2>
			<hr>
			<br> <br>

			<!-- col-lg-3 -->

			<div class="col-lg-4 centered">
				<img class="img img-circle" src="img/team/anna2.jpg" height="120px"
					width="120px" alt=""> <br>
				<h4>
					<b>Άννα Καρασούλου</b>
				</h4>
				<a href="https://www.linkedin.com/in/anna-karasoulou/"
					target="blank"><i class="fa fa-linkedin"></i></a>
				<p>Enthusiastic Software Engineer and Developer with a Ph.D in
					Computer Science from Department of Informatics and
					Telecommunications from University of Athens in Greece.</p>
			</div>
			<!-- col-lg-3 -->

			<div class="col-lg-4 centered">
				<img class="img img-circle" src="img/team/stefanos2.jpg"
					height="120px" width="120px" alt=""> <br>
				<h4>
					<b>Στέφανος Κωσταράς</b>
				</h4>
				<a href="https://www.linkedin.com/in/stefanoskostaras"
					target="blank"><i class="fa fa-linkedin"></i></a>
				<p>Stefanos firmly believes in reassessing the value of
					laziness, of boredom and the value of a good pizza dough. Maybe,
					just maybe the value of an avocado pit as well, but that's all.</p>
			</div>

			<div class="col-lg-4 centered">
				<img class="img img-circle" src="img/team/stelios.jpg"
					height="120px" width="120px" alt=""> <br>
				<h4>
					<b>Στέλιος Βαξεβανέρης</b>
				</h4>
				<a href="https://www.linkedin.com/in/stelios-vaxevaneris-912b6418/"
					target="blank"><i class="fa fa-linkedin"></i></a>
				<p>I like coding as it involves problem-solving skills and
					allows me to stretch my thinking capabilities and broaden my
					knowledge.</p>
			</div>
			<!-- col-lg-3 -->

		</div>
		<!-- row -->
	</div>
	<!-- container -->


	<%@ include file="footer.jsp"%>



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


	<script>
		// Portfolio
		(function($) {
			"use strict";
			var $container = $('.portfolio'), $items = $container
					.find('.portfolio-item'), portfolioLayout = 'fitRows';

			if ($container.hasClass('portfolio-centered')) {
				portfolioLayout = 'masonry';
			}

			$container.isotope({
				filter : '*',
				animationEngine : 'best-available',
				layoutMode : portfolioLayout,
				animationOptions : {
					duration : 750,
					easing : 'linear',
					queue : false
				},
				masonry : {}
			}, refreshWaypoints());

			function refreshWaypoints() {
				setTimeout(function() {
				}, 1000);
			}

			$('nav.portfolio-filter ul a').on('click', function() {
				var selector = $(this).attr('data-filter');
				$container.isotope({
					filter : selector
				}, refreshWaypoints());
				$('nav.portfolio-filter ul a').removeClass('active');
				$(this).addClass('active');
				return false;
			});

			function getColumnNumber() {
				var winWidth = $(window).width(), columnNumber = 1;

				if (winWidth > 1200) {
					columnNumber = 5;
				} else if (winWidth > 950) {
					columnNumber = 4;
				} else if (winWidth > 600) {
					columnNumber = 3;
				} else if (winWidth > 400) {
					columnNumber = 2;
				} else if (winWidth > 250) {
					columnNumber = 1;
				}
				return columnNumber;
			}

			function setColumns() {
				var winWidth = $(window).width(), columnNumber = getColumnNumber(), itemWidth = Math
						.floor(winWidth / columnNumber);

				$container.find('.portfolio-item').each(function() {
					$(this).css({
						width : itemWidth + 'px'
					});
				});
			}

			function setPortfolio() {
				setColumns();
				$container.isotope('reLayout');
			}

			$container.imagesLoaded(function() {
				setPortfolio();
			});

			$(window).on('resize', function() {
				setPortfolio();
			});
		})(jQuery);
	</script>
</body>
</html>
