<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="beesControllers.beesLogIn" %> 


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta http-equiv="refresh" content="3;url=ProviderProfile.jsp" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="Submit Form Success page">
<meta name="author" content="">
<title>Busy Bees - Επιτυχής Διαγραφή</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
        <br><br><br><br>

				<div class="col-lg-8 col-lg-offset-2 himg">
					<img src="img/mainlogo.png" class="img-responsive">
				</div>
		    </div> <!-- /container -->
    
    
    <br>
    <br>
    <br>
    <div style = "margin: auto auto">
    	<div class="container theme-showcase" role="main">

		<div class="alert alert-warning text-center" role="alert"><big><b>Τα στοιχεία σας διαγράφθηκαν επιτυχώς! Παρακαλώ περιμένετε...&nbsp</b></big>
		 		<img src= "img/beeflying.gif" alt = "countdown timer" width="80">
		
		</div>		
	
	</div>
</div>
</body>
</html>
