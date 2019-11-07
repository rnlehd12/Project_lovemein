package bclass.finalproject.lovemein.likes.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bclass.finalproject.lovemein.likes.model.service.LikesService;
import bclass.finalproject.lovemein.likes.model.vo.Likes;


@Controller
public class LikesController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikesController.class);
	
	@Autowired
	private LikesService likesService;
	

	
	/*찜목록뷰로 이동*/
	@RequestMapping("moveLikesList.do")
	public String MoveLikesListMethod() {
		return "likes/likeListView";
	}
	
	/*fromMediv용*/
	@RequestMapping(value="addfromMeList.do", method=RequestMethod.POST)
	public void addfromMeListMethod(@RequestParam("u_no_send") String senderNo, 
			@RequestParam(name="btn_val", required=false) String btn_val, HttpServletResponse response) throws IOException {
		int startRow = 1 + Integer.parseInt(btn_val);
		int endRow = startRow + 8;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("senderNo", senderNo);
		
		
		
		logger.info("addfromeMe메소드 실행 senderNo: " +senderNo +", endRow" + endRow );
		List<Likes> likeslist = new ArrayList<Likes>();
		likeslist = likesService.addfromMeListMethod(map);
		
		JSONObject fromJsonO = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Likes likes : likeslist) {
/*			u_no_send,  u_no_rec,  u_rec_name, 
			u_rec_profileImg, u_rec_age, u_rec_job, 
			u_rec_sch, u_rec_loc;*/
			
			JSONObject job = new JSONObject();
			
			job.put("u_no_send", likes.getU_no_send());
			job.put("u_no_rec", likes.getU_no_rec());
			job.put("u_rec_name", URLEncoder.encode(likes.getU_rec_name(), "utf-8"));
			job.put("u_rec_age", likes.getU_rec_age());
			job.put("u_rec_job", URLEncoder.encode(likes.getU_rec_job(), "utf-8"));
			job.put("u_rec_sch", URLEncoder.encode(likes.getU_rec_sch(), "utf-8"));
			job.put("u_rec_loc", URLEncoder.encode(likes.getU_rec_loc(), "utf-8"));
			//프로필이미지
			if(likes.getU_rec_profileImg() == null) {	
				job.put("u_rec_profile", URLEncoder.encode("nullProfile.png", "utf-8"));
			}else {	
				job.put("u_rec_profile", URLEncoder.encode(likes.getU_rec_profileImg(), "utf-8"));
			}
			
		/*	logger.info("addfromeMe 메소드 job 객체 저장 확인 " +job.toString());*/
			jarr.add(job);
		}
		
		/*logger.info("fromeMe 메소드 jarr 배열 저장 확인 " +jarr.toString());*/
		fromJsonO.put("list", jarr);
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(fromJsonO.toJSONString());
		out.flush();
		out.close();
		
	}  // fromMe찜리스트 추가 출력
	
	/*toMediv용*/
	@RequestMapping(value="fromMeList.do", method=RequestMethod.POST)
	public void fromMeListMethod(@RequestParam("u_no_send") String senderNo, 
			@RequestParam(name="btn_val", required=false) String btn_val, HttpServletResponse response) throws IOException {
		/* int startRow = 1 + Integer.parseInt(btn_val);
		int endRow = startRow + 9;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("senderNo", senderNo);
		*/
		///여기까지 수정
		
		logger.info("fromeMe메소드 실행, senderNo : " +senderNo);
		List<Likes> likeslist = new ArrayList<Likes>();
		likeslist = likesService.fromMeListMethod(senderNo);
		
		JSONObject fromJsonO = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Likes likes : likeslist) {
/*			u_no_send,  u_no_rec,  u_rec_name, 
			u_rec_profileImg, u_rec_age, u_rec_job, 
			u_rec_sch, u_rec_loc;*/
			
			JSONObject job = new JSONObject();
			
			job.put("u_no_send", likes.getU_no_send());
			job.put("u_no_rec", likes.getU_no_rec());
			job.put("u_rec_name", URLEncoder.encode(likes.getU_rec_name(), "utf-8"));
			job.put("u_rec_age", likes.getU_rec_age());
			job.put("u_rec_job", URLEncoder.encode(likes.getU_rec_job(), "utf-8"));
			job.put("u_rec_sch", URLEncoder.encode(likes.getU_rec_sch(), "utf-8"));
			job.put("u_rec_loc", URLEncoder.encode(likes.getU_rec_loc(), "utf-8"));
			//프로필이미지
			if(likes.getU_rec_profileImg() == null) {	
				job.put("u_rec_profile", URLEncoder.encode("nullProfile.png", "utf-8"));
			}else {	
				job.put("u_rec_profile", URLEncoder.encode(likes.getU_rec_profileImg(), "utf-8"));
			}
			
			/*logger.info("fromeMe 메소드 job 객체 저장 확인 " +job.toString());*/
			jarr.add(job);
		}
		
		/*logger.info("fromeMe 메소드 jarr 배열 저장 확인 " +jarr.toString());*/
		fromJsonO.put("list", jarr);
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(fromJsonO.toJSONString());
		out.flush();
		out.close();
		
	}  // toMe찜리스트 처음 출력
		



}
