package bclass.finalproject.lovemein.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.admin.model.vo.UserReport;
import bclass.finalproject.lovemein.recent_search.vo.RecentSearch;
import bclass.finalproject.lovemein.users.model.dao.UsersDao;
import bclass.finalproject.lovemein.users.model.vo.AddInfo;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Ideal;
import bclass.finalproject.lovemein.users.model.vo.PrimaryInfo;
import bclass.finalproject.lovemein.users.model.vo.Style;
import bclass.finalproject.lovemein.users.model.vo.Users;

//회원관련 Service Implements by 귀정
@Service("usersService")
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDao usersDao;
	

	@Override
	public int joinService(HashMap<String, Object> map) {
		return usersDao.insertMember(map);
	}


	@Override
	public int joinUsersService(Users users) {
		
		return usersDao.insertUsersMember(users);
	}


	@Override
	public int idealSave(Ideal ideal) {
		
		return usersDao.idealSave(ideal);
	}


	@Override
	public AllUsers loginCheck(String u_email) {
		
		return usersDao.loginCheck(u_email);
	}


	@Override
	public Users checkId(String findid) {
		
		return usersDao.checkId(findid);
	}


	@Override
	public Users checkPw(String findPw) {
		
		return usersDao.checkPw(findPw);
	}


	@Override
	public int changePw(Users userFindPwd) {
		
		return usersDao.changePw(userFindPwd);
	}


	@Override
	public int accountInfoModi(Users users) {
		
		return usersDao.accountInfoModi(users);
	}


	@Override
	public int primaryInfo(PrimaryInfo pinfo) {
		
		return usersDao.primaryInfo(pinfo);
		
	}


	@Override
	public AllUsers targetUserInfo(String u_no) {
		
		return usersDao.targetUserInfo(u_no);
	}


	@Override
	public void addInfo(AddInfo ainfo) {
		
		usersDao.addInfo(ainfo);
		
	}


	@Override
	public void StyleInfo(Style style) {
	
		usersDao.StyleInfo(style);
		
	}


	@Override
	public int idealModi(Ideal ideal) {
		
		return usersDao.idealModi(ideal);
	}


	@Override
	public List<RecentSearch> historyList(String u_no) {
		
		return usersDao.historyList(u_no);
	}


	@Override
	public void saveHistory(RecentSearch rs) {
		
		usersDao.saveHistory(rs);
	}


	@Override
	public int historyAllDel(String u_no) {
		
		return usersDao.historyAllDel(u_no);
	}


	@Override
	public int searchOneDel(RecentSearch rs) {
		
		return usersDao.searchOneDel(rs);
	}


	@Override
	public void tenSizeHistory(String u_no) {
		
		usersDao.tenSizeHistory(u_no);
	}


	@Override
	public int reportInsert(UserReport report) {
		
		return usersDao.reportInsert(report);
	}


	@Override
	public List<Report> userReportList(HashMap<String, Object> map) {
		
		return usersDao.userReportList(map);
	}


	@Override
	public int userReportListCount(String u_no) {
		
		return usersDao.userReportListCount(u_no);
	}


	@Override
	public int phoneDBChk(String phone) {
		
		return usersDao.phoneDBChk(phone);
	}


	@Override
	public int chkMailMethod(String chkMail) {
		
		return usersDao.chkMailMethod(chkMail);
	}


	@Override
	public int chkNameMethod(String chkName) {
		
		return usersDao.chkNameMethod(chkName);
	}



}
