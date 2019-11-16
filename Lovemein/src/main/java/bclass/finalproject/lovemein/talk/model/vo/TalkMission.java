package bclass.finalproject.lovemein.talk.model.vo;

public class TalkMission {
	
	private static final long serialVersionUID = 2224L;
	
	
	private String m_no;
	private String c_no;
	private String c_from_uno;
	private String c_to_uno;
	private String c_mission;
	private String m_con;
	private String m_sta;


	public TalkMission() {}

	
	public TalkMission(String m_no, String c_no, String c_from_uno, String c_to_uno, String c_mission, String m_con,
			String m_sta) {
		super();
		this.m_no = m_no;
		this.c_no = c_no;
		this.c_from_uno = c_from_uno;
		this.c_to_uno = c_to_uno;
		this.c_mission = c_mission;
		this.m_con = m_con;
		this.m_sta = m_sta;
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
		return "TalkMission [c_no=" + c_no + ", c_from_uno=" + c_from_uno + ", c_to_uno=" + c_to_uno + ", c_mission="
				+ c_mission + ", m_con=" + m_con + ", m_sta=" + m_sta + "]";
	}
	
}
