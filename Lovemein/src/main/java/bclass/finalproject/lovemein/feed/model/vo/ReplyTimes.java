package bclass.finalproject.lovemein.feed.model.vo;

import java.io.Serializable;

//댓글 시간 전송용  vo by 귀정
public class ReplyTimes implements Serializable{

	private static final long serialVersionUID = 1333L;
	
	private String fr_no;
	private String f_no;
	private String fr_date_msg;

	public ReplyTimes() {}

	public ReplyTimes(String fr_no, String f_no, String fr_date_msg) {
		super();
		this.fr_no = fr_no;
		this.f_no = f_no;
		this.fr_date_msg = fr_date_msg;
	}

	public String getFr_no() {
		return fr_no;
	}

	public void setFr_no(String fr_no) {
		this.fr_no = fr_no;
	}

	public String getF_no() {
		return f_no;
	}

	public void setF_no(String f_no) {
		this.f_no = f_no;
	}

	public String getFr_date_msg() {
		return fr_date_msg;
	}

	public void setFr_date_msg(String fr_date_msg) {
		this.fr_date_msg = fr_date_msg;
	}

	@Override
	public String toString() {
		return "ReplyTimes [fr_no=" + fr_no + ", f_no=" + f_no + ", fr_date_msg=" + fr_date_msg + "]";
	}

	
	
	
}
