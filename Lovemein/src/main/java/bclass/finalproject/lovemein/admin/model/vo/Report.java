package bclass.finalproject.lovemein.admin.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Report implements Serializable {
	
	private static final long serialVersionUID = 2500L;

	private String r_no;
	private String r_text;
	private Date r_date;
	private String r_send_uno;
	private String r_rec_uno;
	private String r_yn;

	public Report() {}

	public Report(String r_no, String r_text, Date r_date, String r_send_uno, String r_rec_uno, String r_yn) {
		super();
		this.r_no = r_no;
		this.r_text = r_text;
		this.r_date = r_date;
		this.r_send_uno = r_send_uno;
		this.r_rec_uno = r_rec_uno;
		this.r_yn = r_yn;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

	public String getR_text() {
		return r_text;
	}

	public void setR_text(String r_text) {
		this.r_text = r_text;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getR_send_uno() {
		return r_send_uno;
	}

	public void setR_send_uno(String r_send_uno) {
		this.r_send_uno = r_send_uno;
	}

	public String getR_rec_uno() {
		return r_rec_uno;
	}

	public void setR_rec_uno(String r_rec_uno) {
		this.r_rec_uno = r_rec_uno;
	}

	public String getR_yn() {
		return r_yn;
	}

	public void setR_yn(String r_yn) {
		this.r_yn = r_yn;
	}

	@Override
	public String toString() {
		return "Report [r_no=" + r_no + ", r_text=" + r_text + ", r_date=" + r_date + ", r_send_uno=" + r_send_uno
				+ ", r_rec_uno=" + r_rec_uno + ", r_yn=" + r_yn + "]";
	}
	
	
}
