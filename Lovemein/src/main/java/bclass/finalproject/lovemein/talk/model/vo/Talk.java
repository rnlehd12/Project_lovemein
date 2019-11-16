package bclass.finalproject.lovemein.talk.model.vo;

import java.sql.Date;

public class Talk {
	
	private static final long serialVersionUID = 2222L;
	
	
	private String c_no; //채팅뷰번호
	private String c_from_uno; //로그인회원
	private String c_to_uno; // 상대회원
	private String t_no; // 대화번호
	private String t_con; //대화내용
	private java.sql.Date t_date; //대화날짜
	private String m_uno; //대화내용
	private int t_readt;
	private int _read;
	
	public Talk() {}

	public Talk(String c_no, String c_from_uno, String c_to_uno, String t_no, String t_con, Date t_date, String m_uno,
			int t_readt, int _read) {
		super();
		this.c_no = c_no;
		this.c_from_uno = c_from_uno;
		this.c_to_uno = c_to_uno;
		this.t_no = t_no;
		this.t_con = t_con;
		this.t_date = t_date;
		this.m_uno = m_uno;
		this.t_readt = t_readt;
		this._read = _read;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
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

	public String getM_uno() {
		return m_uno;
	}

	public void setM_uno(String m_uno) {
		this.m_uno = m_uno;
	}

	public int getT_readt() {
		return t_readt;
	}

	public void setT_readt(int t_readt) {
		this.t_readt = t_readt;
	}

	public int get_read() {
		return _read;
	}

	public void set_read(int _read) {
		this._read = _read;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Talk [c_no=" + c_no + ", c_from_uno=" + c_from_uno + ", c_to_uno=" + c_to_uno + ", t_no=" + t_no
				+ ", t_con=" + t_con + ", t_date=" + t_date + ", m_uno=" + m_uno + ", t_readt=" + t_readt + ", _read="
				+ _read + "]";
	}
	
	
	
}
