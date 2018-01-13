package bees.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DB { 															
																			
	private final String dbname = "bees";						
	private final String dbusername = "root";							
	private final String dbpassword = "12345678";								

	private Connection con = null;											

    /**
     * Default Constructor
     */
    public DB() {															

    }

    public Connection getConnection() { 									
        return this.con;
    }
// OPEN----------------------------------------------------------------------------------------------------------------------------
    public void open() throws SQLException {                                // dynamically load the driver's class file into memory
        try {																
          Class.forName("com.mysql.jdbc.Driver").newInstance();             //
        } catch (Exception e) {

            throw new SQLException("MySQL Driver error: " + e.getMessage());
        }

        try {
            // establish a connection with the database and creates a Connection
            // object (con)
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + dbname + "?characterEncoding=utf8",  dbusername, dbpassword);
        } catch (Exception e) {
            con = null;
            // throw SQLException if a database access error occurs
            throw new SQLException("Could not establish connection with the Database Server: " + e.getMessage());
        }

    } // End of open

    
    
//CLOSE----------------------------------------------------------------------------------------------------------------------------
    public void close() throws SQLException {
        try {
            // if connection is open
            if (con != null)
                con.close(); // close the connection to the database to end database session

        } catch (Exception e) {

            throw new SQLException("Could not close connection with the Database Server: " + e.getMessage());
        }
    }
}
