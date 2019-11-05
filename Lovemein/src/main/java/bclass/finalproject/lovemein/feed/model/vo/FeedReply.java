package bclass.finalproject.lovemein.feed.model.vo;

import java.io.Serializable;
import java.sql.Date;

//피드댓글 VO by 귀정
public class FeedReply implements Serializable{
	
	private static final long serialVersionUID = 1118L;
	
	private String fr_no;
	private String f_no;
	private String fr_text;
	private java.sql.Date fr_date;
	private String u_no;
	private String u_profile;
	private String u_name;	//댓글단 유저 네임
	
	public FeedReply() {}

	public FeedReply(String fr_no, String f_no, String fr_text, Date fr_date, String u_no, String u_profile,
			String u_name) {
		super();
		this.fr_no = fr_no;
		this.f_no = f_no;
		this.fr_text = fr_text;
		this.fr_date = fr_date;
		this.u_no = u_no;
		this.u_profile = u_profile;
		this.u_name = u_name;
	}

	public String getFr_no() {
		return fr_no;
	}

	public void setFr_no(String fr_no) {
		this.fr_no = fr_no;
	}

	public String getF_no() {
		return f_no;
	}

	public void setF_no(String f_no) {
		this.f_no = f_no;
	}

	public String getFr_text() {
		return fr_text;
	}

	public void setFr_text(String fr_text) {
		this.fr_text = fr_text;
	}

	public java.sql.Date getFr_date() {
		return fr_date;
	}

	public void setFr_date(java.sql.Date fr_date) {
		this.fr_date = fr_date;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getU_profile() {
		return u_profile;
	}

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	@Override
	public String toString() {
		return "FeedReply [fr_no=" + fr_no + ", f_no=" + f_no + ", fr_text=" + fr_text + ", fr_date=" + fr_date
				+ ", u_no=" + u_no + ", u_profile=" + u_profile + ", u_name=" + u_name + "]";
	}
	
	
}
