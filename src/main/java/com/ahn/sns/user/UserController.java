package com.ahn.sns.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signup/view")
	public String signup() {
		return "user/signup";
	}
	
	@GetMapping("/signin/view")
	public String sginin() {
		return "user/signin";
	}
	
	@GetMapping("/passwordsearch/view")
	public String passwordSearch() {
		return "user/passwordsearch";
	}
	
	@GetMapping("/passwordchange/view")
	public String passwordChange() {
		return "user/passwordchange";
	}
	
	@GetMapping("/passwordchange")
	public String passwordChangSuccess(HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		
		return "redirect:/user/signin/view";
	}
	
	@GetMapping("/signout")
	public String signout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		session.removeAttribute("userLoginId");
		
		return "redirect:/user/signin/view";
	}
}
