package bclass.finalproject.lovemein.users.model.vo;

import java.io.Serializable;
import java.sql.Date;

//회원 기본정보 VO by 귀정
public class PrimaryInfo implements Serializable{

	private static final long serialVersionUID = 1112L;
	
	private String u_no;
	private java.sql.Date u_birth;
	private String u_gender;
	private String u_loc;
	private String u_edu;
	private String u_shcool;
	private String u_job;
	private int u_height;
	private String u_weight;
	
	public PrimaryInfo() {}

	public PrimaryInfo(String u_no, Date u_birth, String u_gender, String u_loc, String u_edu, String u_shcool,
			String u_job, int u_height, String u_weight) {
		super();
		this.u_no = u_no;
		this.u_birth = u_birth;
		this.u_gender = u_gender;
		this.u_loc = u_loc;
		this.u_edu = u_edu;
		this.u_shcool = u_shcool;
		this.u_job = u_job;
		this.u_height = u_height;
		this.u_weight = u_weight;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public java.sql.Date getU_birth() {
		return u_birth;
	}

	public void setU_birth(java.sql.Date u_birth) {
		this.u_birth = u_birth;
	}

	public String getU_gender() {
		return u_gender;
	}

	public void setU_gender(String u_gender) {
		this.u_gender = u_gender;
	}

	public String getU_loc() {
		return u_loc;
	}

	public void setU_loc(String u_loc) {
		this.u_loc = u_loc;
	}

	public String getU_edu() {
		return u_edu;
	}

	public void setU_edu(String u_edu) {
		this.u_edu = u_edu;
	}

	public String getU_shcool() {
		return u_shcool;
	}

	public void setU_shcool(String u_shcool) {
		this.u_shcool = u_shcool;
	}

	public String getU_job() {
		return u_job;
	}

	public void setU_job(String u_job) {
		this.u_job = u_job;
	}

	public int getU_height() {
		return u_height;
	}

	public void setU_height(int u_height) {
		this.u_height = u_height;
	}

	public String getU_weight() {
		return u_weight;
	}

	public void setU_weight(String u_weight) {
		this.u_weight = u_weight;
	}

	@Override
	public String toString() {
		return "PrimaryInfo [u_no=" + u_no + ", u_birth=" + u_birth + ", u_gender=" + u_gender + ", u_loc=" + u_loc
				+ ", u_edu=" + u_edu + ", u_shcool=" + u_shcool + ", u_job=" + u_job + ", u_height=" + u_height
				+ ", u_weight=" + u_weight + "]";
	}
	
	
}
