package bclass.finalproject.lovemein.admin.model.service;

import java.util.HashMap;
import java.util.List;

import bclass.finalproject.lovemein.admin.model.vo.Notice;
import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Users;

//관리자 관련 service [최선혜]
public interface AdminService {

	/*회원관리*/
	int memberListCount();	
	List<AllUsers>memberList(HashMap<String, Object> map);
	AllUsers memberSelect(String u_no);
	int memberUpdate(Users users);
	int memberSearchListCount(HashMap<String, Object> mmap);
	List<AllUsers>memberSearchList(HashMap<String, Object> map);
	int memberDelete(String u_no);
	
	
	/*공지사항*/
	
	List<Notice> noticeList();
	int noticeListCount();
	Notice noticeSelect (String n_no);
	int noticeInsert (Notice notice);
	int noticeUpdate(Notice notice);
	int noticeDelete(String n_no);
	/*신고관리*/
	
	int reportListCount();
	List<Report>reportList (HashMap<String, Object> map);
	Report reportSelect (Report report);
	int reportResult (Report report);
	int reportSearchListCount(HashMap<String, Object> map);
	List<Report>reportSearchList (HashMap<String, Object> rmap);
	List<Report> reportYN(String r_no);
	
	
}
