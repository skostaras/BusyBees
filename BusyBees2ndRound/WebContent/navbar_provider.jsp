
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body>
	<!-- Fixed navbar -->

	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Busy Bees</a>

			</div>
			<div class="navbar-collapse collapse navbar-right">
				<ul class="nav navbar-nav">
					<li class="active"><a href="index.jsp">ΑΡΧΙΚΗ</a></li>
					<li><a href="index.jsp#faq">FAQ</a></li>
					<li><a href="#footerwrap">ΕΠΙΚΟΙΝΩΝΙΑ</a></li>

					<li class="dropdown"><a href="#"
						class="dropdown-toggle glyphicon glyphicon-user"
						data-toggle="dropdown"> <%-- NEW --%> <%@ page
								import="beesJava.Provider"%> <% Provider provider = (Provider)session.getAttribute("provider-object");	
				String useraname=null;
				if(provider!=null){
					useraname=provider.getProvidername().toUpperCase();
				}
				%> <%=useraname %> <%-- ************** --%> <b class="caret"></b></a>
						<ul class="dropdown-menu">

							<li><a href="ProviderProfile.jsp">ΠΡΟΒΟΛΗ ΠΡΟΦΙΛ</a></li>

							<li><a href="Provider.jsp">ΚΑΤΑΧΩΡΗΣΗ ΣΤΟΙΧΕΙΩΝ</a></li>

							<li><a href="logout.jsp">ΑΠΟΣΥΝΔΕΣΗ</a></li>

						</ul></li>


				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</body>