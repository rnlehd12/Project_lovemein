package bclass.finalproject.lovemein.likes.model.vo;

import java.io.Serializable;

//찜하기 VO by 귀정
public class Likes implements Serializable{

	private static final long serialVersionUID = 1117L;
	
	private String u_no_send;
	private String u_no_rec;
	private String u_rec_name;	//좋아하는 사람 이름
	private String u_rec_profileImg;	//좋아하는 사람 프로필
	
	public Likes() {}
	
	public Likes(String u_no_send, String u_no_rec, String u_rec_name, String u_rec_profileImg) {
		super();
		this.u_no_send = u_no_send;
		this.u_no_rec = u_no_rec;
		this.u_rec_name = u_rec_name;
		this.u_rec_profileImg = u_rec_profileImg;
	}

	public String getU_no_send() {
		return u_no_send;
	}

	public void setU_no_send(String u_no_send) {
		this.u_no_send = u_no_send;
	}

	public String getU_no_rec() {
		return u_no_rec;
	}

	public void setU_no_rec(String u_no_rec) {
		this.u_no_rec = u_no_rec;
	}

	public String getU_rec_name() {
		return u_rec_name;
	}

	public void setU_rec_name(String u_rec_name) {
		this.u_rec_name = u_rec_name;
	}

	
	public String getU_rec_profileImg() {
		return u_rec_profileImg;
	}

	public void setU_rec_profileImg(String u_rec_profileImg) {
		this.u_rec_profileImg = u_rec_profileImg;
	}

	@Override
	public String toString() {
		return "Likes [u_no_send=" + u_no_send + ", u_no_rec=" + u_no_rec + ", u_rec_name=" + u_rec_name
				+ ", u_rec_profileImg=" + u_rec_profileImg + "]";
	}

}
