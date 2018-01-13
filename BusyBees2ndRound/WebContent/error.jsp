<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="ico/favicon.ico">

<title>Sad Bees</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">

<script src="js/modernizr.js"></script>
</head>

<body>

	<!-- Fixed navbar -->

    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.jsp">Sad Bees</a>

        </div>
      </div>
    </div>
 			 
				 
				 
				 
				 <div class="container centered">
        <br><br><br><br>

				<div class="col-lg-8 col-lg-offset-1">
					<img src="img/sadbee.gif"  width="350">
				</div>
		    </div> <!-- /container -->
		
    
   
    <br>
    <br>
    <div style = "margin: auto auto">
    	<div class="container theme-showcase" role="main">

		<div class="alert alert-warning text-center" role="alert">
		
		
		
		
		<big><b>
		
						 <%
				 	if (request.getAttribute("messageerror") != null) {
				 %> Ουπς! <br> Έχετε κάνει Signup; <br> Έχετε βάλει τον σωστό συνδυασμό email / password; 
				 
				 <br> Πατήστε <a href= "index.jsp">εδώ</a> και δοκιμάστε ξανά.
				 
										<%
				 	}
				 %>


					<% if(request.getAttribute("customeremailexists") != null) { %>
				
				Ουπς! <br> 	Το email που εισάγατε υπάρχει ήδη στην βάση μας.
				 
				 <br> Πατήστε <a href= "index.jsp">εδώ</a> και δοκιμάστε με ένα άλλο email.

				<% } %>



				<% if(request.getAttribute("provideremailexists") != null) { %>
						
				Ουπς! <br> 	Το email που εισάγατε υπάρχει ήδη στην βάση μας.
				 
				 <br> Πατήστε <a href= "index.jsp">εδώ</a> και δοκιμάστε με ένα άλλο email.

				<% } %>




				<% if(request.getAttribute("shortpsw") != null) { %>
							
							Ουπς! <br> 	Το password πρέπει να αποτελείται από τουλάχιστον 6 χαρακτήρες.
				 
				 <br> Πατήστε <a href= "index.jsp">εδώ</a> και δοκιμάστε ξανά.
							
			
							<% } %>




				</b></big> 
		
		
		   
 		
 		</div>		
	
		
	
	</div>
</div>
</body>
</html>