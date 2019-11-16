package bclass.finalproject.lovemein.chat.model.vo;

public class Chat {


	private static final long serialVersionUID = 2333L;
	
	private String c_no;
	private String c_from_uno;
	private String c_to_uno;
	private String c_mission;
	private int c_readc;
	private int c_nreadc;
	
	public Chat() {}

	public Chat(String c_no, String c_from_uno, String c_to_uno, String c_mission, int c_readc, int c_nreadc) {
		super();
		this.c_no = c_no;
		this.c_from_uno = c_from_uno;
		this.c_to_uno = c_to_uno;
		this.c_mission = c_mission;
		this.c_readc = c_readc;
		this.c_nreadc = c_nreadc;
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

	public int getC_readc() {
		return c_readc;
	}

	public void setC_readc(int c_readc) {
		this.c_readc = c_readc;
	}

	public int getC_nreadc() {
		return c_nreadc;
	}

	public void setC_nreadc(int c_nreadc) {
		this.c_nreadc = c_nreadc;
	}

	@Override
	public String toString() {
		return "Chat [c_no=" + c_no + ", c_from_uno=" + c_from_uno + ", c_to_uno=" + c_to_uno + ", c_mission="
				+ c_mission + ", c_readc=" + c_readc + ", c_nreadc=" + c_nreadc + "]";
	}
	
	
	
}
