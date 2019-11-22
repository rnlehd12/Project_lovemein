package bclass.finalproject.lovemein.match.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import bclass.finalproject.lovemein.match.model.service.MatchService;
import bclass.finalproject.lovemein.match.model.vo.Match;

@Controller
public class MatchController {
	
	@Autowired
	private MatchService matchService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MatchController.class);
	

	/*match이동용 메소드*/
	@RequestMapping("moveMatch.do")
	public String moveMatchMethod(){
		return "match/matchListView";
	}
	
	@RequestMapping("Match.do")
	public void matchListMethod(
			@RequestParam("login_no") String loginNo, 
			@RequestParam("btNum") String plusNum,
			HttpServletResponse response) throws IOException {
		//유저정보
		logger.info("MatchMethod. loginSession정보 :" + loginNo);
		//loginUserInfo = usersService.targetUserInfo(loginNo);
		//더보기페이징
		int startRow = 1 + Integer.parseInt(plusNum); // 한 페이지 출력 수
		int endRow = startRow + 8;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("loginNo", loginNo);
		
		List<Match> matchList = new ArrayList<Match>();
		matchList = matchService.matchListMethod(map);
		
		JSONObject jsono = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Match match : matchList) {
			logger.info(match.toString());
			JSONObject job = new JSONObject();
			/*String my_no, String mat_no, String mat_name, 
			String mat_prof, int mat_age, String mat_job,
			String mat_loc, int mat_height, String mat_sch*/
			//JSONObject에 vo변수 하나씩 넣기
			job.put("mat_no", match.getMat_no());
			job.put("mat_name",  URLEncoder.encode(match.getMat_name(), "utf-8"));
			
			//프로필이미지
			if(match.getMat_prof() == null) {	
				job.put("mat_prof", URLEncoder.encode("nullprofile2.png", "utf-8"));
			}else {	
				job.put("mat_prof", URLEncoder.encode(match.getMat_prof(), "utf-8"));
			}
			
			job.put("mat_age", match.getMat_age());
			job.put("mat_job", URLEncoder.encode(match.getMat_job(), "utf-8"));
			job.put("mat_loc", URLEncoder.encode(match.getMat_loc(), "utf-8"));
			job.put("mat_height", match.getMat_height());
			job.put("mat_sch", URLEncoder.encode(match.getMat_sch(), "utf-8"));
			job.put("listcount", match.getListcount());
			logger.info(job.toString());
			//JSONObject들(vo 하나)을 JSONArray 안에 넣기
			jarr.add(job);
		} 
		//JSONArray를(vo여러개) 다시 JSONObject에 넣기
		jsono.put("list", jarr);
		
		response.setContentType("application/json; charset=utf-8"); 
		PrintWriter out = response.getWriter();
		
		out.println(jsono.toJSONString());
		out.flush();
		out.close();
		
	}


/*	public ModelAndView matchListMethod(ModelAndView mv, HttpSession logininfo, AllUsers loginUser) {
		logger.info("MatchMethod. loginSession정보 :" + logininfo.getAttribute("loginMember"));
		loginUser = (AllUsers)logininfo.getAttribute("loginMember");
		logger.info("loginUser정보 :" + loginUser.getU_email());
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", "");
		List<Match> matchList = new ArrayList<Match>();
		matchList = matchservice.matchListMethod(map);
		matchList = matchservice.matchListMethod(loginUser);
		
		mv.setViewName("match/matchListView");
		return mv;
	}*/
	
}
