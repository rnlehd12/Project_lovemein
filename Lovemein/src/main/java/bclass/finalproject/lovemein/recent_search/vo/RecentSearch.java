package bclass.finalproject.lovemein.recent_search.vo;

import java.io.Serializable;
import java.sql.Date;

// 최근 검색어 저장용 vo by 귀정

public class RecentSearch implements Serializable{

	private static final long serialVersionUID = 1217L;
	
	private int rownum;
	private String u_no;
	private java.sql.Date search_date;
	private String search_text;
	
	public RecentSearch() {}

	public RecentSearch(int rownum, String u_no, Date search_date, String search_text) {
		super();
		this.u_no = u_no;
		this.search_date = search_date;
		this.search_text = search_text;
		this.rownum = rownum;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public java.sql.Date getSearch_date() {
		return search_date;
	}

	public void setSearch_date(java.sql.Date search_date) {
		this.search_date = search_date;
	}

	public String getSearch_text() {
		return search_text;
	}

	public void setSearch_text(String search_text) {
		this.search_text = search_text;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	@Override
	public String toString() {
		return "RecentSearch [rownum=" + rownum + ", u_no=" + u_no + ", search_date=" + search_date + ", search_text="
				+ search_text + "]";
	}


}
