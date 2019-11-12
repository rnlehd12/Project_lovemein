package bclass.finalproject.lovemein.feed.model.vo;

import java.io.Serializable;

public class FeedLike implements Serializable{

	private static final long serialVersionUID = 1201L;
	
	private String f_no;
	private String u_no;
	
	public FeedLike() {}

	public FeedLike(String f_no, String u_no) {
		super();
		this.f_no = f_no;
		this.u_no = u_no;
	}

	public String getF_no() {
		return f_no;
	}

	public void setF_no(String f_no) {
		this.f_no = f_no;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	@Override
	public String toString() {
		return "FeedLike [f_no=" + f_no + ", u_no=" + u_no + "]";
	}
	
	
	
}
