package bclass.finalproject.lovemein.talk.model.vo;

import java.sql.Date;

import com.google.gson.Gson;

public class Talk {
	
	private static final long serialVersionUID = 2222L;
	
	
	private String c_no; //채팅뷰번호
	private String t_from_uno; //로그인회원
	private String t_to_uno; // 상대회원
	private String t_no; // 대화번호
	private String t_con; //대화내용
	private java.sql.Date t_date; //대화날짜
	private int t_read;

	
	public Talk() {}

	
	public Talk(String c_no, String t_from_uno, String t_to_uno, String t_no, String t_con, Date t_date, int t_read) {
		super();
		this.c_no = c_no;
		this.t_from_uno = t_from_uno;
		this.t_to_uno = t_to_uno;
		this.t_no = t_no;
		this.t_con = t_con;
		this.t_date = t_date;
		this.t_read = t_read;
	}


	public int getT_read() {
		return t_read;
	}


	public void setT_read(int t_read) {
		this.t_read = t_read;
	}


	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
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


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	public static Talk convertMessage(String source) {
		Talk talk = new Talk();
		Gson gson = new Gson();
		talk = gson.fromJson(source,  Talk.class);
		return talk;
	}
	
	@Override
	public String toString() {
		return "Talk [c_no=" + c_no + ", t_from_uno=" + t_from_uno + ", t_to_uno=" + t_to_uno + ", t_no=" + t_no
				+ ", t_con=" + t_con + ", t_date=" + t_date + ", t_read=" + t_read + "]";
	}
	
	
	
	

	
	
}
