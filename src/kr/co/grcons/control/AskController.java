package kr.co.grcons.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import kr.co.grcons.db.DBconn;
import kr.co.grcons.vo.Ask;

public class AskController {
	private final Logger logger = Logger.getLogger(getClass().getSimpleName());
	
	public int insertAsk(Ask ask) {
		int result = 0;
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO ask ")
				.append("(name, phone, content) ")
				.append("values ")
				.append("(?,?,?)");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
			int i = 1;
			pstmt.setString(i++, ask.getName());
			pstmt.setString(i++, ask.getPhone());
			pstmt.setString(i++, ask.getContent());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int getAskCount(Ask ask) {
		int result = 0;
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT count(*) FROM ask");
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Ask> getAskList(Ask ask){
		List<Ask> list = new ArrayList<Ask>();
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM ask WHERE id > 0 order by id desc")
			.append("limit ?, ?");
			int i=1;
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(i++, ask.getFrom());
			pstmt.setInt(i++, ask.getPageSize());
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(Ask.parse(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public Ask getAsk(Ask ask){
		Ask result = new Ask();
		try(Connection conn = new DBconn().getConnection()){
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT * FROM ask WHERE id = ? ");
			
			int i=1;
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(i++, ask.getId());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				result = Ask.parse(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
