package org.develnotes.examples;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * РљРѕРЅС‚СЂРѕР»Р»РµСЂ СЃС‚СЂР°РЅРёС†С‹ Р»РѕРіРёРЅР°.
 * РџСЂРёРјРµСЂ СЃ СЃР°Р№С‚Р° develnotes.org
 * @author Alex Dl.
 *
 */
@Controller
public class LoginController {
	
	private final String ERROR_MESSAGE = "Неверные логин или пароль";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/loginfailed", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", ERROR_MESSAGE);
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout() {
		return "login";
	}
	
}
