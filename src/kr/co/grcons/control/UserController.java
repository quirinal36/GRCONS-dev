package kr.co.grcons.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Logger;

import org.mindrot.jbcrypt.BCrypt;

import kr.co.grcons.db.DBconn;
import kr.co.grcons.vo.Users;

public class UserController {
	private final Logger logger = Logger.getLogger(getClass().getSimpleName());
	
	public int insert(Users user) {
		int result = 0;
		user.setLogin("admin");
		user.setPassword("2449QWQW!!");
		user.setUsername("관리자");
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(10)));
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO users ")
				.append("(login, password, username, phone)")
				.append("VALUES(?,?,?,?)");
			int i = 1;
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(i++, user.getLogin());
			pstmt.setString(i++, user.getPassword());
			pstmt.setString(i++, user.getUsername());
			pstmt.setString(i++, user.getPhone());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Users login(Users input) {
		Users user = Users.newInstance();
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT id, login, password, username ")
				.append("FROM users ")
				.append("WHERE login=?");
			int i=1;
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(i, input.getLogin());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				user.setId(rs.getInt("id"));
				user.setLogin(rs.getString("login"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
			}
			boolean isLogined = BCrypt.checkpw(input.getPassword(), user.getPassword());
			if(isLogined) {
				return user;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
