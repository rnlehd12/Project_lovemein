package bclass.finalproject.lovemein.talk.model.vo;

import java.sql.Date;

public class TalkMission {
	
	private static final long serialVersionUID = 2424L;
	
	
	private String m_no; //미션번호
	private String c_no; //채팅방번호
	private String c_from_uno; //미션유저1
	private String c_to_uno; //미션유저2
	private String p_name; // 미션유저 중에서 상대유저 이름
	private String m_name; // 미션유저 중에서 신청유저 이름
	
	private String c_mission; //미션글
	private String m_con; //미션사진
	private String m_sta; //미션상태
	private java.sql.Date m_date; //미션날짜
	private String listcount; // list수

	public TalkMission() {}







	public TalkMission(String m_no, String c_no, String c_from_uno, String c_to_uno, String p_name, String m_name,
			String c_mission, String m_con, String m_sta, Date m_date, String listcount) {
		super();
		this.m_no = m_no;
		this.c_no = c_no;
		this.c_from_uno = c_from_uno;
		this.c_to_uno = c_to_uno;
		this.p_name = p_name;
		this.m_name = m_name;
		this.c_mission = c_mission;
		this.m_con = m_con;
		this.m_sta = m_sta;
		this.m_date = m_date;
		this.listcount = listcount;
	}







	public String getM_name() {
		return m_name;
	}







	public void setM_name(String m_name) {
		this.m_name = m_name;
	}







	public String getP_name() {
		return p_name;
	}





	public void setP_name(String p_name) {
		this.p_name = p_name;
	}





	public java.sql.Date getM_date() {
		return m_date;
	}





	public void setM_date(java.sql.Date m_date) {
		this.m_date = m_date;
	}





	public String getListcount() {
		return listcount;
	}



	public void setListcount(String listcount) {
		this.listcount = listcount;
	}



	public String getM_no() {
		return m_no;
	}


	public void setM_no(String m_no) {
		this.m_no = m_no;
	}


	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public String getC_from_uno() {
		return c_from_uno;
	}

	public void setC_from_uno(String c_from_uno) {
		this.c_from_uno = c_from_uno;
	}

	public String getC_to_uno() {
		return c_to_uno;
	}

	public void setC_to_uno(String c_to_uno) {
		this.c_to_uno = c_to_uno;
	}

	public String getC_mission() {
		return c_mission;
	}

	public void setC_mission(String c_mission) {
		this.c_mission = c_mission;
	}

	public String getM_con() {
		return m_con;
	}

	public void setM_con(String m_con) {
		this.m_con = m_con;
	}

	public String getM_sta() {
		return m_sta;
	}

	public void setM_sta(String m_sta) {
		this.m_sta = m_sta;
	}







	@Override
	public String toString() {
		return "TalkMission [m_no=" + m_no + ", c_no=" + c_no + ", c_from_uno=" + c_from_uno + ", c_to_uno=" + c_to_uno
				+ ", p_name=" + p_name + ", m_name=" + m_name + ", c_mission=" + c_mission + ", m_con=" + m_con
				+ ", m_sta=" + m_sta + ", m_date=" + m_date + ", listcount=" + listcount + "]";
	}







	
}
