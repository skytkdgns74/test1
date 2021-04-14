package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.DuplicateMemberException;
import spring.MemberRegisterService;
import spring.RegisterRequest;

@Controller
public class RegisterController {

	private MemberRegisterService memberRegisterService;

	public void setMemberRegisterService(
			MemberRegisterService memberRegisterService) {
		this.memberRegisterService = memberRegisterService;
	}

	@RequestMapping("/register/step1")	//@RequestMapping : GET/POST 상관없이 경로와 일치하는 요청 처리.
	public String handleStep1() {
		return "register/step1";
	}

	@PostMapping("/register/step2")		//@PostMapping : POST 요청만 처리    ex경로가 같고 get/post로 다르게 받을 수 있음.  / agree면 step2/ 아니면 step1 이동
	public String handleStep2(
			@RequestParam(value = "agree", defaultValue = "false") Boolean agree,	//@RequestParam 요청 파라미터 개수가 몇개 안될때 사용 / defaultValue = "false" 파라미터값이 없으면 flase / Boolean agree : 요청 파라미터값을 agree에 할당
			Model model) {										//Boolean : 필수 여부 지정/ 기본값 true/ 요청 파라미터에 값이 없으면 익셉션 발생
		if (!agree) {
			return "register/step1";
		}
		model.addAttribute("registerRequest", new RegisterRequest());
		return "register/step2";
	}

	@GetMapping("/register/step2")	//@GetMapping :GET 요청만 처리.  ex경로가 같고 get/post로 다르게 받을 수 있음. / step2 주소창입력 ->step1 보내기
	public String handleStep2Get() {
		return "redirect:/register/step1"; //redirect:경로
	}

	@PostMapping("/register/step3")
	public String handleStep3(RegisterRequest regReq, Errors errors) {
		new RegisterRequestValidator().validate(regReq, errors);
		if (errors.hasErrors())
			return "register/step2";

		try {
			memberRegisterService.regist(regReq);
			return "register/step3";
		} catch (DuplicateMemberException ex) {
			errors.rejectValue("email", "duplicate");
			return "register/step2";
		}
	}

}
