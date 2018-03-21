package dao;

import java.sql.*;
import controllers.Login;
import db.DbConnection;
import model.Customer;

public class CustomerDAO {

  public CustomerDAO() {}

  public int checkCustomerSignUp(String email) throws Exception {

    int customeremailflag = 0;
    Connection con = null;
    DbConnection db = new DbConnection();
    String sqlquery1 = "SELECT * FROM customer WHERE email=?;";

    try {
      db.open();
      con = db.getConnection();
      PreparedStatement stmt = con.prepareStatement(sqlquery1);
      stmt.setString(1, email);
      ResultSet rs = stmt.executeQuery();

      if (rs.next())
        customeremailflag = 1;

      db.close();
      stmt.close();
      con.close();
      return customeremailflag;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return customeremailflag;
  }

  public Customer getCustomer(String password, String email) throws Exception {

    Connection con = null;
    String sqlquery = "SELECT * FROM customer WHERE password=? AND email=?;";
    DbConnection db = new DbConnection();

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

      Customer customer =
          new Customer(rs.getString("username"), rs.getString("password"), rs.getString("email"));

      Login.loginValue = 2;
      rs.close();
      stmt5.close();

      return customer;

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

  public void saveCustomer(Customer customer) throws Exception {

    Connection con = null;
    DbConnection dB = new DbConnection();
    PreparedStatement stmt2 = null;
    String sqlquery = "INSERT INTO customer (username,password,email) VALUES (?,?,?);";

    try {
      dB.open();
      con = dB.getConnection();

      stmt2 = con.prepareStatement(sqlquery);
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
        e.printStackTrace();
      }
    }
  }


}
