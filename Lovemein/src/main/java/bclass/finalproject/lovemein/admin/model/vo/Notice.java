package bclass.finalproject.lovemein.admin.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Notice implements Serializable {
	
	private static final long serialVersionUID = 2400L;
	
	private String n_no;
	private String n_img;
	private String n_title;
	private String u_no;
	private String n_text;
	private Date n_date;
	private String n_simg;
	
	public Notice() {}

	public Notice(String n_no, String n_img, String n_title, String u_no, String n_text, Date n_date, String n_simg) {
		super();
		this.n_no = n_no;
		this.n_img = n_img;
		this.n_title = n_title;
		this.u_no = u_no;
		this.n_text = n_text;
		this.n_date = n_date;
		this.n_simg = n_simg;
	}

	public String getN_no() {
		return n_no;
	}

	public void setN_no(String n_no) {
		this.n_no = n_no;
	}

	public String getN_img() {
		return n_img;
	}

	public void setN_img(String n_img) {
		this.n_img = n_img;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getN_text() {
		return n_text;
	}

	public void setN_text(String n_text) {
		this.n_text = n_text;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public String getN_simg() {
		return n_simg;
	}

	public void setN_simg(String n_simg) {
		this.n_simg = n_simg;
	}

	@Override
	public String toString() {
		return "Notice [n_no=" + n_no + ", n_img=" + n_img + ", n_title=" + n_title + ", u_no=" + u_no + ", n_text="
				+ n_text + ", n_date=" + n_date + ", n_simg=" + n_simg + "]";
	}
	
	
	
	
	
}
