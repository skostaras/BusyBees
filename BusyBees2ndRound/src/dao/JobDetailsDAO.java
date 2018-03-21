package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import db.DbConnection;
import model.Provider;
import model.JobDetails;

public class JobDetailsDAO {

  public Provider getProviderId() throws Exception {
    DbConnection db = new DbConnection();
    Connection con = null;
    Provider provider = new Provider();
    String username = provider.getProvidername();
    String sqlquery = "SELECT idprovider FROM provider WHERE username = ?;";

    try {
      db.open();
      con = db.getConnection();
      PreparedStatement stmt0 = con.prepareStatement(sqlquery);
      stmt0.setString(1, username);
      ResultSet rs = stmt0.executeQuery();

      if (rs.next())
        provider.setIdprovider(rs.getInt("idprovider"));

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

  public void setProviderJobDetails(JobDetails jobDetails, int providerid)
      throws Exception {

    Connection con = null;
    DbConnection dB = new DbConnection();
    PreparedStatement stmtp7 = null;
    String sqlquery =
        "INSERT INTO provider_job (idprovider, workemail, firstName, lastName, phone, webpage, street, pc, city, description, price, `type`, category, subcategory, service) VALUES ( ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";

    try {

      dB.open();
      con = dB.getConnection();
      stmtp7 = con.prepareStatement(sqlquery);

      stmtp7.setInt(1, providerid);
      stmtp7.setString(2, jobDetails.getWorkemail());
      stmtp7.setString(3, jobDetails.getFirstName());
      stmtp7.setString(4, jobDetails.getLastName());
      stmtp7.setString(5, jobDetails.getPhone());
      stmtp7.setString(6, jobDetails.getWebpage());
      stmtp7.setString(7, jobDetails.getAddress());
      stmtp7.setString(8, jobDetails.getPc());
      stmtp7.setString(9, jobDetails.getCity());
      stmtp7.setString(10, jobDetails.getDescription());
      stmtp7.setString(11, jobDetails.getPrice());
      stmtp7.setString(12, jobDetails.getType());
      stmtp7.setString(13, jobDetails.getCategory());
      stmtp7.setString(14, jobDetails.getSubcategory());
      stmtp7.setString(15, jobDetails.getService());

      stmtp7.executeUpdate();
      stmtp7.close();
      dB.close();

    } catch (Exception e) {

      throw new Exception(
          "An error occured while saving provider Job to database: " + e.getMessage());

    } finally {

      try {
        dB.close();
      } catch (Exception e) {
      }
    }
  }

  public JobDetails getProviderJobDetails(int idprovider) throws Exception {

    Connection con = null;
    DbConnection db = new DbConnection();
    String sqlquery = "SELECT * FROM provider_job WHERE idprovider = ?;";

    try {
      db.open();
      con = db.getConnection();
      PreparedStatement stmt = con.prepareStatement(sqlquery);
      stmt.setInt(1, idprovider);

      JobDetails provInfoObj = new JobDetails();
      ResultSet rs = stmt.executeQuery();

      while (rs.next()) {
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

        break;// gia na gyrisei mono to prwto
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

  public void deleteProviderJobDetails(int providerId) throws Exception {

    Connection con = null;
    String sqlquery = "DELETE FROM provider_job WHERE idprovider = ?;";
    DbConnection db = new DbConnection();

    try {

      db.open();
      con = db.getConnection();

      PreparedStatement stmt = con.prepareStatement(sqlquery);
      stmt.setInt(1, providerId);
      stmt.executeUpdate();
      stmt.close();

    } catch (Exception e) {

      try {
        throw new Exception(
            "An error occured while deleting info from database: " + e.getMessage());
      } catch (Exception e1) {
        e1.printStackTrace();
      }

    } finally {

      try {
        db.close();
      } catch (Exception e) {

      }

    }
  }
 
}
