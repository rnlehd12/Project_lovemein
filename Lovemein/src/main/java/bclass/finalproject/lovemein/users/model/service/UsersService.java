package bclass.finalproject.lovemein.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.admin.model.vo.UserReport;
import bclass.finalproject.lovemein.recent_search.vo.RecentSearch;
import bclass.finalproject.lovemein.users.model.vo.AddInfo;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Ideal;
import bclass.finalproject.lovemein.users.model.vo.PrimaryInfo;
import bclass.finalproject.lovemein.users.model.vo.Style;
import bclass.finalproject.lovemein.users.model.vo.Users;

//회원관련 Service by 귀정
public interface UsersService {

	int joinService(HashMap<String, Object> map);

	int joinUsersService(Users users);

	int idealSave(Ideal ideal);

	AllUsers loginCheck(String u_email);

	Users checkId(String findid);

	Users checkPw(String findPw);

	int changePw(Users userFindPwd);

	int accountInfoModi(Users users);

	int primaryInfo(PrimaryInfo pinfos);

	AllUsers targetUserInfo(String u_no);

	void addInfo(AddInfo ainfo);

	void StyleInfo(Style style);

	int idealModi(Ideal ideal);

	List<RecentSearch> historyList(String u_no);

	void saveHistory(RecentSearch rs);

	int historyAllDel(String u_no);

	int searchOneDel(RecentSearch rs);

	void tenSizeHistory(String u_no);

	int reportInsert(UserReport report);

	List<Report> userReportList(HashMap<String, Object> map);

	int userReportListCount(String u_no);

	int phoneDBChk(String phone);

	int chkMailMethod(String chkMail);

	int chkNameMethod(String chkName);



}
