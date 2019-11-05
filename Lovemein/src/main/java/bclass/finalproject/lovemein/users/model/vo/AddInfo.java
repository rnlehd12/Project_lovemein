package bclass.finalproject.lovemein.users.model.vo;

import java.io.Serializable;

//회원 추가정보 VO by 귀정
public class AddInfo implements Serializable{
	
	private static final long serialVersionUID = 1113L;
	
	private String u_no;
	private String u_blood;
	private String u_char;
	private String u_rei;
	private int u_drinking;
	private int u_smoking;
	
	public AddInfo() {}

	public AddInfo(String u_no, String u_blood, String u_char, String u_rei, int u_drinking, int u_smoking) {
		super();
		this.u_no = u_no;
		this.u_blood = u_blood;
		this.u_char = u_char;
		this.u_rei = u_rei;
		this.u_drinking = u_drinking;
		this.u_smoking = u_smoking;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getU_blood() {
		return u_blood;
	}

	public void setU_blood(String u_blood) {
		this.u_blood = u_blood;
	}

	public String getU_char() {
		return u_char;
	}

	public void setU_char(String u_char) {
		this.u_char = u_char;
	}

	public String getU_rei() {
		return u_rei;
	}

	public void setU_rei(String u_rei) {
		this.u_rei = u_rei;
	}

	public int getU_drinking() {
		return u_drinking;
	}

	public void setU_drinking(int u_drinking) {
		this.u_drinking = u_drinking;
	}

	public int getU_smoking() {
		return u_smoking;
	}

	public void setU_smoking(int u_smoking) {
		this.u_smoking = u_smoking;
	}

	@Override
	public String toString() {
		return "AddInfo [u_no=" + u_no + ", u_blood=" + u_blood + ", u_char=" + u_char + ", u_rei=" + u_rei
				+ ", u_drinking=" + u_drinking + ", u_smoking=" + u_smoking + "]";
	}
	
	
	
	
}
