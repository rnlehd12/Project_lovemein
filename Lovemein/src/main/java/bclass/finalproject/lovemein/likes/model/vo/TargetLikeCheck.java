package bclass.finalproject.lovemein.likes.model.vo;

import java.io.Serializable;

public class TargetLikeCheck implements Serializable{

	private static final long serialVersionUID = 2337L;
	
	private String u_no;
	private String target_no;
	private int count;
	
	public TargetLikeCheck(){}

	@Override
	public String toString() {
		return "TargetLikeCheck [u_no=" + u_no + ", target_no=" + target_no + ", count=" + count + "]";
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

	public TargetLikeCheck(String u_no, String target_no, int count) {
		super();
		this.u_no = u_no;
		this.target_no = target_no;
		this.count = count;
	};
	
	
}
