package kr.co.grcons.vo;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Board extends Paging{
	private String search;
	
	private int id;
	private String title;		// 제목
	private String content;
	private Date wdate;
	private int writer;
	private String username;
	private String photoUrl;
	private int orderById;
	
	public Board() {}
	
	public Board(int id) {
		this.id = id;
	}
	
	public Board(int totalCount, int pageNo) {
		super(totalCount, pageNo);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public void setId(String id) {
		this.id = Integer.parseInt(id);
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public int getWriter() {
		return this.writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	
	public int getOrderById() {
		return orderById;
	}

	public void setOrderById(int orderById) {
		this.orderById = orderById;
	}
	
	public static Board parse(ResultSet rs) throws SQLException {
		Board board = new Board();
		board.setTitle(rs.getString("title"));
		board.setContent(rs.getString("content"));
		board.setId(rs.getInt("id"));
		board.setUsername(rs.getString("username"));
		board.setWdate(rs.getDate("wdate"));
		return board;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
