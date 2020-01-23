package kr.co.grcons.vo;

import java.sql.Date;

public class FileInfo {
	public static FileInfo newInstance(int boardId) {
		FileInfo result = new FileInfo();
		result.setBoardId(boardId);
		return result;
	}
	int id;
	int uploader;
	int boardId;
	Date wdate;
	String url;
	String name;
	String newFilename;
	int size;
	String contentType;
	Date udate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUploader() {
		return uploader;
	}
	public void setUploader(int uploader) {
		this.uploader = uploader;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public Date getWdate() {
		return wdate;
	}
	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNewFilename() {
		return newFilename;
	}
	public void setNewFilename(String newFilename) {
		this.newFilename = newFilename;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public Date getUdate() {
		return udate;
	}
	public void setUdate(Date udate) {
		this.udate = udate;
	}
	
	
}
