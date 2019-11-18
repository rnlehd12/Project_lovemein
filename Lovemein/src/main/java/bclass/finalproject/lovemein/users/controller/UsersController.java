package bclass.finalproject.lovemein.users.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
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

import bclass.finalproject.lovemein.feed.model.service.FeedService;
import bclass.finalproject.lovemein.feed.model.vo.Feed;
import bclass.finalproject.lovemein.feed.model.vo.FeedLike;
import bclass.finalproject.lovemein.feed.model.vo.FeedReply;
import bclass.finalproject.lovemein.likes.model.vo.Likes;
import bclass.finalproject.lovemein.payment.model.service.PaymentService;
import bclass.finalproject.lovemein.payment.model.vo.Payment;
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

	AllUsers loginMember = null;

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
			  
			  }else {
			  
				  session.setAttribute("loginMember", loginMember);
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
	public ModelAndView redirectFeed(ModelAndView mv) {

		mv.setViewName("feed/myFeed");

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
		
		//// 내가 좋아요한 글 처리표시
		List<Feed> feedLikeChk = new ArrayList<Feed>();
		feedLikeChk = feedService.feedLikeChkMethod(loginMember.getU_no());
	
		if(feedList.size() > 0) {
			
			mv.addObject("feed_list", feedList);
			mv.addObject("feed_like_cnt", feedLikeCnt);
			mv.addObject("feed_reply_cnt", feedReplyCnt);
			mv.addObject("feed_Reply_List", feedReplyList);
			mv.addObject("feed_Like_Chk", feedLikeChk);
			
			
		}else {	//피드가 없을시에 실행
			
			mv.addObject("nullMessage","등록된 피드가 없습니다. 첫 글을 등록해보세요!");
		}
		
		return mv;

	}

	// ##로그아웃용 컨트롤러
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request) {

		HttpSession session = request.getSession(false);

		if (session != null) {
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

	// ##회원가입 휴대폰 인증번호 전송용 컨트롤러
	@RequestMapping(value = "sendmessage.do")
	public ModelAndView sendMessage(@RequestParam("u_phone") String phone, ModelAndView mv) throws Exception {

		String api_key = "NCSUDLKISOTXKF5N";
		String api_secret = "WTBIU2WGCT6IHVAKVG2KEGNQJ7QZCY1M";
		Message coolsms = new Message(api_key, api_secret);
		Random random = new Random();
		int AuthNum = random.nextInt(999999);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phone);
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
		
		logger.info("인증번호  : " + AuthNum);
		mv.setViewName("users/join1");
		mv.addObject("AuthNum", AuthNum);
		mv.addObject("phone", phone);
		return mv;
	}

	// ##회원가입 휴대폰 번호인증 재인증용 컨트롤러
	@RequestMapping(value = "auth.do", method = RequestMethod.POST)
	public ModelAndView authMethod(@RequestParam("auth") String auth, @RequestParam("authNum") String authNum,
			@RequestParam("u_phone") String phone, ModelAndView mv) {

		String result = "인증에 실패하였습니다. 다시 시도하세요.";
		int num = 0; // 인증여부 값

		if (auth.equals(authNum)) {

			result = "인증에 성공하였습니다.";
			num = 1;

		} else {

			result = "인증에 실패하였습니다. 다시 시도하세요.";
			num = 0;
		}

		mv.setViewName("users/join1");
		mv.addObject("message", result);
		mv.addObject("num", num);
		mv.addObject("authNum", authNum);
		mv.addObject("phone", phone);
		return mv;

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

	//## 상대방 피드 이동용 컨트롤러
	@RequestMapping("goTargetFeed.do")
	public ModelAndView goTargetFeedMethod(@RequestParam("u_no") String u_no, ModelAndView mv, AllUsers allUsers,
			TargetLikeCheck targetChk, TargetLikeCheck target, TargetLikeCheck targetLikeCheck) {

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
	public ModelAndView allFeedMethod(ModelAndView mv) {
		
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
		
		if(allFeedList != null) {
			
			mv.addObject("allFeed", allFeedList);	//피드 리스트
			mv.addObject("feedSize", feedSize);		//피드 글 수
			mv.addObject("allFeedHeartChk", allFeedHeartChk);	//피드 글 좋아요 체크여부
			
			mv.setViewName("feed/allFeed");
			
		}else {
			
			mv.setViewName("redirect:redirectFeed.do");
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
}
