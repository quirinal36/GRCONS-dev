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
	
	public int updateBoard(Board board) {
		int result = 0;
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE Board ")
				.append("SET ")
				.append("title=?,")
				.append("content=? ")
				.append("WHERE id =?");
						
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
			int i = 1;
			pstmt.setString(i++, board.getTitle());
			pstmt.setString(i++, board.getContent());
			pstmt.setInt(i++, board.getId());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int deleteBoard(Board board) {
		int result = 0;
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("DELETE FROM Board ")
				.append("WHERE id = ?");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
			int i = 1;
			pstmt.setInt(i++, board.getId());
			logger.info(pstmt.toString());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int insertBoard(Board board) {
		int result = 0;
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO Board ")
				.append("(title, wdate, writer, content) ")
				.append("values ")
				.append("(?,NOW(),?,?)");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
			int i = 1;
			pstmt.setString(i++, board.getTitle());
			pstmt.setInt(i++, board.getWriter());
			pstmt.setString(i++, board.getContent());
//			logger.info(pstmt.toString());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
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
	public Board getBoard(Board input) {
		Board result = new Board();
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT board.*, u.username AS username").append(" ")
				.append("FROM Board board left join users u on board.writer = u.id").append(" ")
				.append("WHERE enabled>0 and board.id=?");
			int i = 1;
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(i, input.getId());
			
//			logger.info(pstmt.toString());
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
//				result = Board.parse(rs);
				result.setId(rs.getInt("id"));
				result.setTitle(rs.getString("title"));
				result.setContent(rs.getString("content"));
				result.setUsername(rs.getString("username"));
				result.setWdate(rs.getDate("wdate"));
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
			sql.append("SELECT board.*, u.username").append(" ")
				.append("FROM Board board left join users u on board.writer = u.id").append(" ")
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
