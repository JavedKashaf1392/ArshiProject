package com.veggiefridge.online.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AppController {

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String homePage(ModelMap model){

		model.addAttribute("greeting", "Hi, Welcome to mysite. ");
		return "welcome";
	}

	/*
	 * @RequestMapping(value = "/admin", method = RequestMethod.GET) public String
	 * adminPage(ModelMap model) { List<Product> listProduct =
	 * productService.getAllProducts(); model.addAttribute("listProduct",
	 * listProduct); model.addAttribute("user", getPrincipal()); return "adminpage";
	 * }
	 */

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String dbaPage(ModelMap model) {
		return "admin";
	}
	
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String dba(ModelMap model) {
		return "dba";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	   public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	      Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	      if (auth != null){    
	         new SecurityContextLogoutHandler().logout(request, response, auth);
	      }
	      return "welcome";
	   }

	@RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
	public String accessDeniedPage(ModelMap model) {
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	@RequestMapping(value="/login")
	public ModelAndView visitAdmin(){
		ModelAndView model = new ModelAndView("loginform");
		model.addObject("title", "login");
		//model.addObject("message", "This page demonstrates how to use Spring security.");
		return model;
	}
	
	
	  @RequestMapping(value="/defaultTarget")
	  public String defaultTargetPage(ModelMap model){
	   return "allLogin";
	   } 
}

