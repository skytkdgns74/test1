package controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ChangePwdCommandValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ChangePwdCommand.class.isAssignableFrom(clazz); //ChangePwdCommand클래스가 clazz클래스를 상속받았는지 체크?
	}														//clazz(슈퍼클래스)-ChangePwdCommand클래스. 또는 같은클래스 ==이면 true

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(
				errors, "currentPassword", "required");
		ValidationUtils.rejectIfEmpty(errors, "newPassword", "required");
	}

}
