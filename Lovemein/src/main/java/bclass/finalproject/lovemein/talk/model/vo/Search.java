package bclass.finalproject.lovemein.talk.model.vo;

public class Search {

	private static final long serialVersionUID = 2478L;
	
	private String type;
	private String keyword;
	private String u_no;
	private String page;

	public Search () {}
	
	public Search(String type, String keyword, String u_no, String page) {
		super();
		this.type = type;
		this.keyword = keyword;
		this.u_no = u_no;
		this.page = page;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	
}
