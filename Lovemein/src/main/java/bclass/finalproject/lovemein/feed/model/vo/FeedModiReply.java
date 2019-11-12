package bclass.finalproject.lovemein.feed.model.vo;

import java.io.Serializable;

//피드댓글수정용 VO by 귀정
public class FeedModiReply implements Serializable{

	private static final long serialVersionUID = 1222L;
	
	private String fr_no;
	private String fr_text;
	
	public FeedModiReply() {}

	public FeedModiReply(String fr_no, String fr_text) {
		super();
		this.fr_no = fr_no;
		this.fr_text = fr_text;
	}

	public String getFr_no() {
		return fr_no;
	}

	public void setFr_no(String fr_no) {
		this.fr_no = fr_no;
	}

	public String getFr_text() {
		return fr_text;
	}

	public void setFr_text(String fr_text) {
		this.fr_text = fr_text;
	}

	@Override
	public String toString() {
		return "FeedModiReply [fr_no=" + fr_no + ", fr_text=" + fr_text + "]";
	}
	
	
}
