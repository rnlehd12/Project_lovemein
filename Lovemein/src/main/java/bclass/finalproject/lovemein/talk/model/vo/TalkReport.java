package bclass.finalproject.lovemein.talk.model.vo;

public class TalkReport {

	private static final long serialVersionUID = 2226L;
	
	private String r_no;
	private String r_send_uno;
	private String r_rec_uno;
	private String r_text;
	private String r_date;
	private String r_yn;
	private String c_no;

	public TalkReport() {}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

	public String getR_send_uno() {
		return r_send_uno;
	}

	public void setR_send_uno(String r_send_uno) {
		this.r_send_uno = r_send_uno;
	}

	public String getR_rec_uno() {
		return r_rec_uno;
	}

	public void setR_rec_uno(String r_rec_uno) {
		this.r_rec_uno = r_rec_uno;
	}

	public String getR_text() {
		return r_text;
	}

	public void setR_text(String r_text) {
		this.r_text = r_text;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getR_yn() {
		return r_yn;
	}

	public void setR_yn(String r_yn) {
		this.r_yn = r_yn;
	}

	public String getC_no() {
		return c_no;
	}

	public void setC_no(String c_no) {
		this.c_no = c_no;
	}

	public TalkReport(String r_no, String r_send_uno, String r_rec_uno, String r_text, String r_date, String r_yn,
			String c_no) {
		super();
		this.r_no = r_no;
		this.r_send_uno = r_send_uno;
		this.r_rec_uno = r_rec_uno;
		this.r_text = r_text;
		this.r_date = r_date;
		this.r_yn = r_yn;
		this.c_no = c_no;
	}

	@Override
	public String toString() {
		return "TalkReport [r_no=" + r_no + ", r_send_uno=" + r_send_uno + ", r_rec_uno=" + r_rec_uno + ", r_text="
				+ r_text + ", r_date=" + r_date + ", r_yn=" + r_yn + ", c_no=" + c_no + "]";
	}
	
	
}
