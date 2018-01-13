  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  
 
					

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
          <a class="navbar-brand" href="index.jsp">Busy Bees</a>

        </div>
        <div class="navbar-collapse collapse navbar-right">
          <ul class="nav navbar-nav">
            <li class="active"><a href="index.jsp">ΑΡΧΙΚΗ</a></li>
            <li><a href="index.jsp#faq">FAQ</a></li>
            <li><a href="index.jsp#footerwrap">ΕΠΙΚΟΙΝΩΝΙΑ</a></li>

            <li>  <a href = "" data-toggle="modal" data-target=".bs-modal-sm"><span class="glyphicon glyphicon-user" aria-hidden="true"> LOGIN</a></span></li>

          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
    
  <!-- Modal -->
<div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        
        
        <div style = "background-color: #ffb726" class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
              <li class=""><a href="#signup" data-toggle="tab">Register</a></li>
            </ul>
        </div>
      <div class="modal-body">
        <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade active in" id="Login">
            <form class="form-horizontal" action="beesLogIn" method="post">
            <fieldset>
            
            
            
            <!-- Sign In Form -->          
            
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="email">E-mail:</label>
              <div class="controls">
                <input type="email" id="email" name="email" class="form-control" placeholder="youremail@email.com" class="input-medium" required>
              </div>
            </div>

            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="password">Password:</label>
              <div class="controls">
                <input required id="password" name="password" class="form-control" type="password" placeholder="********" class="input-medium">
              </div>
            </div>
            
           <br> 
           
          
           

            <!-- Υποβολή -->
             <center>
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button type="submit" id="signin" name="signin" class="btn btn-theme">Υποβολή</button>            
             
        <button type="button" class="btn btn-logout" data-dismiss="modal">Ακύρωση</button>
         </div>
              
            </div>
             </center>
                       
             
             
            </fieldset>
            </form>
                   
           
        </div>
        
        
        
        
        <!------ SIGNUP  -->
        
        
        
        
        <div class="tab-pane fade" id="signup">
            <form class="form-horizontal" action="beesSignUp" method="post">
            <fieldset>
            <!-- Sign Up Form -->
            
            
             <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="username">Username:</label>
              <div class="controls">
                <input id="username" name="username" class="form-control" type="text" placeholder="πχ stefanos27" class="input-large" required="">
              </div>
              
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="email">E-mail:</label>
              <div class="controls">
                <input id="email" name="email" class="form-control" type="email" placeholder="youremail@email.com" class="input-large" required="">
              </div>
            </div>
            
           
            </div>
            
            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="password">Password:</label>
              <div class="controls">
                <input id="password" name="password" class="form-control" type="password" placeholder="********" class="input-large" required="">
                <em>Τουλάχιστον έξι χαρακτήρες</em>
              </div>
            </div>
            
           
            
            <!-- userCategory -->
            <br>
            <div class="radio">
            <label>
                  <input type="radio" value="1" name="userCategory" id="userCategory"  required>
                  Είμαι <strong>Eπισκέπτης</strong> του Busy Bees
                </label>
                </div>
                
                <div class="radio">
                 <label>
                  <input type="radio" value="2" name="userCategory" id="userCategory">
					Είμαι <strong>Επαγγελματίας</strong> που θέλω να προσφέρω τις υπηρεσίες μου στο Busy Bees
                </label>
                </div>
                <br>
            
            <!-- Button -->
          <center>
            <div class="control-group">
              <label class="control-label" for="signup"></label>
              <div class="controls">
                <button type="submit" id="signup" name="signup" class="btn btn-theme">Υποβολή</button>
            
              
             
        <button type="button" class="btn btn-logout" data-dismiss="modal">Ακύρωση</button>
         </div>
              
            </div>
             </center>
            
            </fieldset>
            </form>
      </div>
    </div>
      </div>

    </div>
  </div>
</div>  
 
 
 
