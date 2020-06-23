package com.veggiefridge.online.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	
	public HomeController() {
		System.out.println("Home.Home()");
	}
	
	 //view login
	 @RequestMapping(value = "/viewhome", method = RequestMethod.GET)
	 public ModelAndView showLogin(HttpServletRequest request, HttpServletResponse response) {
	 ModelAndView mav = new ModelAndView("home");
	 return mav;
	  }
	 

}
