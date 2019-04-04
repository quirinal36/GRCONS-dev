package kr.co.grcons.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import kr.co.grcons.db.DBconn;
import kr.co.grcons.vo.Board;

public class BoardController {
	private final Logger logger = Logger.getLogger(getClass().getSimpleName());
	
	public int getBoardCount() {
		int result = 0;
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT count(*) FROM Board").append(" ")
				.append("WHERE enabled>0");
			
			PreparedStatement stmt = conn.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Board> getBoardList(Board board){
		List<Board> result = new ArrayList<>();
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT board.*, user.username").append(" ")
				.append("FROM Board board left join users user on board.writer = user.id").append(" ")
				.append("WHERE enabled>0").append(" ")
				.append("order by id desc").append(" ")
				.append("limit ?,?");
			int i = 1;
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(i++, board.getFrom());
			pstmt.setInt(i++, board.getPageSize());
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				result.add(Board.parse(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
