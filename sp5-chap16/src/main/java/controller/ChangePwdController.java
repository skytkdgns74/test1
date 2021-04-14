package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.AuthInfo;
import spring.ChangePasswordService;
import spring.WrongIdPasswordException;

@Controller
@RequestMapping("/edit/changePassword")
public class ChangePwdController {

	private ChangePasswordService changePasswordService;

	public void setChangePasswordService(
			ChangePasswordService changePasswordService) {
		this.changePasswordService = changePasswordService;
	}

	@GetMapping
	public String form(
			@ModelAttribute("command") ChangePwdCommand pwdCmd) {
		return "edit/changePwdForm";
	}

	@PostMapping
	public String submit(
			@ModelAttribute("command") ChangePwdCommand pwdCmd, // ChangePwdCommand pwdCmd객체의 이름을 command로 줘라
			Errors errors,
			HttpSession session) {
		new ChangePwdCommandValidator().validate(pwdCmd, errors); //메소드실행validate
		if (errors.hasErrors()) {
			return "edit/changePwdForm";		//에러면 이동
		}
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");	//로그인 상태다
		try {
			changePasswordService.changePassword(
					authInfo.getEmail(),
					pwdCmd.getCurrentPassword(),
					pwdCmd.getNewPassword());
			return "edit/changedPwd";
		} catch (WrongIdPasswordException e) {
			errors.rejectValue("currentPassword", "notMatching");
			return "edit/changePwdForm";
		}
	}
}
