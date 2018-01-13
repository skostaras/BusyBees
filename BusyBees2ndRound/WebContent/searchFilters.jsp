<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    	<!-- *****************************************************************************************************************
	 Φίλτρα Αναζήτησης
	 ***************************************************************************************************************** -->

 <div class="col-lg-3">
        <img src="img/mainlogo.png" class="img-responsive">
        <br>

        <h4 style = "color:#ffb726">Νέα Αναζήτηση με Φίλτρα</h4>
        <div class="hline"></div>
          <p>Περιηγηθείτε στους καταχωρημένους επαγγελματίες εφαρμόζοντας τα παρακάτω φίλτρα.</p>
          
          <form action="searchByFilterResults" method="post">
          
           <div class="form-group">
          <label for="category">Επάγγελμα</label>
          <select class="form-control" id="category" name="category">
          	<option value="">Επιλογή...</option>
            <option value="Εκπαιδευτικός">Εκπαιδευτικός</option>
            <option value="Μάστορας">Μάστορας</option>
            <option value="Κομπιουτεράς">Κομπιουτεράς</option>
            <option value="Καλλιτέχνης">Καλλιτέχνης</option>
            <option value="Γιατρός">Γιατρός</option>
          </select>
            </div>
            
            
                    <script>
            document
                .getElementById('category')
                .addEventListener('change', function () {
                    'use strict';
                    var vis = document.querySelector('.vis'),   
                    	category = document.getElementById(this.value);
                    if (vis !== null) {
                        vis.className = 'inv';
                    }
                    if (category !== null ) {
                    	category.className = 'vis';
                    }
            });
        </script>
            
           
             
             <div id="Εκπαιδευτικός" class="inv">
              <div class="form-group">
                     <label for="subcategory">Κατηγορία Επαγγέλματος</label>
                     <select class="form-control" name="subcategory1">
                     	<option value = "%">Αδιάφορο</option>
                       <option value="Φιλόλογος">Φιλόλογος</option>
                       <option value = "Δάσκαλος">Δάσκαλος</option>
                       <option value = "Μαθηματικός">Μαθηματικός</option>
                       <option value = "Φυσικός">Φυσικός</option>
                     </select>
                       </div>
                        </div>
         

 					<div id="Μάστορας" class="inv">
              <div class="form-group">
                     <label for="subcategory">Κατηγορία Επαγγέλματος</label>
                     <select class="form-control" name="subcategory2">
                     <option value = "%">Αδιάφορο</option>
                       <option value = "Ηλεκτρολόγος">Ηλεκτρολόγος</option>
                       <option value = "Υδραυλικός">Υδραυλικός</option>
                       <option value = "Ελαιοχρωματιστής">Ελαιοχρωματιστής</option>
                       <option value = "Ξυλουργός">Ξυλουργός</option>
                     </select>
                       </div>
                        </div>
                        
                        
                       
                      	<div id="Κομπιουτεράς" class="inv">
              <div class="form-group">
                     <label for="subcategory">Κατηγορία Επαγγέλματος</label>
                     <select class="form-control" name="subcategory3">
                     <option value = "%">Αδιάφορο</option>
                       <option value = "Developer">Developer</option>
                       <option value = "Web Designer">Web Designer</option>
                       <option value = "Τεχνικός Δικτύων">Τεχνικός Δικτύων</option>
                       <option value = "Windows Expert">Windows Expert</option>
                     </select>
                       </div>
                        </div>
                        
                        
                         <div id="Καλλιτέχνης" class="inv">
              <div class="form-group">
                     <label for="subcategory">Κατηγορία Επαγγέλματος</label>
                     <select class="form-control" name="subcategory4">
                    <option value = "%">Αδιάφορο</option>
                       <option value = "Μουσικός">Μουσικός</option>
                       <option value = "Τραγουδιστής">Τραγουδιστής</option>
                       <option value = "Ηθοποιός">Ηθοποιός</option>
                       <option value = "Κλόουν">Κλόουν</option>
                     </select>
                       </div>
                        </div>
                        
                        
                        <div id="Γιατρός" class="inv">
              <div class="form-group">
                     <label for="subcategory">Κατηγορία Επαγγέλματος</label>
                     <select class="form-control" name="subcategory5">
                    <option value = "%">Αδιάφορο</option>
                       <option value = "Παθολόγος">Παθολόγος</option>
                       <option value = "Γυναικολόγος">Γυναικολόγος</option>
                       <option value = "Οδοντίατρος">Οδοντίατρος</option>
                       <option value = "Οφθαλμίατρος">Οφθαλμίατρος</option>
                     </select>
                       </div>
                        </div>



          

            <div class="form-group">
          <label for="city">Πόλη</label>
          <select class="form-control" id="city" name = "city" required>
      	    <option value = "%">Αδιάφορο</option>
            <option value = "Αθήνα">Αθήνα</option>
            <option value = "Θεσσαλονίκη">Θεσσαλονίκη</option>
            <option value = "Πάτρα">Πάτρα</option>
            <option value = "Λάρισα">Λάρισα</option>
            <option value = "Χανιά">Χανιά</option>
            <option value = "Ιωάννινα">Ιωάννινα</option>
          </select>
            </div>


            <div class="form-group">
          <label for="servicekind">Κατηγορία Τιμής</label>
          <select class="form-control" id="servicekind" name = "type" required>
          	<option value = "%">Αδιάφορο</option>
            <option value = "Εφάπαξ">Εφάπαξ</option>
            <option value = "Την ώρα">Την ώρα</option>
            <option value = "Τον μήνα">Τον μήνα</option>
            <option value = "Άλλο">Άλλο</option>
          </select>
            </div>


            <div class="form-group">
  
        
              <label for="minMoney">Κατώτερη Τιμή</label>
              <input type="number" class="form-control" id="minMoney" name = "minMoney" placeholder="Από" min="0" value = "0">
              <br>
              <label for="maxMoney">Μέγιστη Τιμή</label>
              <input type="number" class="form-control" id="maxMoney" name = "maxMoney" placeholder="Έως" max = "1000000" value = "1000000">
            </div>
            
           <!--  <div class="form-group">
          <label for="averageRating">Μέση Βαθμολογία</label>
          <select class="form-control" id="averageRating" name = "averageRating">
            <option value="min1">Μεγαλύτερη από 1 αστέρι</option>
            <option value="min2">Μεγαλύτερη από 2 αστέρια</option>
            <option value="min3">Μεγαλύτερη από 3 αστέρια</option>
            <option value="min4">Μεγαλύτερη από 4 αστέρια</option>
          </select>
            </div> -->

              <br>

			                  
			<label><i>Να έχει απαραίτητα</i></label>
              <table title="ON: Να έχει απαραίτητα OFF: Αδιάφορο">
                <tr>
                  <td>
                        <label class="switch" >
                        <input type="checkbox" name = "phone" value = "1">
                          
                            <div class="slider round"></div>
                        </label>
                        </td>
                        <td>
                          <label> &nbsp&nbsp&nbsp Τηλέφωνο</label>
                  </td>
                  </tr>
                  <!--  <tr>
                    <td>
                      <label class="switch">
                        <input type="checkbox" id="emailSlider" name = "email" value = "1">
                        <div class="slider round"></div>
                      </label>
                    </td>
                    <td>
                      <label> &nbsp&nbsp&nbsp e-mail</label>
                    </td>
                  </tr>-->
                    <tr>
                      <td>
                        <label class="switch">
                          <input type="checkbox" id = "pageSlider" name = "webpage" value = "1">
                          <div class="slider round"></div>
                        </label>
                      </td>
                      <td>
                          <label> &nbsp&nbsp&nbsp Ιστοσελίδα</label>
                        </td>

              </tr>   

              </table>

          <br>


          <div class = "row centered">
            <button type="submit" class="btn btn-theme">Εφαρμογή</button>

            <button type="reset" class="btn btn-theme">Reset</button>
          </div>
          </form>

  </div>