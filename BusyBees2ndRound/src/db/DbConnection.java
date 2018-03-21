package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

  private final String dbname = "bees";
  private final String dbusername = "root";
  private final String dbpassword = "12345678";
  private Connection connection = null;

  public Connection getConnection() {
    return this.connection;
  }

  public void open() throws SQLException {

    try {
      Class.forName("com.mysql.jdbc.Driver").newInstance();
    } catch (Exception e) {
      throw new SQLException("MySQL Driver error: " + e.getMessage());
    }

    try {
      connection = DriverManager.getConnection(
          "jdbc:mysql://localhost:3306/" + dbname + "?characterEncoding=utf8", dbusername,
          dbpassword);
    } catch (Exception e) {
      connection = null;
      throw new SQLException(
          "Could not establish connection with the Database Server: " + e.getMessage());
    }

  }

  public void close() throws SQLException {
    try {
      if (connection != null)
        connection.close();
    } catch (Exception e) {
      throw new SQLException(
          "Could not close connection with the Database Server: " + e.getMessage());
    }
  }
}
