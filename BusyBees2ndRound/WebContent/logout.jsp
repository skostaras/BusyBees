<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="beesControllers.beesLogIn" %> 

<%
beesLogIn.loginValue = 0;
session.invalidate();

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta http-equiv="refresh" content="3;url=index.jsp" />

<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="log out page">
<meta name="author" content="">
<title>Logout</title>
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


 <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">Busy Bees</a>

        </div>
        <div class="navbar-collapse collapse navbar-right">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">ΑΡΧΙΚΗ</a></li>
            <li><a href="index.jsp#faq">FAQ</a></li>
            <li><a href="#footerwrap">ΕΠΙΚΟΙΝΩΝΙΑ</a></li>
            <li>  <a><span class="glyphicon glyphicon-user" aria-hidden="true"> LOGIN</a></span></li>


          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
    
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

		<div class="alert alert-success text-center" role="alert"><big><b>Αποσυνδεθήκατε από το Busy Bees! Σας περιμένουμε ξανά σύντομα...&nbsp</b></big>
		<img src= "img/beeflying.gif" alt = "countdown timer" width="80">
		</div>		
	
	</div>
</div>
</body>
</html>
