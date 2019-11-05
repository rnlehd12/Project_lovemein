package bclass.finalproject.lovemein.users.model.vo;

import java.io.Serializable;

//이상형 VO by 귀정
public class Ideal implements Serializable{

	private static final long serialVersionUID = 1114L;

	private String u_no;
	private int i_height;
	private String i_loc;
	private String i_edu;
	private int i_age;
	private String i_weight;
	
	public Ideal(){}

	public Ideal(String u_no, int i_height, String i_loc, String i_edu, int age, String i_weight) {
		super();
		this.u_no = u_no;
		this.i_height = i_height;
		this.i_loc = i_loc;
		this.i_edu = i_edu;
		this.i_age = age;
		this.i_weight = i_weight;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public int getI_height() {
		return i_height;
	}

	public void setI_height(int i_height) {
		this.i_height = i_height;
	}

	public String getI_loc() {
		return i_loc;
	}

	public void setI_loc(String i_loc) {
		this.i_loc = i_loc;
	}

	public String getI_edu() {
		return i_edu;
	}

	public void setI_edu(String i_edu) {
		this.i_edu = i_edu;
	}

	public int getI_age() {
		return i_age;
	}

	public void setAge(int age) {
		this.i_age = age;
	}

	public String getI_weight() {
		return i_weight;
	}

	public void setI_weight(String i_weight) {
		this.i_weight = i_weight;
	}

	@Override
	public String toString() {
		return "Ideal [u_no=" + u_no + ", i_height=" + i_height + ", i_loc=" + i_loc + ", i_edu=" + i_edu + ", i_age="
				+ i_age + ", i_weight=" + i_weight + "]";
	}
	
	
}
