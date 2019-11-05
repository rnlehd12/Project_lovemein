package bclass.finalproject.lovemein.feed.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.feed.model.service.FeedService;
import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;

//피드 Controller by 귀정
@Controller
public class FeedController {
	
	@Autowired
	private FeedService feedService;
	
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	//## 마이피드 이동용 컨트롤러
	@RequestMapping("goFeed.do")
	public String goFeedMethod() {
	
		return "feed/myFeed";
	}
	
	//## 찜한사람 수 구하는 컨트롤러
	@RequestMapping("sendCount.do")
	public ModelAndView sendCount(@RequestParam("u_no_send") String param, ModelAndView mv) 
			   throws ParseException, org.json.simple.parser.ParseException, UnsupportedEncodingException {
	      
		  int count = feedService.likeCount(param);
		  
		  mv.addObject("likecount",count);
		  mv.setViewName("JsonView");
	      return mv;
	}
	   
	@RequestMapping("sendLikeList.do")
	public void sendLikeList(@RequestParam("u_no_send") String param, HttpServletResponse response) 
			   throws IOException {
	      
	  List<Likes> likeList = new ArrayList<Likes>();
	  likeList = feedService.sendLikeList(param);
	 
		JSONObject sendJson = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Likes likes : likeList) {
		
			JSONObject job = new JSONObject();
			
			job.put("u_no_send", likes.getU_no_send());
			job.put("u_no_rec", likes.getU_no_rec());
			job.put("u_rec_name", URLEncoder.encode(likes.getU_rec_name(), "utf-8"));
			
			//프로필이미지 null값일 시
			if(likes.getU_rec_profileImg() == null) {
				
				job.put("u_rec_profile", URLEncoder.encode("nullProfile.png", "utf-8"));
			
			}else {
				
				job.put("u_rec_profile", URLEncoder.encode(likes.getU_rec_profileImg(), "utf-8"));
			}
			
			jarr.add(job);
		}
		
		sendJson.put("list", jarr);
			
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
      
	}

	
	//##피드 댓글 insert 컨트롤러
	@RequestMapping(value="insertReply.do", method=RequestMethod.POST)
	public String insertReplyMethod(FeedReply feedReply, ModelAndView mv) {
		
		
		  int result = feedService.insertReply(feedReply);
		  
		  if(result > 0) {

			  mv.setViewName("feed/myFeed");  
			  
		  }else {
			  
			  mv.addObject("failMessage", "댓글달기에 실패하였습니다. 다시 시도해주세요.");
			  mv.setViewName("feed/myFeed");  
		  }
		 
		
		return "redirect:redirectFeed.do";
	}
}

