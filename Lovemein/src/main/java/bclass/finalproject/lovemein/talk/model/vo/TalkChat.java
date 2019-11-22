package bclass.finalproject.lovemein.talk.model.vo;

import java.sql.Date;

public class TalkChat {
	
	private static final long serialVersionUID = 2233L;

	private String c_no;
	
	private String t_no;
	private String t_con;
	private java.sql.Date t_date;
	private String t_read;
	private String t_from_uno;
	private String t_to_uno;
	
	private String c_from_uno;
	private String c_to_uno;
	private String c_mission;
	private String c_readc;
	private String c_nreadc;
	
	private String t_profile;
	
	
	public TalkChat() {}

	
	
	public TalkChat(String c_no, String t_no, String t_con, Date t_date, String t_read, String t_from_uno,
			String t_to_uno, String c_from_uno, String c_to_uno, String c_mission, String c_readc, String c_nreadc,
			String t_profile) {
		super();
		this.c_no = c_no;
		this.t_no = t_no;
		this.t_con = t_con;
		this.t_date = t_date;
		this.t_read = t_read;
		this.t_from_uno = t_from_uno;
		this.t_to_uno = t_to_uno;
		this.c_from_uno = c_from_uno;
		this.c_to_uno = c_to_uno;
		this.c_mission = c_mission;
		this.c_readc = c_readc;
		this.c_nreadc = c_nreadc;
		this.t_profile = t_profile;
	}



	public String getT_profile() {
		return t_profile;
	}



	public void setT_profile(String t_profile) {
		this.t_profile = t_profile;
	}



	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getT_no() {
		return t_no;
	}

	public void setT_no(String t_no) {
		this.t_no = t_no;
	}

	public String getT_con() {
		return t_con;
	}

	public void setT_con(String t_con) {
		this.t_con = t_con;
	}

	public java.sql.Date getT_date() {
		return t_date;
	}

	public void setT_date(java.sql.Date t_date) {
		this.t_date = t_date;
	}

	public String getT_read() {
		return t_read;
	}

	public void setT_read(String t_read) {
		this.t_read = t_read;
	}

	public String getT_from_uno() {
		return t_from_uno;
	}

	public void setT_from_uno(String t_from_uno) {
		this.t_from_uno = t_from_uno;
	}

	public String getT_to_uno() {
		return t_to_uno;
	}

	public void setT_to_uno(String t_to_uno) {
		this.t_to_uno = t_to_uno;
	}

	public String getC_from_uno() {
		return c_from_uno;
	}

	public void setC_from_uno(String c_from_uno) {
		this.c_from_uno = c_from_uno;
	}

	public String getC_to_uno() {
		return c_to_uno;
	}

	public void setC_to_uno(String c_to_uno) {
		this.c_to_uno = c_to_uno;
	}

	public String getC_mission() {
		return c_mission;
	}

	public void setC_mission(String c_mission) {
		this.c_mission = c_mission;
	}

	public String getC_readc() {
		return c_readc;
	}

	public void setC_readc(String c_readc) {
		this.c_readc = c_readc;
	}

	public String getC_nreadc() {
		return c_nreadc;
	}

	public void setC_nreadc(String c_nreadc) {
		this.c_nreadc = c_nreadc;
	}



	@Override
	public String toString() {
		return "TalkChat [c_no=" + c_no + ", t_no=" + t_no + ", t_con=" + t_con + ", t_date=" + t_date + ", t_read="
				+ t_read + ", t_from_uno=" + t_from_uno + ", t_to_uno=" + t_to_uno + ", c_from_uno=" + c_from_uno
				+ ", c_to_uno=" + c_to_uno + ", c_mission=" + c_mission + ", c_readc=" + c_readc + ", c_nreadc="
				+ c_nreadc + ", t_profile=" + t_profile + "]";
	}
	

}
