package kr.co.grcons.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;

import kr.co.grcons.db.DBconn;
import kr.co.grcons.vo.Users;

public class BoardController {
	private final Logger logger = Logger.getLogger(getClass().getSimpleName());
	public int insertUser(Users user) {
		int result = 0;
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
}
