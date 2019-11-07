package bclass.finalproject.lovemein.likes.model.vo;

import java.io.Serializable;

//찜하기 VO by 귀정
public class Likes implements Serializable{

	private static final long serialVersionUID = 1117L;
	
	private String u_no_send;
	private String u_no_rec;
	private String u_rec_name;	//좋아하는 사람 이름  //찜받은 사람 이름
	private String u_send_name;	//찜 보낸 사람 이름
	private String u_rec_profileImg;	//좋아하는 사람 프로필 //찜받은 사람 프로필
	private String u_send_profileImg;	//찜 보낸 사람 프로필
	private String u_rec_age; 
	private String u_send_age; 
	private String u_rec_job; 
	private String u_send_job; 
	private String u_rec_sch; 
	private String u_send_sch; 
	private String u_rec_loc;  
	private String u_send_loc;  
	

	
	public Likes() {}
	
	public Likes(String u_no_send, String u_no_rec, String u_rec_name, String u_rec_profileImg) {
		super();
		this.u_no_send = u_no_send;
		this.u_no_rec = u_no_rec;
		this.u_rec_name = u_rec_name;
		this.u_rec_profileImg = u_rec_profileImg;
	}
	
	
	public Likes(String u_no_send, String u_no_rec, String u_rec_name, String u_send_name, String u_rec_profileImg,
			String u_send_profileImg, String u_rec_age, String u_send_age, String u_rec_job, String u_send_job,
			String u_rec_sch, String u_send_sch, String u_rec_loc, String u_send_loc) {
		super();
		this.u_no_send = u_no_send;
		this.u_no_rec = u_no_rec;
		this.u_rec_name = u_rec_name;
		this.u_send_name = u_send_name;
		this.u_rec_profileImg = u_rec_profileImg;
		this.u_send_profileImg = u_send_profileImg;
		this.u_rec_age = u_rec_age;
		this.u_send_age = u_send_age;
		this.u_rec_job = u_rec_job;
		this.u_send_job = u_send_job;
		this.u_rec_sch = u_rec_sch;
		this.u_send_sch = u_send_sch;
		this.u_rec_loc = u_rec_loc;
		this.u_send_loc = u_send_loc;
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
	
	
	public String getU_send_name() {
		return u_send_name;
	}

	public void setU_send_name(String u_send_name) {
		this.u_send_name = u_send_name;
	}

	public String getU_send_profileImg() {
		return u_send_profileImg;
	}

	public void setU_send_profileImg(String u_send_profileImg) {
		this.u_send_profileImg = u_send_profileImg;
	}

	public String getU_rec_age() {
		return u_rec_age;
	}

	public void setU_rec_age(String u_rec_age) {
		this.u_rec_age = u_rec_age;
	}

	public String getU_send_age() {
		return u_send_age;
	}

	public void setU_send_age(String u_send_age) {
		this.u_send_age = u_send_age;
	}

	public String getU_rec_job() {
		return u_rec_job;
	}

	public void setU_rec_job(String u_rec_job) {
		this.u_rec_job = u_rec_job;
	}

	public String getU_send_job() {
		return u_send_job;
	}

	public void setU_send_job(String u_send_job) {
		this.u_send_job = u_send_job;
	}

	public String getU_rec_sch() {
		return u_rec_sch;
	}

	public void setU_rec_sch(String u_rec_sch) {
		this.u_rec_sch = u_rec_sch;
	}

	public String getU_send_sch() {
		return u_send_sch;
	}

	public void setU_send_sch(String u_send_sch) {
		this.u_send_sch = u_send_sch;
	}

	public String getU_rec_loc() {
		return u_rec_loc;
	}

	public void setU_rec_loc(String u_rec_loc) {
		this.u_rec_loc = u_rec_loc;
	}

	public String getU_send_loc() {
		return u_send_loc;
	}

	public void setU_send_loc(String u_send_loc) {
		this.u_send_loc = u_send_loc;
	}

	@Override
	public String toString() {
		return "Likes [u_no_send=" + u_no_send + ", u_no_rec=" + u_no_rec + ", u_rec_name=" + u_rec_name
				+ ", u_send_name=" + u_send_name + ", u_rec_profileImg=" + u_rec_profileImg + ", u_send_profileImg="
				+ u_send_profileImg + ", u_rec_age=" + u_rec_age + ", u_send_age=" + u_send_age + ", u_rec_job="
				+ u_rec_job + ", u_send_job=" + u_send_job + ", u_rec_sch=" + u_rec_sch + ", u_send_sch=" + u_send_sch
				+ ", u_rec_loc=" + u_rec_loc + ", u_send_loc=" + u_send_loc + "]";
	}

/*	@Override
	public String toString() {
		return "Likes [u_no_send=" + u_no_send + ", u_no_rec=" + u_no_rec + ", u_rec_name=" + u_rec_name
				+ ", u_rec_profileImg=" + u_rec_profileImg + "]";
	}*/
	
	
}
