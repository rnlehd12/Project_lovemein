package bclass.finalproject.lovemein.users.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Ideal;
import bclass.finalproject.lovemein.users.model.vo.PrimaryInfo;
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

}
