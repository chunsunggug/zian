package pan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NavbarController {

	@RequestMapping("/introduce.do")
	public String introduce() {
		return "nav/introduce";
	}
	
	@RequestMapping("/beautiful.do")
	public String beautiful() {
		return "nav/beautiful";
	}
	
	@RequestMapping("/romance.do")
	public String romance() {
		return "nav/romance";
	}
	
	@RequestMapping("/ticket.do")
	public String ticket() {
		return "nav/ticket";
	}
	@RequestMapping("/personList.do")
	public String person() {
		return "nav/personList";
	}
}
