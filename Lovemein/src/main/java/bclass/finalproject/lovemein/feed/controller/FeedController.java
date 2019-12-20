package bclass.finalproject.lovemein.feed.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.feed.model.service.FeedService;
import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedLike;
import bclass.finalproject.lovemein.feed.model.vo.FeedModiReply;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.likes.model.vo.TargetLikeCheck;

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
	
	//## 찜한 사람 목록 구하는 컨트롤러
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

	
	//## 피드 댓글 insert 컨트롤러
	@RequestMapping(value="insertReply.do", method=RequestMethod.POST)
	public String insertReplyMethod(FeedReply feedReply, ModelAndView mv) {
		
		
		  int result = feedService.insertReply(feedReply);
		  
		  if(result > 0) {

			  mv.setViewName("feed/myFeed");  
			  
		  }else {
			  
			  mv.addObject("failMessage", "댓글달기에 실패하였습니다. 다시 시도해주세요.");
			  mv.setViewName("feed/myFeed");  
		  }
		 
		
		return "redirect:redirectFeed.do" + "#feedContainer" + feedReply.getF_no();
	}
	
	//## 댓글삭제용 컨트롤러
	@RequestMapping("replyDel.do")
	public ModelAndView replyDelMethod(@RequestParam("fr_no") String param, ModelAndView mv) {
		
		int result = feedService.replyDel(param);
		
		if(result > 0) {
			
			mv.addObject("message", "삭제가 완료되었습니다.");
			mv.setViewName("JsonView");
		}
		
		return mv;
	}
	
	//## 댓글 수정용 컨트롤러
	@RequestMapping("replyModi.do")
	public String replyModiMethod(@RequestParam("fr_no") String fr_no, @RequestParam("fr_text") String fr_text, 
			FeedModiReply feedModiReply, ModelAndView mv) {
		
		feedModiReply.setFr_no(fr_no);
		feedModiReply.setFr_text(fr_text);
		
		int result = feedService.replyModi(feedModiReply);
		  
		if(result > 0) {
			
			mv.addObject("message", "댓글 수정이 완료되었습니다."); 
			mv.setViewName("JsonView"); 
			
		}else {
			
			
			mv.addObject("message", "댓글 수정에 실패하였습니다. 다시 시도해주세요."); 
			mv.setViewName("JsonView"); 
		}
		 
		
		return "redirect:redirectFeed.do";
	}
	
	//## 좋아요 삭제용 컨트롤러
	@RequestMapping("delLike.do")
	public ModelAndView delLike(@RequestParam("f_no") String f_no, @RequestParam("u_no") String u_no,
			FeedLike feedLike, ModelAndView mv) {
		
		feedLike.setF_no(f_no);
		feedLike.setU_no(u_no);
		
		int result = feedService.delLike(feedLike);
		
		if(result > 0) {
			
			mv.addObject("result", 1);
			
		}else {
			
			mv.addObject("result", 0);
		}
		
		mv.setViewName("JsonView");
		return mv;
	}
	
	//## 좋아요 추가용 컨트롤러
	@RequestMapping("plusLike.do")
	public ModelAndView plusLike(@RequestParam("f_no") String f_no, @RequestParam("u_no") String u_no,
			FeedLike feedLike, ModelAndView mv) {
		
		feedLike.setF_no(f_no);
		feedLike.setU_no(u_no);
		
		int result = feedService.plusLike(feedLike);
		
		if(result > 0) {
		
			mv.setViewName("JsonView");
		}
		
		return mv;
	}
	
	
	//## 피드 글쓰기용 컨트롤러
	@RequestMapping(value="insertFeed.do", method=RequestMethod.POST)
	public String insertFeedMethod(@RequestParam("flies") MultipartFile[] file, @RequestParam("f_text") String f_text, @RequestParam("f_tag") String f_tag,
			@RequestParam("u_no") String u_no,
			MultipartHttpServletRequest request, Feed feed) throws Exception {
		

		String uploadPath = request.getRealPath("resources/images/feedImages");
	    String fileOriginName = "";
	    String fileMultiName = "";
	    for(int i=0; i<file.length; i++) {
	        fileOriginName = file[i].getOriginalFilename();
	        System.out.println("기존 파일명 : "+fileOriginName);
	        SimpleDateFormat formatter = new SimpleDateFormat("YYYYMMDD_HHMMSS_"+i);
	        Calendar now = Calendar.getInstance();
	        
	        //확장자명
	        String extension = fileOriginName.split("\\.")[1];
	        
	        //fileOriginName에 날짜+.+확장자명으로 저장시킴.
	        fileOriginName = formatter.format(now.getTime())+"."+extension;
	        System.out.println("변경된 파일명 : "+fileOriginName);
	        
	        File f = new File(uploadPath+"\\"+fileOriginName);
	        file[i].transferTo(f);
	        if(i==0) { fileMultiName += fileOriginName; }
	        else{ fileMultiName += ","+fileOriginName; }
	    }
	    
	    feed.setF_text(f_text);
	    feed.setF_tag(f_tag);
	    feed.setF_img(fileMultiName);
	    feed.setU_no(u_no);
	    
	    int result = feedService.insertFeed(feed);
	    
	    return "redirect:redirectFeed.do";
	    
	}
	
	//## 피드글 삭제 컨트롤러
	@RequestMapping("feedDel.do")
	public ModelAndView feedDelMethod(@RequestParam("f_no") String f_no, ModelAndView mv) {
		
		int result = feedService.feedDel(f_no);
		
		if(result > 0) {
			
			mv.addObject("message", "글 삭제가 완료되었습니다.");
			mv.setViewName("JsonView");
		}
		
		return mv;
	}
	
	
	//## 상대피드 댓글 insert 컨트롤러
	@RequestMapping(value="insertReplyTarget.do", method=RequestMethod.POST)
	public ModelAndView insertReplyTargetMethod(FeedReply feedReply, @RequestParam("t_no") String t_no,
			ModelAndView mv) {
		
		  int result = feedService.insertReply(feedReply);
		 
		  if(result > 0){

			 mv.setViewName("redirect:goTargetFeed.do?u_no="+ t_no + "#feedContainer" + feedReply.getF_no());
			  
		  }else {
			  
			  mv.addObject("failMessage", "댓글달기에 실패하였습니다. 다시 시도해주세요.");
			  mv.setViewName("redirect:goTargetFeed.do?u_no="+ t_no + "#feedContainer" + feedReply.getF_no()); 
		  }
		 
		
		return mv;
	}
	
	//## 피드글 수정 컨트롤러
	@RequestMapping(value="updateFeed.do", method=RequestMethod.POST)
	public String updateFeedMethod(Feed feed) {
		
		int result = feedService.updateFeed(feed);
		
		return "redirect:redirectFeed.do";
	
	}
	
	// ## user찜 취소
	@RequestMapping(value="unLikeTarget.do")
	public ModelAndView unLikeTargetMethod(ModelAndView mv, @RequestParam("t_no") String t_no, @RequestParam("u_no") String u_no,
			 String targetUno, TargetLikeCheck targetchk) {
		
		if(t_no != null && u_no != null) {
			
			targetchk.setU_no(u_no);
			targetchk.setTarget_no(t_no);
			feedService.unLikeTarget(targetchk);
			mv.setViewName("redirect:goTargetFeed.do?u_no="+ t_no);
		}
		return mv;

	}

}

