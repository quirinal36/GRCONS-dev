package kr.co.grcons.control;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import kr.co.grcons.db.DBconn;
import kr.co.grcons.vo.Waste;

public class RecordController implements DataInterface<Waste>{

	@Override
	public int insert(Waste input) {
		int result = 0;
		try(Connection conn = new DBconn().getConnection()){
			final String sql = new StringBuilder()
									.append("INSERT INTO waste (title, year, company, budget)")
									.append("VALUES")
									.append("(?,?,?,?)").toString();
			PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			
			int i = 1;
			pstmt.setString(i++, input.getTitle());
			pstmt.setString(i++, input.getYear());
			pstmt.setString(i++, input.getCompany());
			pstmt.setInt(i++, input.getBudget());
			
			System.out.println(pstmt.toString());
			
			result = pstmt.executeUpdate();
			
			ResultSet rs = pstmt.getGeneratedKeys();
			while(rs.next()) {
				int id = rs.getInt(1);
				System.out.println("generated id : " + id);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int update(Waste input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Waste selectOnt(Waste param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Waste> selectList(Waste param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Waste input) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
