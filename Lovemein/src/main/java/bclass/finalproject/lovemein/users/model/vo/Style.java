package bclass.finalproject.lovemein.users.model.vo;

import java.io.Serializable;

//회원 스타일 VO by 귀정 
public class Style implements Serializable{

	private static final long serialVersionUID = 1114L;
	
	private String u_no;
	private String s_appeal;
	private String s_inter;
	private String s_ds;
	private String s_ls;
	
	public Style() {}

	public Style(String u_no, String s_appeal, String s_inter, String s_ds, String s_ls) {
		super();
		this.u_no = u_no;
		this.s_appeal = s_appeal;
		this.s_inter = s_inter;
		this.s_ds = s_ds;
		this.s_ls = s_ls;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getS_appeal() {
		return s_appeal;
	}

	public void setS_appeal(String s_appeal) {
		this.s_appeal = s_appeal;
	}

	public String getS_inter() {
		return s_inter;
	}

	public void setS_inter(String s_inter) {
		this.s_inter = s_inter;
	}

	public String getS_ds() {
		return s_ds;
	}

	public void setS_ds(String s_ds) {
		this.s_ds = s_ds;
	}

	public String getS_ls() {
		return s_ls;
	}

	public void setS_ls(String s_ls) {
		this.s_ls = s_ls;
	}

	@Override
	public String toString() {
		return "Style [u_no=" + u_no + ", s_appeal=" + s_appeal + ", s_inter=" + s_inter + ", s_ds=" + s_ds + ", s_ls="
				+ s_ls + "]";
	}
	
	
}
