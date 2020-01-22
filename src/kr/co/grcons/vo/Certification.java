package kr.co.grcons.vo;

public class Certification {
	int id;
	String title;
	PhotoInfo photo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public PhotoInfo getPhoto() {
		return photo;
	}
	public void setPhoto(PhotoInfo photo) {
		this.photo = photo;
	}
	@Override
	public Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}
