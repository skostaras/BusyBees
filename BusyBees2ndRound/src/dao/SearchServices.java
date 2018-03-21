package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import db.DbConnection;
import model.JobDetails;

public class SearchServices {

  public ArrayList<JobDetails> findBySearchTerm(String searchTerm) throws Exception {

    Connection con = null;
    DbConnection db = new DbConnection();
    ArrayList<JobDetails> results = new ArrayList<JobDetails>();

    String sqlquery =
        "SELECT * FROM provider_job WHERE firstName LIKE ? OR lastName LIKE ? OR street LIKE ? OR pc LIKE ? OR city LIKE ? OR description LIKE ? OR category LIKE ? OR subcategory LIKE ? OR service LIKE ? OR price LIKE ? OR type LIKE ? OR phone LIKE ? OR workemail LIKE ? OR webpage LIKE ?;";

    try {

      db.open();
      con = db.getConnection();

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
        results.add(new JobDetails(rs.getString("workemail"), rs.getString("firstName"),
            rs.getString("lastName"), rs.getString("phone"), rs.getString("webpage"),
            rs.getString("street"), rs.getString("pc"), rs.getString("city"),
            rs.getString("description"), rs.getString("price"), rs.getString("type"),
            rs.getString("category"), rs.getString("subcategory"), rs.getString("service")));
      }

      rs.close();
      stmt1.close();
      db.close();

      return results;

    } catch (Exception e) {

      throw new Exception(
          "An error occured while getting provider info from database: " + e.getMessage());

    } finally {

      try {
        db.close();
      } catch (Exception e) {

      }

    }

  }

  public ArrayList<JobDetails> findByCategory(String givenCategory) throws Exception {

    Connection con = null;
    DbConnection db = new DbConnection();    
    ArrayList<JobDetails> results = new ArrayList<JobDetails>();

    String sqlquery =
        "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND price LIKE ? AND type LIKE ? AND phone LIKE ? AND workemail LIKE ? AND webpage LIKE ?;";

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
        results.add(new JobDetails(rs.getString("workemail"), rs.getString("firstName"),
            rs.getString("lastName"), rs.getString("phone"), rs.getString("webpage"),
            rs.getString("street"), rs.getString("pc"), rs.getString("city"),
            rs.getString("description"), rs.getString("price"), rs.getString("type"),
            rs.getString("category"), rs.getString("subcategory"), rs.getString("service")));
      }

      rs.close();
      stmt1.close();
      db.close();

      return results;

    } catch (Exception e) {

      throw new Exception(
          "An error occured while getting provider info from database: " + e.getMessage());

    } finally {

      try {
        db.close();
      } catch (Exception e) {

      }

    }

  }

  public ArrayList<JobDetails> findByFilter(String givenCategory, String givenSubcategory,
      String givenCity, String givenType, String givenPhone, String givenwebpage, int givenMinMoney,
      int givenMaxMoney) throws Exception {
    
    //Attention!! Really bad code below! (I was young and innocent, good times)

    Connection con = null;
    DbConnection db = new DbConnection();
    String sqlquery = null;

    // 4 diaforetikes periptoseis gia ta 2 koumpia on/off

    if (givenPhone == "%" && givenwebpage == "%") {
      sqlquery =
          "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone LIKE ? AND workemail LIKE ? AND webpage LIKE ?;";
    }

    if (givenPhone != "%" && givenwebpage == "%") {
      sqlquery =
          "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone !='' AND phone !=' ' AND workemail LIKE ? AND webpage LIKE ?;";
    }

    if (givenPhone == "%" && givenwebpage != "%") {
      sqlquery =
          "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone LIKE ? AND workemail LIKE ? AND webpage !='' AND webpage !=' ' AND webpage IS NOT NULL ;";
    }

    if (givenPhone != "%" && givenwebpage != "%") {
      sqlquery =
          "SELECT * FROM provider_job WHERE firstName LIKE ? AND lastName LIKE ? AND street LIKE ? AND pc LIKE ? AND city LIKE ? AND description LIKE ? AND category = ? AND subcategory LIKE ? AND service LIKE ? AND (price BETWEEN ? AND ?) AND type LIKE ? AND phone !='' AND phone !=' ' AND workemail LIKE ? AND webpage !='' AND webpage !=' ' AND webpage IS NOT NULL ;";
    }

    ArrayList<JobDetails> results = new ArrayList<JobDetails>();

    try {
      db.open();
      con = db.getConnection();

      PreparedStatement stmt1 = con.prepareStatement(sqlquery);

      if (givenPhone == "%" && givenwebpage == "%") {
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

      if (givenPhone != "%" && givenwebpage == "%") {
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

      if (givenPhone != "%" && givenwebpage != "%") {
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
        results.add(new JobDetails(rs.getString("workemail"), rs.getString("firstName"),
            rs.getString("lastName"), rs.getString("phone"), rs.getString("webpage"),
            rs.getString("street"), rs.getString("pc"), rs.getString("city"),
            rs.getString("description"), rs.getString("price"), rs.getString("type"),
            rs.getString("category"), rs.getString("subcategory"), rs.getString("service")));
      }

      rs.close();
      stmt1.close();
      db.close();

      return results;

    } catch (Exception e) {

      throw new Exception(
          "An error occured while getting provider info from database: " + e.getMessage());

    } finally {

      try {
        db.close();
      } catch (Exception e) {

      }

    }

  }
}
