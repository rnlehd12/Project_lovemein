package bclass.finalproject.lovemein.users.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.admin.model.vo.UserReport;
import bclass.finalproject.lovemein.recent_search.vo.RecentSearch;
import bclass.finalproject.lovemein.users.model.vo.AddInfo;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Ideal;
import bclass.finalproject.lovemein.users.model.vo.PrimaryInfo;
import bclass.finalproject.lovemein.users.model.vo.Style;
import bclass.finalproject.lovemein.users.model.vo.Users;

//회원기능 관련 DAO by 귀정
@Repository("usersDao")
public class UsersDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertMember(HashMap<String, Object> map) {
		
		return sqlSession.insert("usersMapper.joinUsers", map);
	}

	public int insertUsersMember(Users users) {
		
		return sqlSession.insert("usersMapper.joinUsers1", users);
	}

	public int idealSave(Ideal ideal) {
		
		return sqlSession.insert("usersMapper.idealSave", ideal);
	}

	public AllUsers loginCheck(String u_email) {
		
		return sqlSession.selectOne("usersMapper.loginCheck", u_email);
	}

	public Users checkId(String findid) {
		
		return sqlSession.selectOne("usersMapper.checkId", findid);
	}

	public Users checkPw(String findPw) {
		
		return sqlSession.selectOne("usersMapper.checkPw", findPw);
	}

	public int changePw(Users userFindPwd) {
		
		return sqlSession.update("usersMapper.changePw", userFindPwd);
	}

	public int accountInfoModi(Users users) {
		
		return sqlSession.update("usersMapper.accountInfoModi", users);
	}

	public int primaryInfo(PrimaryInfo pinfo) {
		
		return sqlSession.update("usersMapper.primaryInfo", pinfo);
	}

	public AllUsers targetUserInfo(String u_no) {
		
		return sqlSession.selectOne("usersMapper.targetUserInfo",u_no);
	}

	public void addInfo(AddInfo ainfo) {
		
		sqlSession.update("usersMapper.addInfo", ainfo);
		
	}

	public void StyleInfo(Style style) {
		
		sqlSession.update("usersMapper.StyleInfo", style);
		
	}

	public int idealModi(Ideal ideal) {
		
		return sqlSession.update("usersMapper.idealModi", ideal);
	}

	public List<RecentSearch> historyList(String u_no) {
		
		return sqlSession.selectList("usersMapper.historyList",u_no);
	}

	public void saveHistory(RecentSearch rs) {
		
		sqlSession.insert("usersMapper.saveHistory",rs);
	}

	public int historyAllDel(String u_no) {
		
		return sqlSession.delete("usersMapper.historyAllDel", u_no);
	}

	public int searchOneDel(RecentSearch rs) {
		
		return sqlSession.delete("usersMapper.searchOneDel", rs);
	}

	public Object tenSizeHistory(String u_no) {
		
		return sqlSession.delete("usersMapper.tenSizeHistory", u_no);
	}

	public int reportInsert(UserReport report) {
		
		return sqlSession.insert("usersMapper.reportInsert", report);
	}

	public List<Report> userReportList(HashMap<String, Object> map) {
		
		return sqlSession.selectList("usersMapper.userReportList", map);
	}

	public int userReportListCount(String u_no) {
		
		return sqlSession.selectOne("usersMapper.userReportListCount", u_no);
	}

	public int phoneDBChk(String phone) {
		
		return sqlSession.selectOne("usersMapper.phoneDBChk", phone);
	}

	public int chkMailMethod(String chkMail) {
		
		return sqlSession.selectOne("usersMapper.chkMail", chkMail);
	}

	public int chkNameMethod(String chkName) {
		
		return sqlSession.selectOne("usersMapper.chkName", chkName);
	}


}
