package demo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mongodb.DB;
import com.mongodb.MongoClient;

/**
 * @author Manpreet Singh
 * This class will be used to create all the connections
 *
 */
public class HandleConnection {

	/**
	 * @return statement object
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public Statement createMySQLConnection() throws SQLException, ClassNotFoundException {
		Connection connection = null;
		Statement st = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(Constants.connectionURL, Constants.username, Constants.password);
		st = connection.createStatement();
		return st;
	}

	/**
	 * @return mongo db connection
	 */
	public DB createMongoDBConnection() {
		MongoClient mongo = new MongoClient(Constants.mongoClient, Constants.mongoPort);
		DB database = mongo.getDB("CASESTUDYB00821998");
		return database;
	}

}
