package bclass.finalproject.lovemein.likes.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.likes.model.service.LikesService;
import bclass.finalproject.lovemein.likes.model.vo.Likes;



@Controller
public class LikesController {
	
	private static final Logger logger = LoggerFactory.getLogger(LikesController.class);
	
	@Autowired
	private LikesService likesService;
	

	
	/*찜목록뷰로 이동*/
	@RequestMapping("likesList.do")
	public String LikesListMethod() {
		return "likes/likeListView";
	}
	
	/*내가 찜한 찜리스트 fromMediv용*/
	@RequestMapping(value="addFromMeList.do", method=RequestMethod.POST)
	public void addFromMeListMethod(@RequestParam("u_no_send") String senderNo, 
			@RequestParam(name="btn_val", required=false) String btn_val, 
			HttpServletResponse response) throws IOException {
		int startRow = 1 + Integer.parseInt(btn_val);
		int endRow = startRow + 8;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("senderNo", senderNo);
		
		
		
//		logger.info("addfromeMe메소드 실행 senderNo: " +senderNo +", endRow" + endRow );
		List<Likes> likeslist = new ArrayList<Likes>();
		likeslist = likesService.addFromMeListMethod(map);
		
		JSONObject fromJsonO = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Likes likes : likeslist) {
/*			u_no_send,  u_no_rec,  u_rec_name, 
			u_rec_profileImg, u_rec_age, u_rec_job, 
			u_rec_sch, u_rec_loc;*/
			//logger.info(likes.toString());
			JSONObject job = new JSONObject();
			
			job.put("u_no_send", likes.getU_no_send());
			job.put("u_no_rec", likes.getU_no_rec());
			job.put("u_rec_name", URLEncoder.encode(likes.getU_rec_name(), "utf-8"));
			job.put("u_rec_age", likes.getU_rec_age());
			job.put("u_rec_job", URLEncoder.encode(likes.getU_rec_job(), "utf-8"));
			job.put("u_rec_sch", URLEncoder.encode(likes.getU_rec_sch(), "utf-8"));
			job.put("u_rec_loc", URLEncoder.encode(likes.getU_rec_loc(), "utf-8"));
			//하트
			job.put("u_type", likes.getU_type());
//			logger.info("addfrom의 send, rec, u_type:"+
//			likes.getU_no_send()+"," +likes.getU_no_rec()+"," + likes.getU_type());
			
			//프로필이미지
			if(likes.getU_rec_profileImg() == null) {	
				job.put("u_rec_profile", URLEncoder.encode("nullprofile2.png", "utf-8"));
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
	
	/*나를 찜한 찜리스트 toMediv용*/
	@RequestMapping(value="addToMeList.do", method=RequestMethod.POST)
	public void addToMeListMethod(@RequestParam("u_no_rec") String receiverNo, 
			@RequestParam(name="btn_val", required=false) String btn_val, HttpServletResponse response) throws IOException {
		int startRow = 1 + Integer.parseInt(btn_val);
		int endRow = startRow + 8;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("receiverNo", receiverNo);

//		logger.info("addToMe메소드 실행 receiverNo: " +receiverNo +", endRow" + endRow );
		List<Likes> likeslist = new ArrayList<Likes>();
		likeslist = likesService.addToMeListMethod(map);
		
		JSONObject fromJsonO = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Likes likes : likeslist) {
/*			u_no_rec,  u_no_send,  u_send_name, 
			u_send_profileImg, u_send_age, u_send_job, 
			u_send_sch, u_send_loc, u_type ;*/ // toMe찜리스트
			JSONObject job = new JSONObject();
			
			job.put("u_no_send", likes.getU_no_send());
			job.put("u_no_rec", likes.getU_no_rec());
			job.put("u_send_name", URLEncoder.encode(likes.getU_send_name(), "utf-8"));
			job.put("u_send_age", likes.getU_send_age());
			job.put("u_send_job", URLEncoder.encode(likes.getU_send_job(), "utf-8"));
			job.put("u_send_sch", URLEncoder.encode(likes.getU_send_sch(), "utf-8"));
			job.put("u_send_loc", URLEncoder.encode(likes.getU_send_loc(), "utf-8"));
			//하트
			job.put("u_type", likes.getU_type());
/*			if(likes.getU_type() == null) {
				job.put("u_type", URLEncoder.encode("♡", "utf-8"));
			}else{
				job.put("u_type", URLEncoder.encode("♥", "utf-8"));
			}*/
//			logger.info("addto의 send, rec, u_type:"+
//					likes.getU_no_send()+"," +likes.getU_no_rec()+"," + likes.getU_type());
//			logger.info("addto메소드의 u_type 확인" + likes.getU_type());
			
			//프로필이미지
			if(likes.getU_send_profileImg() == null) {	
				job.put("u_send_profile", URLEncoder.encode("nullProfile.png", "utf-8"));
			}else {	
				job.put("u_send_profile", URLEncoder.encode(likes.getU_send_profileImg(), "utf-8"));
			}
			
		/*	logger.info("addTomeMe 메소드 job 객체 저장 확인 " +job.toString());*/ // toMe찜리스트
			jarr.add(job);
		}
		
		/*logger.info("toeMe 메소드 jarr 배열 저장 확인 " +jarr.toString());*/ // toMe찜리스트
		fromJsonO.put("list", jarr);
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		// toMe찜리스트
		out.println(fromJsonO.toJSONString());
		out.flush();
		out.close();
		
	}   // toMe찜리스트 처음 출력
		
	/*찜추가*/
	@RequestMapping(value="insertLikes.do", method=RequestMethod.POST)
	public ModelAndView insertLikesMethod(Likes likes, ModelAndView mv){
//		logger.info("insertLikes controller옴"+ likes.getU_no_rec()+ likes.getU_no_send());
//		if처리 안한다면 
//		m.addAttribute("result", likesService.insertLikesMethod(loginNo));
		int result = likesService.insertLikesMethod(likes);
		if(result > 0) {
//			logger.info("insertLiskes에서 result값 받아옴. result : " + result);
			mv.addObject("result", result);
			mv.setViewName("JsonView");
			//m.addAttribute("result", result);
		} else	{
			logger.info("insertLiskes에서 result값 못받아옴");
		}			
		return mv;
	}

	/*찜삭제*/
	@RequestMapping(value="deleteLikes.do", method=RequestMethod.POST)
	public ModelAndView deleteLikesMethod(Likes likes, ModelAndView mv) {
		logger.info("deleteLikes controller옴"+ likes.getU_no_rec()+ likes.getU_no_send());
		int result = likesService.deleteLikesMethod(likes);
		if(result >0) {
			logger.info("insertLiskes에서 result값 받아옴. result : " + result);
			mv.addObject("result", result);
			mv.setViewName("JsonView");
		} else {
			logger.info("deleteLikes에서 result 값 못받아옴");
		}
		return mv;
	}
		
}
