package kr.co.grcons.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Logger;

public class DBconn {
	Logger logger = Logger.getLogger(DBconn.class.getSimpleName());
	
	private String userName 	= "dev-01";
	private String password 	= "Jca142536!@";
	private String dbms 		= "mysql";
	private String dbName 		= "grcons";
	// private String serverName 	= "grcons.co.kr";
	//private String serverName 	= "localhost";
	private String serverName	= "aa16n2xkpj5nl66.cbqm3rfz7crw.ap-northeast-2.rds.amazonaws.com";
	private int portNumber 		= 3306;
	
	public Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	    Connection conn = null;
	    Properties connectionProps = new Properties();
	    connectionProps.put("user", this.userName);
	    connectionProps.put("password", this.password);

	    if (this.dbms.equals("mysql")) {
	        conn = DriverManager.getConnection(
	                   "jdbc:" + this.dbms + "://" +
	                   this.serverName +
	                   ":" + this.portNumber + "/" +
	                   this.dbName + "?" +
	                   "useSSL=false",
	                   connectionProps);
	    }
	    return conn;
	}
	
	
}