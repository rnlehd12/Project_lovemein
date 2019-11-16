package bclass.finalproject.lovemein.match.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.match.model.service.MatchService;
import bclass.finalproject.lovemein.match.model.vo.Match;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;

@Controller
public class MatchController {
	
	@Autowired
	private MatchService matchservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MatchController.class);
	

	/*match이동용 메소드*/
	@RequestMapping("match.do")
	public ModelAndView matchListMethod(ModelAndView mv, HttpSession logininfo, AllUsers loginUser) {
		logger.info("MatchMethod. loginSession정보 :" + logininfo.getAttribute("loginMember"));
		loginUser = (AllUsers)logininfo.getAttribute("loginMember");
		/*logger.info("loginUser정보 :" + loginUser.getU_email());*/
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", "");
		
		
		List<Match> matchList = new ArrayList<Match>();
		matchList = matchservice.matchListMethod(map);
		/*matchList = matchservice.matchListMethod(loginUser);
		*/
		
		mv.setViewName("match/matchListView");
		
		return mv;
	}


	
	
}
