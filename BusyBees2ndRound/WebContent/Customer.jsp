<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="ico/favicon.ico">

    <title>Busy Bees - Visitor</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">


    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="js/modernizr.js"></script>
  </head>

  <body>

    <!-- Fixed navbar -->

     <%@ page import="controllers.Login" %> 
	
	
			<% switch(Login.loginValue) {
		case 0: 
		System.out.println("logout out"); %>
			<%@ include  file="navbar_login.jsp"%>
			<%break;
		case 1:
			System.out.println("logedin provider"); %>
			<%@ include  file="navbar_provider.jsp"%>
			<%break;
		case 2:
			System.out.println("logedin user"); %>
			<%@ include  file="navbar_user.jsp"%>
			<%break;
	}
%>
  

    <div class="container">
      <br><br><br><br>

      <div class="col-lg-8 col-lg-offset-2 himg">
        <img src="img/mainlogo.png" class="img-responsive">
      </div>
      </div> <!-- /container -->

	<!-- *****************************************************************************************************************
	 FORMS
	 ***************************************************************************************************************** -->

	 <div class="container mtb">




	 	<div class="row">


<div class="col-lg-3">
        <img src="img/portfolio/household2.jpg" alt="artists" width = "100%">

</div>

	 		<div class="col-lg-9">
	 			<h4 style = "color:#ffb726">Καλώς ήρθες <i>
	 			
	 			
	 			
	 			
                   <%-- NEW --%>
             
                <%@ page import="model.Customer" %> 
                        
            
				<% Customer customer = (Customer)session.getAttribute("customer-object");	%>
							
			
				<%=customer.getCustomername() %>
				
             <%-- ************** --%>
	 			
	 			
	 			
	 			
	 			</i></h4>
	 			<div class="hline"></div>

          <p><i>Εδώ θα μπορούσαν να μπουν οι βαθμολογίες του χρήστη</i></p>


          <br>
          <br>

        
			</div><! --/col-lg-8 -->

	 	</div><! --/row -->
	 </div><! --/container -->


	<!-- *****************************************************************************************************************
	 FOOTER
	 ***************************************************************************************************************** -->
   <div id="footerwrap">
	 	<div class="container">
		 	<div class="row">
		 		<div class="col-lg-4">
		 			<h4>About</h4>
		 			<div class="hline-w"></div>
		 			<p>Το Busy Bees είναι ένα project που δημιουργήθηκε από την παραπάνω ομάδα στο πλαίσιο του 2nd Coding Bootcamp (<a href = "http://www.afdemp.org/bootcamp/" target = "blank">Alliance for Digital Employability</a>).</p>
		 		</div>
		 		<div class="col-lg-4">
		 			<h4>Ακολουθήστε μας</h4>
		 			<div class="hline-w"></div>
		 			<p>
		 				<a><i class="fa fa-facebook"></i></a>
		 				<a><i class="fa fa-twitter"></i></a>
            <a><i class="fa fa-linkedin"></i></a>
		 			</p>
		 		</div>
		 		<div class="col-lg-4">
		 			<h4>Επικοινωνία</h4>
		 			<div class="hline-w"></div>
		 			<p>
            <span class="glyphicon glyphicon glyphicon-earphone" aria-hidden="true"></span> &nbsp  6972809585 <br>
            <span class="glyphicon glyphicon glyphicon-envelope" aria-hidden="true"></span> &nbsp  <a href="mailto:busybees@outlook.com" target="_top">busybees@outlook.com</a><br>
            <span class="glyphicon glyphicon glyphicon-map-marker" aria-hidden="true"></span>  &nbsp Ηρούς 4 & Κρέοντος 104 42, Αθήνα


		 			</p>
		 		</div>

		 	</div><! --/row -->
	 	</div><! --/container -->
	 </div><! --/footerwrap -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="js/retina-1.1.0.js"></script>
	<script src="js/jquery.hoverdir.js"></script>
	<script src="js/jquery.hoverex.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
  	<script src="js/jquery.isotope.min.js"></script>
  	<script src="js/custom.js"></script>


  </body>
</html>
