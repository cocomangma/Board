package board.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board.member.dto.MemberDto;
import board.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberservice;

	@GetMapping("/memberList")
	public ModelAndView memberList() {

		ModelAndView mv = new ModelAndView("/member/memberList");
		List<MemberDto> list = memberservice.selectMemberList();
		mv.addObject("list", list);
		return mv;

	}

	@GetMapping("/loginForm")
	public String loginForm() {

		return "/member/loginForm";

	}

	@PostMapping("/login")
	public String login(MemberDto memberDto, HttpSession session, HttpServletRequest request) throws Exception {

		memberDto = memberservice.login(memberDto);

		if (memberDto != null) {
			session.setAttribute("memberDto", memberDto);
			System.out.println(memberDto.getMemberemail());
			return "redirect:/board/openBoardList";
		}

		else {
			request.setAttribute("msg", "이메일과 비밀번호를 확인해주세요.");
			return "/member/loginForm";
		}
			
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		
		return "redirect:/member/loginForm";
	}
	
	@GetMapping("/logoutAdmin")
	public String logoutAdmin(HttpSession session) {

		session.invalidate();
		
		return "redirect:/member/loginAdminForm";
	}

	@GetMapping("/loginAdminForm")
	public String loginAdminForm() {

		return "/member/loginAdminForm";
	}

	@PostMapping("/loginAdmin")
	public String loginAdmin(MemberDto adminDto, HttpSession session, HttpServletRequest request) throws Exception {

		adminDto = memberservice.loginAdmin(adminDto);

		if (adminDto != null && adminDto.getMemberemail().equals("admin")) {
			session.setAttribute("memberDto", adminDto);
			return "redirect:/member/adminPage";
		}
		request.setAttribute("msg", "관리자 계정정보를 확인해주세요.");
		return "/member/loginAdminForm";

	}

	@GetMapping("/adminPage")
	public String adminPage() {
		return "/member/adminPage";
	}

	@GetMapping("/memberSaveForm")
	public String memberSaveForm() {
		return "/member/memberSaveForm";

	}

	@PostMapping("/memberSave")
	public String memberSave(MemberDto memberDto) {
		memberservice.insertMember(memberDto);
		System.out.println("email:"+memberDto.getMemberemail());
		return "redirect:/member/loginForm";

	}

	@PostMapping("/checkId")
	public @ResponseBody int checkId(String memberemail) throws Exception {
		int result = memberservice.checkId(memberemail);
		return result;
	}

	@GetMapping("/memberUpdateDetail")
	public ModelAndView memberUpdateForm(int memberidx) {
		ModelAndView mv = new ModelAndView("/member/memberUpdateForm");
		MemberDto mdto = memberservice.selectMemberOne(memberidx);
		mv.addObject("mdto", mdto);

		return mv;

	}

	@PostMapping("/memberUpdate")
	public String memberUpdate(MemberDto memberDto) {
		memberservice.updateMember(memberDto);
		return "redirect:/member/memberList";
	}

	@GetMapping("/memberDelete")
	public String memberDelete(int memberidx) {
		memberservice.deleteMember(memberidx);
		return "redirect:/member/memberList";
	}

}
