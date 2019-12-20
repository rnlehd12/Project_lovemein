package bclass.finalproject.lovemein.admin.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Report implements Serializable {
	
	private static final long serialVersionUID = 2500L;

	private String rownum;
	private String r_no;
	private String u_no;
	private String r_text;
	private Date r_date;
	private String r_send_uno;
	private String r_rec_uno;
	private String r_yn;
	private String u_name;
	private String searchResult;

	
	public Report() {}


	public Report(String rownum, String r_no, String u_no, String r_text, Date r_date, String r_send_uno,
			String r_rec_uno, String r_yn, String u_name, String searchResult) {
		super();
		this.rownum = rownum;
		this.r_no = r_no;
		this.u_no = u_no;
		this.r_text = r_text;
		this.r_date = r_date;
		this.r_send_uno = r_send_uno;
		this.r_rec_uno = r_rec_uno;
		this.r_yn = r_yn;
		this.u_name = u_name;
		this.searchResult = searchResult;
	}


	public String getRownum() {
		return rownum;
	}


	public void setRownum(String rownum) {
		this.rownum = rownum;
	}


	public String getR_no() {
		return r_no;
	}


	public void setR_no(String r_no) {
		this.r_no = r_no;
	}


	public String getU_no() {
		return u_no;
	}


	public void setU_no(String u_no) {
		this.u_no = u_no;
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


	public String getU_name() {
		return u_name;
	}


	public void setU_name(String u_name) {
		this.u_name = u_name;
	}


	public String getSearchResult() {
		return searchResult;
	}


	public void setSearchResult(String searchResult) {
		this.searchResult = searchResult;
	}


	@Override
	public String toString() {
		return "Report [rownum=" + rownum + ", r_no=" + r_no + ", u_no=" + u_no + ", r_text=" + r_text + ", r_date="
				+ r_date + ", r_send_uno=" + r_send_uno + ", r_rec_uno=" + r_rec_uno + ", r_yn=" + r_yn + ", u_name="
				+ u_name + ", searchResult=" + searchResult + "]";
	}

	
}
