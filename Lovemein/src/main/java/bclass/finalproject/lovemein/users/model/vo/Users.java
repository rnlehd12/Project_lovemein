package bclass.finalproject.lovemein.users.model.vo;

import java.io.Serializable;
import java.sql.Date;

//회원 필수정보 VO by 귀정
public class Users implements Serializable{
	
	private static final long serialVersionUID = 1111L;
	
	private String u_no;
	private String u_email;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private int u_coin;
	private String u_billing;
	private String u_intro;
	private String u_profile;
	private java.sql.Date join_date;
	
	public Users() {}

	public Users(String u_no, String u_email, String u_pw, String u_name, String u_phone, int u_coin, String u_billing,
			String u_intro, String u_profile, Date join_date) {
		super();
		this.u_no = u_no;
		this.u_email = u_email;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_phone = u_phone;
		this.u_coin = u_coin;
		this.u_billing = u_billing;
		this.u_intro = u_intro;
		this.u_profile = u_profile;
		this.join_date = join_date;
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

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public int getU_coin() {
		return u_coin;
	}

	public void setU_coin(int u_coin) {
		this.u_coin = u_coin;
	}

	public String getU_billing() {
		return u_billing;
	}

	public void setU_billing(String u_billing) {
		this.u_billing = u_billing;
	}

	public String getU_intro() {
		return u_intro;
	}

	public void setU_intro(String u_intro) {
		this.u_intro = u_intro;
	}

	public String getU_profile() {
		return u_profile;
	}

	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}

	public java.sql.Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(java.sql.Date join_date) {
		this.join_date = join_date;
	}

	@Override
	public String toString() {
		return "Users [u_no=" + u_no + ", u_email=" + u_email + ", u_pw=" + u_pw + ", u_name=" + u_name + ", u_phone="
				+ u_phone + ", u_coin=" + u_coin + ", u_billing=" + u_billing + ", u_intro=" + u_intro + ", u_profile="
				+ u_profile + ", join_date=" + join_date + "]";
	}


	
	
}
