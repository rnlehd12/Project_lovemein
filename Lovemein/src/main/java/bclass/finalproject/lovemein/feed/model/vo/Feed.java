package bclass.finalproject.lovemein.feed.model.vo;

import java.io.Serializable;
import java.sql.Date;

//피드 VO by 귀정
public class Feed implements Serializable{

	private static final long serialVersionUID = 1116L;
	
	private String f_no;
	private String f_text;
	private String f_img;
	private String f_tag;
	private java.sql.Date f_date;
	private String u_no;
	private String u_email;
	private String u_name;
	private String u_profile;
	private String count;
	
	public Feed() {}

	public Feed(String f_no, String f_text, String f_img, String f_tag, Date f_date, String u_no, String u_email,
			String u_name, String u_profile, String count) {
		super();
		this.f_no = f_no;
		this.f_text = f_text;
		this.f_img = f_img;
		this.f_tag = f_tag;
		this.f_date = f_date;
		this.u_no = u_no;
		this.u_email = u_email;
		this.u_name = u_name;
		this.u_profile = u_profile;
		this.count = count;
	}

	public String getF_no() {
		return f_no;
	}

	public void setF_no(String f_no) {
		this.f_no = f_no;
	}

	public String getF_text() {
		return f_text;
	}

	public void setF_text(String f_text) {
		this.f_text = f_text;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}

	public String getF_tag() {
		return f_tag;
	}

	public void setF_tag(String f_tag) {
		this.f_tag = f_tag;
	}

	public java.sql.Date getF_date() {
		return f_date;
	}

	public void setF_date(java.sql.Date f_date) {
		this.f_date = f_date;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getU_email() {
		return u_email;
	}

	public void setU_email(String u_email) {
		this.u_email = u_email;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_profile() {
		return u_profile;
	}

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Feed [f_no=" + f_no + ", f_text=" + f_text + ", f_img=" + f_img + ", f_tag=" + f_tag + ", f_date="
				+ f_date + ", u_no=" + u_no + ", u_email=" + u_email + ", u_name=" + u_name + ", u_profile=" + u_profile
				+ ", count=" + count + "]";
	}

	


}
