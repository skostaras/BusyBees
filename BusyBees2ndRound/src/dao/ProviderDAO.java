package dao;

import java.sql.*;
import controllers.Login;
import db.DbConnection;
import model.Provider;

public class ProviderDAO {

  public ProviderDAO() {}

  public int checkProviderSignUp(String email) throws Exception {
    int provideremailflag = 0;
    Connection con = null;
    DbConnection db = new DbConnection();
    String sqlquery = "SELECT * FROM provider WHERE email=?;";

    try {
      db.open();
      con = db.getConnection();
      PreparedStatement stmtp = con.prepareStatement(sqlquery);
      stmtp.setString(1, email);
      ResultSet rs = stmtp.executeQuery();

      if (rs.next())
        provideremailflag = 1;

      db.close();
      stmtp.close();
      con.close();
      return provideremailflag;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return provideremailflag;
  }

  public Provider getProvider(String password, String email) throws Exception {

    Connection con = null;
    DbConnection db = new DbConnection();
    String sqlquery = "SELECT * FROM provider WHERE password=? AND email=?;";

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

      Provider provider = new Provider(rs.getString("username"), rs.getString("password"),
          rs.getString("email"), rs.getInt("idprovider"));

      Login.loginValue = 1;

      rs.close();
      stmt5.close();

      return provider;

    } catch (Exception e) {

      throw new Exception(e.getMessage());

    } finally {

      try {
        db.close();
      } catch (Exception e) {
        e.printStackTrace();
      }

    }

  }
  
  public void saveProvider(Provider provider) throws Exception {

    Connection con = null;
    DbConnection dB = new DbConnection();
    PreparedStatement stmtp2 = null;

    String sqlquery = "INSERT INTO provider (username,password,email) VALUES (?,?,?);";

    try {
      dB.open();
      con = dB.getConnection();

      stmtp2 = con.prepareStatement(sqlquery);
      stmtp2.setString(1, provider.getProvidername());
      stmtp2.setString(2, provider.getProviderPassword());
      stmtp2.setString(3, provider.getProviderEmail());
      stmtp2.executeUpdate();
      stmtp2.close();
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

  

}
