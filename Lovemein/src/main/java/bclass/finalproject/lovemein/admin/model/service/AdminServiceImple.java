package bclass.finalproject.lovemein.admin.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bclass.finalproject.lovemein.admin.model.dao.AdminDao;
import bclass.finalproject.lovemein.admin.model.vo.Notice;
import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Users;

//관리자 관련 service [최선혜]
@Service("adminService")
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	
	/*회원관리*/
	@Override
	public int memberListCount() {
		
		return adminDao.memberListCount();
	}	
	
	@Override
	public List<AllUsers>memberList(HashMap<String, Object> map){
		
		return adminDao.memberList(map);
	}
	
	@Override
	public AllUsers memberSelect(String u_no) {
		
		return adminDao.memberSelect(u_no);
	}
	
	
	@Override
	public int memberUpdate(Users users) {
		
		return adminDao.memberUpdate(users);
	}
	@Override
	public List<AllUsers>memberSearchList(HashMap<String, Object> map){
		
		return adminDao.memberSearcchList(map);
	}
	
	@Override
	public	int memberSearchListCount(String search) {
		return adminDao.memberSearchListCount(search);
	}

	@Override
	public int memberDelete(String u_no) {
		return adminDao.memberDelete(u_no);
	}
	
	/*공지관리*/


	@Override
	public List<Notice> noticeList(){
		return adminDao.noticeList();
	}
	
	@Override
	public int noticeSelect(String n_no) {
		return adminDao.noticeSelect(n_no);
	}
	
	@Override
	public int noticeInsert(Notice notice) {
		return adminDao.notceInsert(notice);
	}
	
	@Override
	public 	int noticeUpdate(Notice notice) {
		return adminDao.noticeUpdate(notice);
	}
	
	@Override
	public int noticeDelete(String n_no) {
		return adminDao.noticeDelete(n_no);
	}
	
	
	
	/*신고관리*/


	@Override
	public 	int reportListCount() {
		return adminDao.reportListCount();
	}
	

	@Override
	public List<Report>reportList (HashMap<String, Object> map){
		return adminDao.reportList(map);
	}


	@Override
	public Report reportSelect (Report report) {
		return adminDao.reportSelect(report);
	}

	@Override
	public int reportResult(Report report) {
		return adminDao.reportResult(report);
	}

	@Override
	public int reportSearchListCount(Report report) {
		return adminDao.reportSearcgListCount(report);
	}

	@Override
	public List<Report>reportSearcchList(HashMap<String, Object> map){
		return adminDao.reportSearcchList(map);
	}





}
