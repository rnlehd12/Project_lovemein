package bclass.finalproject.lovemein.users.model.service;

import java.util.HashMap;

import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Ideal;
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


}
