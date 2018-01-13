package beesDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bees.connection.DB;
import beesJava.Provider;
import beesJava.Provider_job;

public class Provider_jobDAO {

	// FIND PROVIDER ID---------------------

	public Provider getProviderId() throws Exception {
		Connection con = null;
		String sqlquery = "SELECT idprovider FROM provider WHERE username = ?;";
		DB db = new DB();

		Provider provider = new Provider();
		String username = provider.getProvidername();

		try {

			db.open();
			con = db.getConnection();

			PreparedStatement stmt0 = con.prepareStatement(sqlquery);

			stmt0.setString(1, username);

			ResultSet rs = stmt0.executeQuery();


			if(rs.next()){

				provider.setIdprovider(rs.getInt("idprovider"));

			} 

			rs.close();
			stmt0.close();

			return provider;

		} catch (Exception e) {

			throw new Exception("An error occured while getting info from database: " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}


	}

	public Provider_job getProviderInfo(int idprovider) throws Exception {

		Connection con = null;
		String sqlquery = "SELECT * FROM provider_job WHERE idprovider = ?;";
		DB db = new DB();
		try {

			db.open();
			con = db.getConnection();

			PreparedStatement stmt = con.prepareStatement(sqlquery);
			stmt.setInt( 1, idprovider );

			ResultSet rs = stmt.executeQuery();

			Provider_job provInfoObj = new Provider_job();

			while(rs.next()){
				provInfoObj.setCategory(rs.getString("category"));

				provInfoObj.setWorkemail(rs.getString("workemail"));

				provInfoObj.setFirstName(rs.getString("firstName"));

				provInfoObj.setLastName(rs.getString("lastName"));

				provInfoObj.setPhone(rs.getString("phone"));

				provInfoObj.setWebpage(rs.getString("webpage"));

				provInfoObj.setAddress(rs.getString("street"));

				provInfoObj.setPc(rs.getString("pc"));

				provInfoObj.setCity(rs.getString("city"));

				provInfoObj.setDescription(rs.getString("description"));

				provInfoObj.setPrice(rs.getString("price"));

				provInfoObj.setType(rs.getString("type"));

				provInfoObj.setSubcategory(rs.getString("subcategory"));

				provInfoObj.setService(rs.getString("service"));

				break;//gia na gyrisei mono to prwto
			} 

			rs.close();
			stmt.close();

			return provInfoObj;

		} catch (Exception e) {

			throw new Exception("An error occured while getting info from database: " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	}

	// SAVE-TO DATA
	// BASE--------------------------------------------------------------------------------------------------------------------------

	public void saveProvider_job(Provider_job provider_job, int providerid ) throws Exception {// dimioyrgoyme

		Connection con = null;
		DB dB = new DB(); // ginete i sindesi

		PreparedStatement stmtp7 = null;// tha parei san orisma to query poy tha ektelestei

		String sqlquery = "INSERT INTO provider_job (idprovider, workemail, firstName, lastName, phone, webpage, street, pc, city, description, price, `type`, category, subcategory, service) VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);"; // kataxorei

		try {

			dB.open();
			con = dB.getConnection(); 



			stmtp7 = con.prepareStatement(sqlquery); 

			stmtp7.setInt(1, providerid);
			stmtp7.setString(2, provider_job.getWorkemail()); 
			stmtp7.setString(3, provider_job.getFirstName()); 
			stmtp7.setString(4, provider_job.getLastName()); 
			stmtp7.setString(5, provider_job.getPhone()); 
			stmtp7.setString(6, provider_job.getWebpage()); 
			stmtp7.setString(7, provider_job.getAddress()); 
			stmtp7.setString(8, provider_job.getPc()); 
			stmtp7.setString(9, provider_job.getCity()); 
			stmtp7.setString(10, provider_job.getDescription());
			stmtp7.setString(11, provider_job.getPrice());
			stmtp7.setString(12, provider_job.getType());
			stmtp7.setString(13, provider_job.getCategory());
			stmtp7.setString(14, provider_job.getSubcategory());
			stmtp7.setString(15, provider_job.getService());

			stmtp7.executeUpdate(); // ektelei thn entolh kai enhmeronei thn vash
			stmtp7.close(); // kleinei to preparestatement
			dB.close();// kleienei thn vasi

		} catch (Exception e) {

			throw new Exception("An error occured while saving provider Job to database: " + e.getMessage());

		} finally {

			try {
				dB.close(); 
			} catch (Exception e) {}
		}
	}
	
	
	
	public void deleteProviderInfo(int providerId) throws Exception {
	
	Connection con = null;
	String sqlquery = "DELETE FROM provider_job WHERE idprovider = ?;";
	DB db = new DB();

	try {

		db.open();
		con = db.getConnection();

		PreparedStatement stmt = con.prepareStatement(sqlquery);
		stmt.setInt( 1, providerId);
		stmt.executeUpdate();
		stmt.close();

	} catch (Exception e) {

		try {
			throw new Exception("An error occured while deleting info from database: " + e.getMessage());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

	} finally {

		try {
			db.close();
		} catch (Exception e) {

		}

	}
	}
	
	public ArrayList<Provider_job> findProviderDetails(String searchTerm) throws Exception {
		
		Connection con = null;
		DB db = new DB();
		
		String sqlquery = "SELECT * FROM provider_job WHERE firstName LIKE ? OR lastName LIKE ? OR street LIKE ? OR pc LIKE ? OR city LIKE ? OR description LIKE ? OR category LIKE ? OR subcategory LIKE ? OR service LIKE ? OR price LIKE ? OR type LIKE ? OR phone LIKE ? OR workemail LIKE ? OR webpage LIKE ?;";
		
		ArrayList<Provider_job> results = new ArrayList<Provider_job>();
		
		try {

			db.open(); // open connection
			con = db.getConnection(); // get Connection Object

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);

			stmt1.setString(1, "%" + searchTerm + "%");
			stmt1.setString(2, "%" + searchTerm + "%");
			stmt1.setString(3, "%" + searchTerm + "%");
			stmt1.setString(4, "%" + searchTerm + "%");
			stmt1.setString(5, "%" + searchTerm + "%");
			stmt1.setString(6, "%" + searchTerm + "%");
			stmt1.setString(7, "%" + searchTerm + "%");
			stmt1.setString(8, "%" + searchTerm + "%");
			stmt1.setString(9, "%" + searchTerm + "%");
			stmt1.setString(10, "%" + searchTerm + "%");
			stmt1.setString(11, "%" + searchTerm + "%");
			stmt1.setString(12, "%" + searchTerm + "%");
			stmt1.setString(13, "%" + searchTerm + "%");
			stmt1.setString(14, "%" + searchTerm + "%");

			ResultSet rs = stmt1.executeQuery();

			while (rs.next()) {
				
				results.add(new Provider_job(rs.getString("workemail"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("phone"), rs.getString("webpage"), rs.getString("street"), rs.getString("pc"), rs.getString("city"), rs.getString("description"), rs.getString("price"), rs.getString("type"), rs.getString("category"), rs.getString("subcategory"), rs.getString("service")));
				
			} 

			rs.close();
			stmt1.close();
			db.close();

			return results;

		} catch (Exception e) {

			throw new Exception("An error occured while getting provider info from database: " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	}//method
	
	
	public ArrayList<Provider_job> findByCategory(String givenCategory) throws Exception {
		
		Connection con = null;
		DB db = new DB();
		
		String sqlquery = "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND price LIKE ? AND type LIKE ? AND phone LIKE ? AND workemail LIKE ? AND webpage LIKE ?;";
		
		ArrayList<Provider_job> results = new ArrayList<Provider_job>();
		
		try {

			db.open(); // open connection
			con = db.getConnection(); // get Connection Object

			PreparedStatement stmt1 = con.prepareStatement(sqlquery);
			
			stmt1.setString(1, "%");
			stmt1.setString(2, "%");
			stmt1.setString(3, "%");
			stmt1.setString(4, "%");
			stmt1.setString(5, "%");
			stmt1.setString(6, "%");
			stmt1.setString(7, givenCategory);
			stmt1.setString(8, "%");
			stmt1.setString(9, "%");
			stmt1.setString(10, "%");
			stmt1.setString(11, "%");
			stmt1.setString(12, "%");
			stmt1.setString(13, "%");
			stmt1.setString(14, "%");
			
			ResultSet rs = stmt1.executeQuery();

			while (rs.next()) {
				
				results.add(new Provider_job(rs.getString("workemail"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("phone"), rs.getString("webpage"), rs.getString("street"), rs.getString("pc"), rs.getString("city"), rs.getString("description"), rs.getString("price"), rs.getString("type"), rs.getString("category"), rs.getString("subcategory"), rs.getString("service")));
				
			} 

			rs.close();
			stmt1.close();
			db.close();

			return results;

		} catch (Exception e) {

			throw new Exception("An error occured while getting provider info from database: " + e.getMessage());

		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}

	}//method
	
	public ArrayList<Provider_job> findByFilter(String givenCategory, String givenSubcategory, String givenCity, String givenType, String givenPhone, String givenwebpage, int givenMinMoney, int givenMaxMoney) throws Exception {
			
			Connection con = null;
			DB db = new DB();
			
			String sqlquery = null;

			//4 diaforetikes periptoseis gia ta 2 koumpia on/off
			
			if(givenPhone == "%" && givenwebpage == "%") {

				
				sqlquery = "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone LIKE ? AND workemail LIKE ? AND webpage LIKE ?;";
				
			}	
				
			if (givenPhone != "%" && givenwebpage == "%"){
					
				sqlquery = "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone !='' AND phone !=' ' AND workemail LIKE ? AND webpage LIKE ?;";
					
				}
			
			if (givenPhone == "%" && givenwebpage != "%"){
				
				sqlquery = "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone LIKE ? AND workemail LIKE ? AND webpage !='' AND webpage !=' ' AND webpage IS NOT NULL ;";
					
				}
			
			if (givenPhone != "%" && givenwebpage != "%"){
				
				sqlquery = "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone !='' AND phone !=' ' AND workemail LIKE ? AND webpage !='' AND webpage !=' ' AND webpage IS NOT NULL ;";
					
				}
				
	
			
			ArrayList<Provider_job> results = new ArrayList<Provider_job>();
			
			try {
	
				db.open(); // open connection
				con = db.getConnection(); // get Connection Object
	
				PreparedStatement stmt1 = con.prepareStatement(sqlquery);
				
				if(givenPhone == "%" && givenwebpage == "%") {
					
					stmt1.setString(1, "%");
					stmt1.setString(2, "%");
					stmt1.setString(3, "%");
					stmt1.setString(4, "%");
					stmt1.setString(5, givenCity);
					stmt1.setString(6, "%");
					stmt1.setString(7, givenCategory);
					stmt1.setString(8, givenSubcategory);
					stmt1.setString(9, "%");
					stmt1.setInt(10, givenMinMoney);
					stmt1.setInt(11, givenMaxMoney);
					stmt1.setString(12, givenType);
					stmt1.setString(13, givenPhone);
					stmt1.setString(14, "%");
					stmt1.setString(15, givenwebpage);					
					
				} 
				
				if (givenPhone != "%" && givenwebpage == "%"){			
				
					stmt1.setString(1, "%");
					stmt1.setString(2, "%");
					stmt1.setString(3, "%");
					stmt1.setString(4, "%");
					stmt1.setString(5, givenCity);
					stmt1.setString(6, "%");
					stmt1.setString(7, givenCategory);
					stmt1.setString(8, givenSubcategory);
					stmt1.setString(9, "%");
					stmt1.setInt(10, givenMinMoney);
					stmt1.setInt(11, givenMaxMoney);
					stmt1.setString(12, givenType);
					stmt1.setString(13, "%");
					stmt1.setString(14, givenwebpage);			
				
				}
				
				if (givenPhone == "%" && givenwebpage != "%") {
					
					stmt1.setString(1, "%");
					stmt1.setString(2, "%");
					stmt1.setString(3, "%");
					stmt1.setString(4, "%");
					stmt1.setString(5, givenCity);
					stmt1.setString(6, "%");
					stmt1.setString(7, givenCategory);
					stmt1.setString(8, givenSubcategory);
					stmt1.setString(9, "%");
					stmt1.setInt(10, givenMinMoney);
					stmt1.setInt(11, givenMaxMoney);
					stmt1.setString(12, givenType);
					stmt1.setString(13, givenPhone);
					stmt1.setString(14, "%");		
					
				}
				
	
				if (givenPhone != "%" && givenwebpage != "%"){
					
					stmt1.setString(1, "%");
					stmt1.setString(2, "%");
					stmt1.setString(3, "%");
					stmt1.setString(4, "%");
					stmt1.setString(5, givenCity);
					stmt1.setString(6, "%");
					stmt1.setString(7, givenCategory);
					stmt1.setString(8, givenSubcategory);
					stmt1.setString(9, "%");
					stmt1.setInt(10, givenMinMoney);
					stmt1.setInt(11, givenMaxMoney);
					stmt1.setString(12, givenType);
					stmt1.setString(13, "%");				
					
				}
				
				
				
				ResultSet rs = stmt1.executeQuery();
	
				while (rs.next()) {
					
					results.add(new Provider_job(rs.getString("workemail"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("phone"), rs.getString("webpage"), rs.getString("street"), rs.getString("pc"), rs.getString("city"), rs.getString("description"), rs.getString("price"), rs.getString("type"), rs.getString("category"), rs.getString("subcategory"), rs.getString("service")));
					
				} 
	
				rs.close();
				stmt1.close();
				db.close();
	
				return results;
	
			} catch (Exception e) {
	
				throw new Exception("An error occured while getting provider info from database: " + e.getMessage());
	
			} finally {
	
				try {
					db.close();
				} catch (Exception e) {
	
				}
	
			}
	
		}//method
	
	
	
}//class
