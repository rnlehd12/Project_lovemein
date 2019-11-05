package bclass.finalproject.lovemein.users.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.users.model.dao.UsersDao;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Ideal;
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

}
