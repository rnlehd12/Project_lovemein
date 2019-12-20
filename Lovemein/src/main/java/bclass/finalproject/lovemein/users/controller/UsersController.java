package bclass.finalproject.lovemein.users.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Random;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bclass.finalproject.lovemein.admin.model.vo.Report;
import bclass.finalproject.lovemein.admin.model.vo.UserReport;
import bclass.finalproject.lovemein.feed.model.service.FeedService;
import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedLike;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.feed.model.vo.ReplyTimes;
import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.payment.model.service.PaymentService;
import bclass.finalproject.lovemein.payment.model.vo.Payment;
import bclass.finalproject.lovemein.recent_search.vo.RecentSearch;
import bclass.finalproject.lovemein.likes.model.vo.TargetLikeCheck;
import bclass.finalproject.lovemein.users.model.service.UsersService;
import bclass.finalproject.lovemein.users.model.vo.AddInfo;
import bclass.finalproject.lovemein.users.model.vo.AllUsers;
import bclass.finalproject.lovemein.users.model.vo.Ideal;
import bclass.finalproject.lovemein.users.model.vo.PrimaryInfo;
import bclass.finalproject.lovemein.users.model.vo.Style;
import bclass.finalproject.lovemein.users.model.vo.Users;

//회원기능 관련 Controller by 귀정
@Controller
public class UsersController {

	@Autowired
	private UsersService userService;

	@Autowired
	private FeedService feedService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@Autowired
	private PaymentService paymentService;

	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	
	

	// 회원가입 저장용 맵 필드선언
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	//로그인한 유저정보 세션 저장용
	AllUsers loginMember = null;
	
	ArrayList<RecentSearch> rsList = new ArrayList<RecentSearch>();
	
	// ##로그인용 컨트롤러
	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST)
	public ModelAndView loginMethod(Users users, AllUsers allusers, HttpSession session, HttpServletRequest request,
			ModelAndView mv) {

		loginMember = userService.loginCheck(users.getU_email());

		if (loginMember != null && bcryptPasswordEncoder.matches(users.getU_pw(), loginMember.getU_pw())) {

		  // 관리자 로그인처리
		  if(loginMember.getU_email().equals("admin@lovemein.com")) {
		 
			  mv.setViewName("admin/adminMain");
			  session.setAttribute("loginMember", loginMember);	  
		  
		  }else {	//일반회원 로그인처리
		  
			  session.setAttribute("loginMember", loginMember);
			  
			  //헤더 검색내역 리스트 불러옴
			  try {
				  
				 rsList = (ArrayList<RecentSearch>)userService.historyList(loginMember.getU_no());
				  
			  } catch (NullPointerException e) {
					
				  mv.setViewName("users/login");
			  }
			 
			  
			  if(rsList.size() > 0) {
				  
				  //리스트 정렬 시작
				  TreeMap<Integer, RecentSearch> tm = new TreeMap<Integer, RecentSearch>();
				  for(RecentSearch r: rsList) {
					 
					  map.put(Integer.toString(r.getRownum()), r);
				  }
				  
				  //내림차순정렬
				  Iterator<Integer> it = tm.descendingKeySet().iterator(); 
				  while (it.hasNext()){
					  
				      int key = it.next();
				      rsList.clear();
				      rsList.add(tm.get(key));
				  }
				  
				  session.setAttribute("searchHistory", rsList);
				  
			  }else {
				  
				  session.setAttribute("notSearchMsg", "최근 검색기록이 없습니다.");
			  }
			  mv.setViewName("redirect:redirectFeed.do");
		  
		  }

		} else {

			request.setAttribute("message", "아이디 또는 패스워드가 일치하지 않습니다. 다시시도하세요.");
			mv.setViewName("users/login");
		}

		return mv;
	}

	// ##마이피드 재호출용 컨트롤러★★★★★★★★★★★★★★★
	@RequestMapping("redirectFeed.do")
	public ModelAndView redirectFeed(ModelAndView mv) throws ParseException {

		mv.setViewName("feed/myFeed");

		try {
			
			// 피드 리스트 출력
			List<Feed> feedList = new ArrayList<Feed>();
			feedList = feedService.myFeedList(loginMember.getU_no());
			
			// 피드 좋아요수 출력
			List<Feed> feedLikeCnt = new ArrayList<Feed>();
			feedLikeCnt = feedService.feedLikeMethod(loginMember.getU_no());
			
			// 피드 댓글수 출력
			List<Feed> feedReplyCnt = new ArrayList<Feed>();
			feedReplyCnt = feedService.feedReplyMethod(loginMember.getU_no());
			
			// 피드댓글리스트 출력
			List<FeedReply> feedReplyList = new ArrayList<FeedReply>();
			feedReplyList = feedService.feedReplyListMethod(loginMember.getU_no());
			
			//댓글 시간계산 시작!
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			java.util.Date d1 = new java.util.Date();	//오늘 날짜 받기
			String today = sdf.format(d1);	//오늘 날짜 형식변환후 String형으로 저장
			String[] daysStr = new String[feedReplyList.size()];	//댓글 시간 받을 String배열 선언
			java.util.Date replyDate[] = new java.util.Date[feedReplyList.size()];
			java.util.Date toDate = sdf.parse(today);
			
			//view로 보낼 댓글 시간용 ArrayList 선언
			List<ReplyTimes> rtList = new ArrayList<ReplyTimes>();
			
			for(int i =0; i<feedReplyList.size(); i++) {
				
				daysStr[i] = sdf.format(feedReplyList.get(i).getFr_date());	//날짜 변환 후 배열 저장
				replyDate[i] = sdf.parse(daysStr[i]);
				long diff = toDate.getTime() - replyDate[i].getTime();	//현재날짜에서 댓글 시간 계산
				
				int sec = (int) (diff / 1000) % 60 ;         //초
				int min = (int) ((diff / (1000*60)) % 60);  //분
				int hour   = (int) ((diff / (1000*60*60)) % 24);//시
				int days   = (int) ((diff / (1000*60*60*24)) % 24);	//날짜
				
				//ArrayList에 담을 객체 선언
				ReplyTimes rtObj = new ReplyTimes();
				rtObj.setF_no(feedReplyList.get(i).getF_no());
				rtObj.setFr_no(feedReplyList.get(i).getFr_no());
				
				if(days > 0) {	//댓글이 하루이상 지났을 때
					
					rtObj.setFr_date_msg(days + "일 전");
				
				}else if(days==0 && hour>0 && hour<24 ){
					
					rtObj.setFr_date_msg(hour + "시간 전");
					
				}else if(hour==0 && min>0 && min<60) {
					
					rtObj.setFr_date_msg(min + "분 전");
					
				}else {
					
					rtObj.setFr_date_msg("방금전");
				}
				
				rtList.add(rtObj);	//저장
			
			}
		
			
			//// 내가 좋아요한 글 처리표시
			List<Feed> feedLikeChk = new ArrayList<Feed>();
			feedLikeChk = feedService.feedLikeChkMethod(loginMember.getU_no());
		
			if(feedList.size() > 0) {
				
				mv.addObject("feed_list", feedList);
				mv.addObject("feed_like_cnt", feedLikeCnt);
				mv.addObject("feed_reply_cnt", feedReplyCnt);
				mv.addObject("feed_Reply_List", feedReplyList);
				mv.addObject("feed_Like_Chk", feedLikeChk);
				mv.addObject("rtList", rtList);
				
			}else {	//피드가 없을시에 실행
				
				mv.addObject("nullMessage","등록된 피드가 없습니다. 첫 글을 등록해보세요!");
			}
			
		} catch (NullPointerException e) {
			
			
			mv.setViewName("users/login");
			
		}
		
		
		return mv;

	}

	private ReplyTimes setFr_no(String fr_no) {
		// TODO Auto-generated method stub
		return null;
	}

	// ##로그아웃용 컨트롤러
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request) {

		HttpSession session = request.getSession(false);

		if (session != null) {
			
			session.setAttribute("loginMember", null);
			session.invalidate();
			
		}
		return "users/login";
	}

	// ##회원가입페이지 이동용 컨트롤러
	@RequestMapping("gojoinStep1.do")
	public String gojoinStep1() {

		return "users/join1";
	}

	// ##핸드폰번호를 가지고 스텝2로 이동하는 컨트롤러
	@RequestMapping("gojoinStep2.do")
	public ModelAndView gojoinStep2(@RequestParam("u_phone") String u_phone, ModelAndView mv) {

		if (u_phone != null) {

			mv.addObject("u_phone", u_phone);
			mv.setViewName("users/join2");
		}

		return mv;
	}

	// ##users 테이블에 저장용 컨트롤러 스텝2에서 다음단계버튼을 눌렀을때 실행됨
	@RequestMapping(value = "gojoinStep2ok.do")
	public String gojoinStep2ok(Users users) {

		String returnView = "users/login";

		// 패스워드 암호화 처리
		String password = users.getU_pw();
		users.setU_pw(bcryptPasswordEncoder.encode(password));

		int result = userService.joinUsersService(users);

		if (result > 0) {

			returnView = "users/join3";

		}

		return returnView;

	}

	// ##step3에서 추가정보(primaryinfo, addinfo) 테이블 저장용컨트롤러 step4로 이동함.
	@RequestMapping(value = "gojoinStep4.do", method = RequestMethod.POST)
	public String gojoinStep4(PrimaryInfo pinfo, AddInfo ainfo, @RequestParam("years") String years,
			@RequestParam("months") String months, @RequestParam("days") String days) throws ParseException {

		// 날짜 변환 후 setter
		String birth = years + "-" + months + "-" + days;
		pinfo.setU_birth(Date.valueOf(birth));

		map.put("primary", pinfo);
		map.put("add", ainfo);

		return "users/join4";
	}

	// ##테이블 저장 후 step5(이상형 설정페이지) 이동용 컨트롤러
	@RequestMapping(value = "gojoinStep5.do", method = RequestMethod.POST)
	public String gojoinStep5(Style style) {

		String returnView = "users/login";

		map.put("style", style);
		
		int result = userService.joinService(map);

		if (result > 0) {

			returnView = "users/join5";

		}

		return returnView;
	}

	// ##이상형 테이블 저장용 컨트롤러 저장후 로그인페이지로 이동함
	@RequestMapping("step5ok.do")
	public String idealSaveMethod(Ideal ideal, @RequestParam("age") int age) {

		String returnView = "users/login";
		ideal.setAge(age);
		System.out.println(ideal.toString());
		int result = userService.idealSave(ideal);

		if (result > 0) {

			returnView = "users/login";

		}
		return returnView;
	}

	// ##아이디 찾기 컨트롤러(ajax)
	@RequestMapping("checkId.do")
	@ResponseBody
	public ModelAndView findId(@RequestBody String param, Users users, ModelAndView mv)
			throws ParseException, org.json.simple.parser.ParseException, UnsupportedEncodingException {

		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject) jparser.parse(param);
		String findid = (String) job.get("email");

		users = userService.checkId(findid);

		if (users != null) {

			mv.addObject("message", URLEncoder.encode(users.getU_name() + "님으로 이미 가입된 계정입니다.", "utf-8"));
			mv.setViewName("JsonView");

		} else {

			mv.addObject("message", URLEncoder.encode("가입되지 않은 계정입니다.", "utf-8"));
			mv.setViewName("JsonView");
		}
		return mv;
	}

	// ##임시비밀번호 전송 컨트롤러(ajax)
	@RequestMapping("checkPw.do")
	@ResponseBody
	public ModelAndView findPw(@RequestBody String param, Users users, ModelAndView mv, Users userFindPwd)
			throws ParseException, org.json.simple.parser.ParseException, UnsupportedEncodingException {

		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject) jparser.parse(param);
		String findPw = (String) job.get("phone");

		users = userService.checkPw(findPw);

		if (users != null) {

			mv.addObject("message", URLEncoder.encode("해당번호로 임시비밀번호를 발송하였습니다.", "utf-8"));
			mv.setViewName("JsonView");

			String api_key = "NCSUDLKISOTXKF5N";
			String api_secret = "WTBIU2WGCT6IHVAKVG2KEGNQJ7QZCY1M";
			Message coolsms = new Message(api_key, api_secret);

			// 임시비밀번호 생성
			Random random = new Random();
			String pwdstr = "";
			int AuthNum = random.nextInt(999999);
			String[] str = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
					"s", "t", "u", "v", "w", "x", "y", "z", "!", "@", "#", "$", "%", "^" };
			for (int i = 0; i < 5; i++) {

				int n = (int) (Math.random() * 25);
				pwdstr += str[n];
			}

			String pwd = pwdstr + AuthNum;

			// 바뀐비밀번호 암호화처리해서 DB 업데이트
			userFindPwd.setU_pw(bcryptPasswordEncoder.encode(pwd));
			userFindPwd.setU_phone(findPw);

			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", findPw);
			params.put("from", "01022479633");
			params.put("type", "SMS");
			params.put("text", "럽미인 임시비밀번호는 [" + pwd + "]입니다."); // 문자내용
			params.put("app_version", "JAVA SDK v1.2");

			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}

			int result = userService.changePw(userFindPwd);

			if (result > 0) {

				logger.info("비밀번호바꾸기 성공함.");
				logger.info("임시비밀번호 : " + pwd);

			} else {
				logger.info("비밀번호 변경 실패");
			}

		} else {

			mv.addObject("message", URLEncoder.encode("해당 휴대폰번호가 가입되어 있지않습니다.", "utf-8"));
			mv.setViewName("JsonView");
		}
		return mv;
	}

	// ## 회원정보수정 페이지 이동용 컨트롤러
	@RequestMapping("myInfo.do")
	public String myInfoMethod() {

		return "users/myInfo";
	}

	// ## 계정정보수정 tab1 컨트롤러
	@RequestMapping("accountInfo.do")
	public String accountInfoMethod(Users users, HttpSession session) {

		String password = users.getU_pw();
		users.setU_pw(bcryptPasswordEncoder.encode(password));

		userService.accountInfoModi(users);

		// 변경한 값으로 세션값 세팅
		if (users.getU_name() != null) {

			loginMember.setU_name(users.getU_name());
		}

		if (users.getU_intro() != null) {

			loginMember.setU_intro(users.getU_intro());
		}

		return "redirect:redirectFeed.do"; // 피드재호출
	}

	// ## 계정정보수정 tab2 컨트롤러
	@RequestMapping("primaryInfo.do")
	public String primaryInfoMethod(PrimaryInfo pinfo) {
		
		userService.primaryInfo(pinfo);

		// 변경한 값으로 세션값 세팅
		if (pinfo.getU_loc() != null) {

			loginMember.setU_loc(pinfo.getU_loc());
		}

		if (pinfo.getU_edu() != null) {

			loginMember.setU_edu(pinfo.getU_edu());
		}

		if (pinfo.getU_shcool() != null) {

			loginMember.setU_shcool(pinfo.getU_shcool());
		}

		if (pinfo.getU_job() != null) {

			loginMember.setU_job(pinfo.getU_job());
		}

		if (pinfo.getU_weight() != null) {

			loginMember.setU_weight(pinfo.getU_weight());
		}

		loginMember.setU_height(pinfo.getU_height());

		return "redirect:redirectFeed.do"; // 피드재호출
	}
	
	// ## 계정정보수정 tab3 컨트롤러
	@RequestMapping("addInfo.do")
	public String primaryInfoMethod(AddInfo ainfo) {
		
		userService.addInfo(ainfo);
		
		// 변경한 값으로 세션값 세팅
		if (ainfo.getU_blood() != null) {

			loginMember.setU_blood(ainfo.getU_blood());
		}

		if (ainfo.getU_char() != null) {

			loginMember.setU_char(ainfo.getU_char());
		}

		if (ainfo.getU_rei() != null) {

			loginMember.setU_rei(ainfo.getU_rei());
		}
		
		loginMember.setU_smoking(ainfo.getU_smoking());
		loginMember.setU_drinking(ainfo.getU_drinking());
		
		return "redirect:redirectFeed.do"; // 피드재호출
	}
	
	// ##스타일 정보수정 tab4  컨트롤러
	@RequestMapping(value="stylemodi.do", method=RequestMethod.POST)
	public String styleInfoMethod(Style style) {
		
		  userService.StyleInfo(style);
		  
		  loginMember.setS_appeal(style.getS_appeal());
		  loginMember.setS_inter(style.getS_inter());
		  loginMember.setS_ls(style.getS_ls()); loginMember.setS_ds(style.getS_ds());
		 
		
		return "redirect:redirectFeed.do"; // 피드재호출
		
	}
	
	// ##이상형 정보수정 tab5 컨트롤러
	@RequestMapping(value="idealmodi.do", method=RequestMethod.POST)
	public String idealModiMethod(Ideal ideal) {
		
		int result = userService.idealModi(ideal);
		
		if(result > 0) {
			
			loginMember.setI_age(ideal.getI_age());
			loginMember.setI_loc(ideal.getI_loc());
			loginMember.setI_edu(ideal.getI_edu());
			loginMember.setI_height(ideal.getI_height());
			loginMember.setI_weight(ideal.getI_weight());
		}
		return "redirect:redirectFeed.do"; // 피드재호출 
	}
	
	//## 상대방 피드 이동용 컨트롤러
	@RequestMapping("goTargetFeed.do")
	public ModelAndView goTargetFeedMethod(@RequestParam("u_no") String u_no, ModelAndView mv, AllUsers allUsers,
			TargetLikeCheck targetChk, TargetLikeCheck target, TargetLikeCheck targetLikeCheck) throws ParseException {

		// 이동하려는 피드 회원번호가 세션 회원번호랑 같을시 자신의 피드 재호출함.
		if (loginMember.getU_no().equals(u_no)) {

			mv.setViewName("redirect:redirectFeed.do");

		} else { // 아닐시 상대 피드로 이동.

			allUsers = userService.targetUserInfo(u_no);

			mv.addObject("targetUser", allUsers);
			mv.setViewName("feed/targetFeed");
			
			// 피드 리스트 출력
			List<Feed> feedList = new ArrayList<Feed>();
			feedList = feedService.myFeedList(u_no);
			if (feedList.size() > 0) {
				
				mv.addObject("feed_list", feedList);
			} else {

				mv.addObject("message", "님의 게시물이 존재하지않습니다.");
			}
			// 피드 좋아요수 출력
			List<Feed> feedLikeCnt = new ArrayList<Feed>();
			feedLikeCnt = feedService.feedLikeMethod(u_no);

			mv.addObject("feed_like_cnt", feedLikeCnt);

			// 피드 댓글수 출력
			List<Feed> feedReplyCnt = new ArrayList<Feed>();
			feedReplyCnt = feedService.feedReplyMethod(u_no);

			mv.addObject("feed_reply_cnt", feedReplyCnt);

			// 피드댓글리스트 출력
			List<FeedReply> feedReplyList = new ArrayList<FeedReply>();
			feedReplyList = feedService.feedReplyListMethod(u_no);
			
			mv.addObject("feed_Reply_List", feedReplyList);
			
			//댓글 시간계산 시작!
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.KOREA);
			java.util.Date d1 = new java.util.Date();	//오늘 날짜 받기
			String today = sdf.format(d1);	//오늘 날짜 형식변환후 String형으로 저장
			String[] daysStr = new String[feedReplyList.size()];	//댓글 시간 받을 String배열 선언
			java.util.Date replyDate[] = new java.util.Date[feedReplyList.size()];
			java.util.Date toDate = sdf.parse(today);
			
			//view로 보낼 댓글 시간용 ArrayList 선언
			List<ReplyTimes> rtList = new ArrayList<ReplyTimes>();
			
			for(int i =0; i<feedReplyList.size(); i++) {
				
				daysStr[i] = sdf.format(feedReplyList.get(i).getFr_date());	//날짜 변환 후 배열 저장
				replyDate[i] = sdf.parse(daysStr[i]);
				long diff = toDate.getTime() - replyDate[i].getTime();	//현재날짜에서 댓글 시간 계산
				
				int sec = (int) (diff / 1000) % 60 ;         //초
				int min = (int) ((diff / (1000*60)) % 60);  //분
				int hour   = (int) ((diff / (1000*60*60)) % 24);//시
				int days   = (int) ((diff / (1000*60*60*24)) % 24);	//날짜
				
				//ArrayList에 담을 객체 선언
				ReplyTimes rtObj = new ReplyTimes();
				rtObj.setF_no(feedReplyList.get(i).getF_no());
				rtObj.setFr_no(feedReplyList.get(i).getFr_no());
				
				if(days > 0) {	//댓글이 하루이상 지났을 때
					
					rtObj.setFr_date_msg(days + "일 전");
				
				}else if(days==0 && hour>0 && hour<24 ){
					
					rtObj.setFr_date_msg(hour + "시간 전");
					
				}else if(hour==0 && min>0 && min<60) {
					
					rtObj.setFr_date_msg(min + "분 전");
					
				}else {
					
					rtObj.setFr_date_msg("방금전");
				}
				
				rtList.add(rtObj);	//저장
			
			}
			
			mv.addObject("rtList", rtList);
		
			// 내가 좋아요한 글 처리표시
			List<Feed> feedLikeChkTarget = new ArrayList<Feed>();
			targetChk.setU_no(loginMember.getU_no());
			targetChk.setTarget_no(u_no);
			feedLikeChkTarget = feedService.feedLikeChkTarget(targetChk);

			mv.addObject("feed_Like_Chk", feedLikeChkTarget);
			
			//내가 상대를 찜했는지 여부 확인 처리
			target.setU_no(loginMember.getU_no());
			target.setTarget_no(u_no);
			targetLikeCheck = feedService.targetLikeCheck(target);
			
			mv.addObject("userLikeChk", targetLikeCheck);
			
		}

		return mv;
	}

	//결제 성공 DB에 추가
	@RequestMapping("paySuccess.do")
	public ModelAndView paySuccessMethod(HttpSession session, ModelAndView mv, @RequestParam("u_no") String u_no,
			@RequestParam("p_price") int p_price, @RequestParam("p_coin") int p_coin) {

		// 받아온 requestParam Vo에 저장
		Payment payment = new Payment();

		payment.setU_no(u_no);
		payment.setP_price(p_price);
		payment.setP_coin(p_coin);

		// payment테이블에 결제정보 추가하는 서비스
		int result = paymentService.paySuccess(payment);
		System.out.println(result);

		// user테이블에 coin 정보 추가하는 서비스
		int result2 = paymentService.paySuccess2(payment);

		// usercoin 값 받아오는 서비스
		loginMember.setU_Coin(paymentService.userCoin(u_no));

		if (result > 0 && result2 > 0) {
			// json으로 뷰보냄
			mv.setViewName("JsonView");
		}

		return mv;
	}

	//## 전체유저 피드글 보기
	@RequestMapping("allFeed.do")
	public ModelAndView allFeedMethod(ModelAndView mv, TargetLikeCheck target) {
		
		try {
			
			if(loginMember.getU_no() != null) {
				
				List<Feed> allFeedList = new ArrayList<Feed>();
				allFeedList = feedService.allFeed();	//전체피드 리스트용
				String[] f_images = null;	// 이미지 나눠서 담을 배열 선언
				String first_image;
				
				for(Feed f : allFeedList) {
					
					f_images = f.getF_img().split(",");
					first_image = f_images[0];	//첫번째 이미지만 변수에 담음
					int imgSize = f_images.length;	//피드별 이미지 개수 저장
					f.setCount(Integer.toString(imgSize));	//이미지 개수 set
					f.setF_allImg(first_image);	// 첫번째 이미지만 저장함
				}
				
				int feedSize = allFeedList.size();	//피드 개수 조회
				
				//전체 피드 좋아요 체크여부확인
				List<FeedLike> allFeedHeartChk = new ArrayList<FeedLike>();	
				allFeedHeartChk = feedService.allFeedHeartChk(loginMember.getU_no());
				
				//로그인한 유저가 피드글을 쓴 유저를 좋아요했는지 아닌지 여부확인
				List<TargetLikeCheck> AllFeedUserslikeList = new ArrayList<TargetLikeCheck>();
				AllFeedUserslikeList = feedService.AllFeedUserslikeList(loginMember.getU_no());
				
				//로그인한 유저가 피드를 좋아했는지 여부 체크
				List<FeedLike> fLikeChk = new ArrayList<FeedLike>();
				fLikeChk = feedService.allFeedLikeChk(loginMember.getU_no());
				
				// 피드 좋아요수 출력
				List<Feed> feedLikeCnt = new ArrayList<Feed>();
				feedLikeCnt = feedService.feedLikeMethod(loginMember.getU_no());
				
				// 피드 댓글수출력
				List<Feed> feedReplyCnt = new ArrayList<Feed>();
				feedReplyCnt = feedService.feedReplyMethod(loginMember.getU_no());
				
				//피드별 댓글 리스트
				List<FeedReply> AllFeedReplyList = new ArrayList<FeedReply>();
				AllFeedReplyList = feedService.allFeedReplyList();
		
				if(allFeedList != null) {
					
					mv.addObject("allFeed", allFeedList);	//피드 리스트
					mv.addObject("feedSize", feedSize);		//피드 글 수
					mv.addObject("allFeedHeartChk", allFeedHeartChk);	//피드 글 좋아요 체크여부
					mv.addObject("userLikeChkList", AllFeedUserslikeList);	//로그인한 유저가 피드글을 쓴 유저를 좋아요했는지 아닌지 여부확인
					mv.addObject("allFeedReplyList", AllFeedReplyList);	//댓글 리스트 출력
					mv.addObject("feed_Like_Chk", fLikeChk);
					mv.addObject("feed_like_cnt", feedLikeCnt);
					mv.addObject("feed_reply_cnt", feedReplyCnt);
					mv.setViewName("feed/allFeed");
					
				}else {
					
					mv.setViewName("redirect:redirectFeed.do");
				}
				
			}else {
				
				mv.setViewName("redirect:login.do");
				
			}
			
		} catch (NullPointerException e) {
			
			mv.setViewName("users/login");
		}
		
		return mv;
	}
	
	// ## user찜하기
	@RequestMapping(value="golikeTarget.do", method=RequestMethod.POST)
	public ModelAndView golikeTargetMethod(ModelAndView mv, @RequestParam("loginUno") String loginUno,
			@RequestParam("targetUno") String targetUno, TargetLikeCheck targetchk) {
		
		if(loginUno != null && targetUno != null) {
		
			targetchk.setU_no(loginUno);
			targetchk.setTarget_no(targetUno);
			feedService.golikeTarget(targetchk);	//좋아요 추가
			
			//좋아요 한 후 푸딩1개 차감함.
			feedService.outCoin(loginUno);
			
			//차감한 푸딩 조회후 세션 저장
			loginMember.setU_Coin(feedService.selectCoin(loginUno));
			
			mv.setViewName("redirect:goTargetFeed.do?u_no="+ targetUno);
			
		}
		
		return mv;

	}
	
	// ## 해시태그 검색
	@RequestMapping("search.do")
	public ModelAndView searchMethod(@RequestParam("search") String search, ModelAndView mv, RecentSearch rs, HttpSession session) {
		
		rs.setU_no(loginMember.getU_no());
		rs.setSearch_text(search);
		
		//검색내용 중복 체크하고 중복값이면 UPDATE, 중복아니면 INSERT 처리
		//최근검색어 저장갯수 10개제한
		if(rsList.size() < 10) {	//10개 미만이면 insert or update
			
			userService.saveHistory(rs);
			
		}else { //10개 이상일 때 삭제후 update
			
			userService.tenSizeHistory(loginMember.getU_no());
			userService.saveHistory(rs);
		}
		
		
		//헤더 검색내역 리스트 불러옴
		rsList = (ArrayList<RecentSearch>)userService.historyList(loginMember.getU_no());

		session.setAttribute("searchHistory", rsList);

		  
		//해시태그 검색내용에 대한 리스트 불러옴
		List<Feed> allFeedList = new ArrayList<Feed>();
		allFeedList = feedService.searchFeed(search);	//전체피드 리스트용
		String[] f_images = null;	// 이미지 나눠서 담을 배열 선언
		String first_image;
		
		for(Feed f : allFeedList) {
			
			f_images = f.getF_img().split(",");
			first_image = f_images[0];	//첫번째 이미지만 변수에 담음
			int imgSize = f_images.length;	//피드별 이미지 개수 저장
			f.setCount(Integer.toString(imgSize));	//이미지 개수 set
			f.setF_allImg(first_image);	// 첫번째 이미지만 저장함
		}
		
		int feedSize = allFeedList.size();	//피드 개수 조회
		
		//전체 피드 좋아요 체크여부확인
		List<FeedLike> allFeedHeartChk = new ArrayList<FeedLike>();	
		allFeedHeartChk = feedService.allFeedHeartChk(loginMember.getU_no());
		
		//게시글 상세보기 좋아요 수
		List<Feed> feed_like_cnt = feedService.feed_Like_Chk(search);
		
		//게시글 상세보기 댓글 수
		List<Feed> feed_reply_cnt = feedService.feed_reply_cnt(search);
		
		//게시글 댓글 목록
		List<FeedReply> SearchFeedReplyList = feedService.SearchFeedReplyList(search);
		
		//해당 유저 좋아요 여부 확인
		List<TargetLikeCheck> AllFeedUserslikeList = new ArrayList<TargetLikeCheck>();
		AllFeedUserslikeList = feedService.AllFeedUserslikeList(loginMember.getU_no());
		
		if(allFeedList != null) {
			
			mv.addObject("allFeed", allFeedList);	//피드 리스트
			mv.addObject("feedSize", feedSize);		//피드 글 수
			mv.addObject("allFeedHeartChk", allFeedHeartChk);	//피드 글 좋아요 체크여부
			mv.addObject("search", search);		//검색내용
			mv.addObject("feed_like_cnt", feed_like_cnt);	//게시글 상세보기 좋아요 개수
			mv.addObject("feed_reply_cnt", feed_reply_cnt);	//게시글 상세보기 댓글 수
			mv.addObject("SearchFeedReplyList", SearchFeedReplyList);	//게시글 댓글 목록
			mv.addObject("userLikeChkList", AllFeedUserslikeList);	//로그인한 유저가 피드글을 쓴 유저를 좋아요했는지 아닌지 여부확인
			
			mv.setViewName("feed/searchFeed");
			
		}else {
			
			mv.addObject("NoSearchMsg", search + "에 대한 검색결과가 없습니다.");
			mv.setViewName("redirect:redirectFeed.do");
			
		}
		
		return mv;
		
	}
	
	//## 검색기록 전부 삭제
	@RequestMapping("historyAllDel.do")
	public ModelAndView historyAllDelMethod(@RequestParam("u_no") String u_no, ModelAndView mv, HttpServletResponse rs, 
			HttpSession session)
			throws IOException {
		
		int result = userService.historyAllDel(u_no);
		
		if(result > 0) {
		
		  rsList = (ArrayList<RecentSearch>)userService.historyList(loginMember.getU_no());
		  session.setAttribute("searchHistory", null);
		  session.setAttribute("notSearchMsg", "최근 검색기록이 존재하지 않습니다.");
		  
		}
		
		mv.setViewName("JsonView");
	
		return mv;
	}
	
	//##검색기록 한개만 삭제하기
	@RequestMapping("searchOneDelete.do")
	public ModelAndView searchOneDelMethod(@RequestParam("u_no") String u_no, @RequestParam("search_text") String search_text,
			ModelAndView mv, HttpSession session, RecentSearch rs) {
		
		rs.setU_no(u_no);
		rs.setSearch_text(search_text);
		
		int result = userService.searchOneDel(rs);
		
		if(result > 0) {
			
			  rsList = (ArrayList<RecentSearch>)userService.historyList(loginMember.getU_no());
			  
			  if(rsList.size() == 0) {
				  
				  session.setAttribute("searchHistory", null);
				  session.setAttribute("notSearchMsg", "최근 검색기록이 존재하지 않습니다.");
			  
			  }else {
				  
				  session.setAttribute("searchHistory", rsList);
			  }
		}
		
		mv.setViewName("JsonView");
		
		return mv;
	}
	
	//프로필수정 페이지 이동용 컨트롤러
	@RequestMapping("modiProfile.do")
	public String modiProfileMethod() {
		
		return "users/popupProfileModi";
	}
	
	//회원 신고용 컨트롤러
	@RequestMapping("goReportCon.do")
	public ModelAndView goReportMethod(ModelAndView mv, HttpSession session, UserReport report,HttpServletResponse response,
			HttpServletRequest request) throws IOException{
		
		report.setR_no("0");
		report.setR_yn("N");
		int result = userService.reportInsert(report);
		mv.addObject("result", result);
		mv.setViewName("JsonView");
		return mv;
	}
	
	//신고 리스트 이동용 컨트롤러
	@RequestMapping("goReportList.do")
	public ModelAndView goReportListMethod(ModelAndView mv, @RequestParam(name="page", required=false) String page) {
	
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		//페이징 처리
		int limit = 10;  //한 페이지에 출력할 목록 갯수
		int listCount = userService.userReportListCount(loginMember.getU_no());

		//페이지 수 계산
		int maxPage = (int)((double)listCount / limit + 0.9);  //목록이 11개이면 총 2페이지가 됨.
		//현재 페이지가 포함된 페이지 그룹의 시작값
		int startPage = (int)((double)currentPage / limit + 0.9);
		//현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage)
			endPage = maxPage;
		
		//쿼리문에 반영할 현재 페이지에 출력할 목록의 시작행과 끝행 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("u_no", loginMember.getU_no());
		//리스트 불러옴
		List<Report> rlist = new ArrayList<Report>();
		rlist = userService.userReportList(map);

		if(rlist.size() > 0) {
			
			mv.addObject("rlist", rlist);
			mv.addObject("listCount", listCount); //전체갯수
			mv.addObject("maxPage", maxPage); // 맨마지막페이지 
			mv.addObject("currentPage", currentPage); //해당페이지 기본값 1
			mv.addObject("startPage", startPage); //첫페이지
			mv.addObject("endPage", endPage); //끝페이지
			mv.addObject("limit", limit); //한페이지당 출력할갯수 기본값10개
		
		}else {
			
			mv.addObject("listCount", 0);
			mv.addObject("nullrlistMsg", "신고내역이 없습니다.");
		}
		
		mv.setViewName("users/reportList");
		return mv;
	}
	
	//##휴대폰 번호 중복 가입 방지 컨트롤러
		@RequestMapping("phoneAuthChk.do")
		public ModelAndView phoneAuthChkMethod(ModelAndView mv, @RequestParam("clientPhone") String authPhone){
			
			//빈칸 들어가지않도록 앞단에서 처리하였음.
			
			int result = userService.phoneDBChk(authPhone);
			
			if(result > 0){	//이미 가입된 계정일시 가입불가능 메시지 출력
				
				mv.addObject("result", 1);
				
			}else {
				
				String api_key = "NCSUDLKISOTXKF5N";
				String api_secret = "WTBIU2WGCT6IHVAKVG2KEGNQJ7QZCY1M";
				Message coolsms = new Message(api_key, api_secret);
				Random random = new Random();
				int AuthNum = random.nextInt(999999);

				HashMap<String, String> params = new HashMap<String, String>();
				params.put("to", authPhone);
				params.put("from", "01022479633");
				params.put("type", "SMS");
				params.put("text", "럽미인 인증번호[" + AuthNum + "]을 올바르게 입력해주세요."); // 문자내용
				params.put("app_version", "JAVA SDK v1.2");

				try {
					JSONObject obj = (JSONObject) coolsms.send(params);
					System.out.println(obj.toString());
				} catch (CoolsmsException e) {
					System.out.println(e.getMessage());
					System.out.println(e.getCode());
				}
				
				logger.info("인증번호 : " + AuthNum);
				
				mv.addObject("result", 0);
				mv.addObject("AuthNum",AuthNum);
				mv.addObject("phone", authPhone);
			
			}
			
			mv.setViewName("JsonView");
			return mv;
		}
		
	//##이메일 중복체크 컨트롤러
	@RequestMapping(value = "checkEmail.do", method = RequestMethod.POST)
	public ModelAndView chkMailMethod(ModelAndView mv, @RequestParam("chkmail") String chkMail) {
		
		int result = userService.chkMailMethod(chkMail);
		
		if(result > 0) {
			
			mv.addObject("chkresult", 1);
		
		}else {
			
			mv.addObject("chkresult", 0);
		}
		
		mv.setViewName("JsonView");
		return mv;
	}
	
	//##이름 중복체크 컨트롤러
	@RequestMapping(value = "checkName.do", method = RequestMethod.POST)
	public ModelAndView chkNameMethod(ModelAndView mv, @RequestParam("chkName") String chkName) {
		
		int result = userService.chkNameMethod(chkName);
		
		if(result > 0) {
			
			mv.addObject("chkresult", 1);
		
		}else {
			
			mv.addObject("chkresult", 0);
		}
		
		mv.setViewName("JsonView");
		return mv;
	}
	
	//##비번 중복체크 컨트롤러
	@RequestMapping(value = "checkPwd.do", method = RequestMethod.POST)
	public ModelAndView chkPwdMethod(ModelAndView mv, @RequestParam("pwd1") String pwd1, @RequestParam("pwd2") String pwd2) {
		
		if(pwd1.equals(pwd2)){
			
			mv.addObject("message", 1);
			
		}else {
			
			mv.addObject("message", 0);
		}
		mv.setViewName("JsonView");
		return mv;
	}
	
	//##글자수 체크 컨트롤러
	@RequestMapping(value = "chkLengthAjax.do", method = RequestMethod.POST)
	public ModelAndView chkLengthMethod(ModelAndView mv, @RequestParam("chkLength") int chkLength) {
		
		mv.addObject("counts", chkLength);
		mv.setViewName("JsonView");
		return mv;
	}
	
}
