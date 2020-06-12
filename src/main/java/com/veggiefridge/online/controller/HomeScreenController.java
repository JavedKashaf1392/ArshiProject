package com.veggiefridge.online.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/homescreen")
public class HomeScreenController {
	
	public HomeScreenController() {
		System.out.println("HomeScreen.HomeScreen()");
	}
	
	 //view login
	 @RequestMapping(value = "/viewhomescreeen", method = RequestMethod.GET)
	 public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
	 ModelAndView mav = new ModelAndView("homescreen");
	 return mav;
	  }
	

}
