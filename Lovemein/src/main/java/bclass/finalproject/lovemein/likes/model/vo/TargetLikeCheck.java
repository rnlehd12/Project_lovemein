package bclass.finalproject.lovemein.likes.model.vo;

import java.io.Serializable;

public class TargetLikeCheck implements Serializable{

	private static final long serialVersionUID = 2337L;
	
	private String u_no;
	private String target_no;
	private int count;
	private String f_no;	//전체피드용
	
	public TargetLikeCheck(){}

	@Override
	public String toString() {
		return "TargetLikeCheck [u_no=" + u_no + ", target_no=" + target_no + ", count=" + count + ", f_no=" + f_no
				+ "]";
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getTarget_no() {
		return target_no;
	}

	public void setTarget_no(String target_no) {
		this.target_no = target_no;
	}

	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getF_no() {
		return f_no;
	}

	public void setF_no(String f_no) {
		this.f_no = f_no;
	}

	public TargetLikeCheck(String u_no, String target_no, int count, String f_no) {
		super();
		this.u_no = u_no;
		this.target_no = target_no;
		this.count = count;
		this.f_no = f_no;
	};
	
	
}
