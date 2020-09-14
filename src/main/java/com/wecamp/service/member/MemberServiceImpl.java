package com.wecamp.service.member;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.wecamp.mapper.BookingMapper;
import com.wecamp.mapper.HeartMapper;
import com.wecamp.mapper.LMemberMapper;
import com.wecamp.mapper.MemberMapper;
import com.wecamp.mapper.ReviewMapper;
import com.wecamp.model.BookingAndCampAndImg;
import com.wecamp.model.HeartAndCampAndImg;
import com.wecamp.model.Member;
import com.wecamp.model.Review;
import com.wecamp.utils.PageUtil;
import com.wecamp.utils.TimeUtil;
import com.wecamp.vo.Pagination;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	private MemberMapper memberMapper;
	private LMemberMapper lMemberMapper;
	private BookingMapper bookingMapper;
	private ReviewMapper reviewMapper;
	private HeartMapper heartMapper;
	
	// 이메일 중복검사 AJAX 
	@Override
	public void emailCheck(String email, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(memberMapper.emailCheck(email));
		log.info("#> 1emailcheck : "+memberMapper.emailCheck(email));
		out.close();
	}
	
	@Override
	public int signUp(Member member, HttpServletResponse response) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (memberMapper.emailCheck(member.getEmail()) == 1) {
			out.println("<script>");
			out.println("alert('동일한 아이디가 있습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		} else {
			// 인증키 SET
			member.setApproval_key(create_key());
			memberMapper.signUp(member);
			// 인증 메일 발송 
			send_mail(member, "join");
			return 1;
		}
	}
	
	@Override
	public String create_key() throws Exception {
		String key = "";
		Random rd = new Random();
		
		//8자리 숫자의 랜덤한 숫자 생성 
		for (int i = 0; i < 8; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}
	
	@Override
	public void send_mail(Member member, String div) throws Exception {
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "simple_photo@naver.com";
		String hostSMTPpwd = "whwldk123";
		
		// 보내는 사람의 EMail, 제목, 내용
		String fromEmail = "simple_photo@naver.com";
		String fromName = "WeCamp :: 최고의 캠핑장";
		String subject = "";
		String msg = "";
		
		
		//회원가입 메일 내용
		if(div.equals("join")) {
			subject = "WeCamp Hompage 회원가입 인증 메일입니다!";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getEmail() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='https://localhost:8443/sign_up/approval_member.wcc'>";
			msg += "<input type='hidden' name='email' value='" + member.getEmail() + "'>";
			msg += "<input type='hidden' name='approval_key' value='" + member.getApproval_key() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		} else if(div.equals("find_pwd")) {
			subject = "WeCamp 임시 비밀번호입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getEmail() + "님의 임시 비밀번호입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getPwd() + "</p></div>";
		}
		//받는 사람 이메일 주소 
		String mail = member.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일 발송 실패: " + e);
		}
	}
	
	@Override
	public void approval_member(Member member, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(memberMapper.approval_member(member) == 0) { // -> 이메일 인증에 실패했을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증에 성공했을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("location.href='../index.jsp';");
			out.println("</script>");
			out.close();
		}
	}
	
	@SuppressWarnings({"null", "unchecked"})
	@Override
	public Member login(Member member, HttpServletResponse response, ServletContext servletContext) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 등록된 아이디가 없다면
		if(memberMapper.emailCheck(member.getEmail()) == 0) {
			out.println("<script>");
			out.println("alert('등록된 이메일이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			String pwd = member.getPwd();
			member = memberMapper.login(member.getEmail());
			
			// 비밀번호가 맞지 않을 경우
			if(!member.getPwd().equals(pwd)) {
				out.println("<script>");
				out.println("alert('비밀번호가 맞지 않습니다. 정확하게 입력해 주세요.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			// 이메일 인증을 하지 않은 경우 
			} else if(!member.getApproval_status().equals("true")) {
				out.println("<script>");
				out.println("alert('이메일 인증 후 로그인을 진행해 주세요.')");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			// 로그인 성공 시 회원정보 리턴 
			} else {
				member.setPwd(null);
				
				LinkedList<Member> loginUser = (LinkedList<Member>)servletContext.getAttribute("loginUser");
				TimeUtil timeUtil = new TimeUtil();
				String loginTime = timeUtil.getDateTime();
				member.setLoginTime(loginTime);
				if(loginUser == null) {
					loginUser = new LinkedList<Member>();
					loginUser.add(member);
					servletContext.setAttribute("loginUser", loginUser);
				} else {
					Iterator<Member> itr = loginUser.iterator();
					while(itr.hasNext()) {
						Member user = itr.next();
						boolean isSameUser = member.getEmail().equals(user.getEmail()) ? true : false;
						if(isSameUser) return member;
					}
					loginUser.add(member);
					servletContext.setAttribute("loginUser", loginUser);
				}
				return member;
			}
		}
	}
	
	//로그아웃 구현은 Database에 대한 어떠한 작업도 없기 때문에 매퍼 X
	@Override
	public void logout(HttpServletResponse response, HttpSession session, ServletContext servletContext) {
		
		auto_logout_service(session, servletContext);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.println("<script>");
			out.println("location.href=document.referrer;");
			out.println("</script>");
			out.close();
		} catch (IOException e) {
			//String errorMsg = e.getMessage();
			//String errorPage = "404_wecamp_error";
		}
	}
	
	@Override
	public void find_pwd(HttpServletResponse response, Member member) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 이메일이 없으면 
		if(memberMapper.emailCheck(member.getEmail()) == 0) {
			out.println("해당 이메일이 없습니다. ");
			out.close();
		} else if(!member.getEmail().equals(memberMapper.login(member.getEmail()).getEmail())) {
			out.println("잘못된 이메일입니다. ");
			out.close();
		// 가입에 사용한 이메일이 아니라면 
		/*}else if(!member.getEmail().equals(memberMapper.login(member.getEmail()).getEmail())) {
			out.println("잘못된 이메일입니다. ");
			out.close();*/
		// 임시 비밀번호 부여 
		}else {
			String pwd = "";
			for (int i = 0; i < 12; i++) {
				pwd += (char) ((Math.random() * 26) + 97);
			}
			member.setPwd(pwd);
			// 비밀번호 변경 
			memberMapper.update_pwd(member);
			// 비밀번호 변경 이메일 전송
			send_mail(member, "find_pwd");
			
			out.println("이메일로 임시 비밀번호를 전송하였습니다. ");
			out.close();
		}
	}
	
	//회원탈퇴 
	@Transactional
	@Override
	public boolean delete_member(Member member, HttpSession session, HttpServletResponse response){
		//Member member = (Member)session.getAttribute("member");
		log.info("#>member비밀번호(1) : "+member.getPwd());
		Member leavingMember = (Member)session.getAttribute("member");
		response.setContentType("text/html;charset=utf-8");
		//member = memberMapper.login(member.getEmail());
		
		log.info("#>member비밀번호(2) : "+member.getPwd());
		try {
			PrintWriter out = response.getWriter();
			if(memberMapper.delete_member(member) != 1) { //비밀번호가 틀린 경우
				out.println("<script>");
				out.println("alert('회원탈퇴 실패');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return false;
			}else {
				lMemberMapper.insertLeaveMember(leavingMember);
				//memberMapper.delete_member(member);
				return true;
			}
		}catch(IOException e) {
			//exception logic
			log.info("###>e:" + e);
			return false;
		}
	}
	
	//비밀번호 수정
	@Override
	public Member update_pwd(Member member, String old_pwd, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		try {
			PrintWriter out = response.getWriter();
			if(!old_pwd.equals(memberMapper.login(member.getEmail()).getPwd())) {
				out.println("<script>");
				out.println("alert('기존 비밀번호가 다릅니다.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			} else {
				memberMapper.update_pwd(member);
				return memberMapper.login(member.getEmail());
			}
		}catch(IOException e) {
			return null;
		}
	}
	
	//회원정보 수정
	@Override
	public Member update_member(Member member) throws Exception {
		log.info("#>member:" + member);
		memberMapper.update_member(member);
		return memberMapper.login(member.getEmail());
	}
	
	//예약 내역 확인 리스트
	@Override
	public ModelAndView show_booking_info(String email, Integer nextPage, HttpSession session) {
		//Member member = (Member)session.getAttribute("member");
		
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("email", email);
		
		//세션에 설정된 현재페이지를 가지고 오는 소스 코드
		//String psStr = (String)session.getAttribute("ps");
		int currentPage = 1;
		
		if(session.getAttribute("cp") == null) {
			session.setAttribute("cp", 1);
		}
		if(nextPage != null) {
			currentPage = nextPage;
		}
		
		
		//F3 누르면 거기로 감
		PageUtil pageUtil = new PageUtil();
		currentPage = pageUtil.getCurrentPageSession(String.valueOf(currentPage), session);
		int pageSize = pageUtil.getPageSize("6", session);
		long listCount = bookingMapper.select_booking_count(query);
		Pagination page = new Pagination(listCount, currentPage, pageSize);
		query.put("page", page);
		
		List<BookingAndCampAndImg> list = bookingMapper.select_booking(query);
		
		ModelAndView response = new ModelAndView("/client/member/booking_list");
		response.addObject("page", page);
		response.addObject("list", list);
		log.info("#> page: " + page);
		log.info("#> cp: " + session.getAttribute("cp"));
		log.info("#> cp: " + currentPage);
		log.info("#> nextPage: " + nextPage);
		
		return response;
	}
	
	@Transactional
	@Override
	public boolean add_reivew_service(Review review, int booking_idx, HttpSession session) {
		Member member = (Member)session.getAttribute("member");
		review.setEmail(member.getEmail());
		review.setNickname(member.getNickname());
		
		if(reviewMapper.insert_review(review)) {
			return bookingMapper.update_state(booking_idx);
		}
		return false;
	}
	
	//찜 목록 리스트 확인
	@Override
	public ModelAndView show_heart_list(String email, Integer nextPage, HttpSession session) {
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("email", email);
		
		int currentPage = 1;
		
		if(session.getAttribute("cp") == null) {
			session.setAttribute("cp", 1);
		}
		if(nextPage != null) {
			currentPage = nextPage;
		}
		
		PageUtil pageUtil = new PageUtil();
		currentPage = pageUtil.getCurrentPageSession(String.valueOf(currentPage), session);
		int pageSize = pageUtil.getPageSize("6", session);
		long listCount = heartMapper.select_heart_count(query);
		Pagination page = new Pagination(listCount, currentPage, pageSize);
		query.put("page", page);
		
		List<HeartAndCampAndImg> hlist = heartMapper.select_heart(query);
		
		ModelAndView response = new ModelAndView("/client/member/heart_list");
		response.addObject("page", page);
		response.addObject("hlist", hlist);
		
		return response;
	}
	
	//찜 삭제
	@Override
	public int delete_heart_list(String email, int camp_idx) {
		HashMap<String, Object> query = new HashMap<String, Object>();
		query.put("email", email);
		query.put("camp_idx", camp_idx);
		
		try {
			heartMapper.deleteHeart(query);
			return 1;
		}catch(Exception e) {
			return 0;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void auto_logout_service(HttpSession session, ServletContext servletContext) {
		if(session.getAttribute("member") != null && servletContext.getAttribute("loginUser") != null) {
			Member logout_user = (Member)session.getAttribute("member");
			LinkedList<Member> loginUser = (LinkedList<Member>)servletContext.getAttribute("loginUser");
			Iterator<Member> head = loginUser.iterator();
			while(head.hasNext()) {
				Member user = head.next();
				if(logout_user.getEmail().equals(user.getEmail())) {
					head.remove();
					break;
				}
			}
			servletContext.setAttribute("loginUser", loginUser);
			session.removeAttribute("member");
			log.info("################LOGOUT###################");
			log.info("#> "+loginUser.size()+" :: Auto - Logout >>> success");
			log.info("################LOGOUT###################");
		}
	}
}
