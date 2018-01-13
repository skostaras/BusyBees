package beesDAO;

import java.sql.*;
import bees.connection.DB;
import beesControllers.beesLogIn;
import beesJava.Customer;

//-----------------------------------------------------------------------

public class CustomerDAO {

	
	public CustomerDAO() {
		// TODO Auto-generated constructor stub
	}


	public int checkCustomerSignUp(String email) throws Exception {
		int customeremailflag = 0;
		
		Connection con = null;
		DB db = new DB(); // arxikopoio ena antikimeno vasis
		String sqlquery1 = "SELECT * FROM customer WHERE email=?;";

		try {
			db.open();
			con = db.getConnection();
			PreparedStatement stmt = con.prepareStatement(sqlquery1);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				customeremailflag = 1;
			}
			db.close();
			stmt.close();
			con.close();
			return customeremailflag;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return customeremailflag;
		
		
	}

	// SAVE-----------------------------------------------------------------------------------------------------------------------------------------

	public void saveCustomer(Customer customer) throws Exception {
									

		Connection con = null;
		DB dB = new DB(); 

		PreparedStatement stmt2 = null;

		String sqlquery = "INSERT INTO customer (username,password,email) VALUES (?,?,?);"; 

		try {
			dB.open();
			con = dB.getConnection(); // ftiaxnei thn syndesh

			stmt2 = con.prepareStatement(sqlquery); // etoimazi to queri na to
													// steilei sthn vasi
			stmt2.setString(1, customer.getCustomername()); 
		
			stmt2.setString(2, customer.getCustomerPassword()); 
			
			stmt2.setString(3, customer.getCustomerEmail()); 
			
			stmt2.executeUpdate(); 
			stmt2.close(); 
			dB.close();

		} catch (Exception e) {

			throw new Exception("An error occured while saving customer to database: " + e.getMessage());

		} finally {

			try {
				dB.close(); 
			} catch (Exception e) {

			}
		}
	}


	// LOGIN CUSTOMER
	// AUTHENDICATION-----------------------------------------------------------------------
	public Customer checkCustomerLogIn(String password, String email) throws Exception {


		Connection con = null;

		String sqlquery = "SELECT * FROM customer WHERE password=? AND email=?;";

		DB db = new DB();

		try {

			db.open();

			con = db.getConnection();

			PreparedStatement stmt5 = con.prepareStatement(sqlquery);
			stmt5.setString(1, password);
			stmt5.setString(2, email);

			ResultSet rs = stmt5.executeQuery();

			if (!rs.next()) {
				rs.close();
				stmt5.close();
				db.close();
				throw new Exception("Wrong username or password");
			}

			
			Customer customer = new Customer(rs.getString("username"), rs.getString("password"), rs.getString("email"));			

			beesLogIn.loginValue = 2;

			rs.close();
			stmt5.close();

			return customer;

		} catch (Exception e) {

			throw new Exception(e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

} // End of authenticateUser
	// End of class