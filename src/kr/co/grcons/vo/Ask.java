package kr.co.grcons.vo;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Ask extends Paging{
	int id;
	String name;
	String phone;
	String content;
	Date wDate;
	
	public Ask() {
		
	}
	
	public Ask(int id) {
		this.id = id;
	}
	
	public Ask(int totalCount, int pageNo) {
		super(totalCount, pageNo);
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getwDate() {
		return wDate;
	}
	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}
	public static Ask parse(ResultSet rs) throws SQLException {
		Ask ask = new Ask();
		ask.setId(rs.getInt("id"));
		ask.setContent(rs.getString("content"));
		ask.setName(rs.getString("name"));
		ask.setPhone(rs.getString("phone"));
		ask.setwDate(rs.getDate("wDate"));
		return ask;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
}
