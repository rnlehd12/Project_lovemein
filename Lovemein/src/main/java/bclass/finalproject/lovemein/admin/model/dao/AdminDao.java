package bclass.finalproject.lovemein.admin.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bclass.finalproject.lovemein.admin.model.vo.Notice;
import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Users;

//관리자 관련 DAO [최선혜]
@Repository("adminDao")
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/*회원관리*/
	public int memberListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.memberListCount");
	}

	public List<AllUsers> memberList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.memberList", map);
	}

	public AllUsers memberSelect(String u_no) {
		// 회원상세보기
		return sqlSession.selectOne("adminMapper.memberSelect", u_no);
	}

	public int memberUpdate(Users users) {
		// 회원수정
		return sqlSession.update("adminMapper.memberUpdate", users);
	}

	public int memberSearchListCount(HashMap<String, Object> mmap) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.memberSearchListCount",mmap);
	}
	
	public List<AllUsers> memberSearchList (HashMap<String, Object> map){
		
		return sqlSession.selectList("adminMapper.memberSearchList", map);
	}

	public int memberDelete(String u_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.memberDelete", u_no);
	}
	
	
	/*공지사항*/
	public List<Notice> noticeList(){
		return sqlSession.selectList("adminMapper.noticeList");
	}

	public Notice noticeSelect(String n_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.noticeSelect", n_no);
	}

	public int notceInsert(Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.noticeInsert", notice);
	}

	public int noticeUpdate(Notice notice) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.noticeUpdate", notice);
	}

	public int noticeDelete(String n_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.noticeDelete", n_no);
	}

	public int noticeListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.noticeListCount");
	}

	/*신고관리*/
	
	public int reportListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.reportListCount");
	}

	public List<Report> reportList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.reportList", map);
	}

	public Report reportSelect(Report report) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.reportSelect", report);
	}

	public int reportResult(Report report) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.reportResult", report);
	}

	public int reportSearchListCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.reportSearchListCount", map);
	}

	public List<Report> reportSearchList(HashMap<String, Object> rmap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.reportSearchList", rmap);
	}

	public  List<Report> reportYN(String r_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.reportYN", r_no);
	}
	
	
	
}
