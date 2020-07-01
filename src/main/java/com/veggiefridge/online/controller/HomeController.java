package com.veggiefridge.online.controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value="/home")
public class HomeController {
	
	public HomeController() {
		System.out.println("Home.Home()");
	}
	
	@Autowired
	private ProductService productService;
	
	
	/*
	 * //view login
	 * 
	 * @RequestMapping(value = "/viewhome", method = RequestMethod.GET) public
	 * ModelAndView showLogin(HttpServletRequest request, HttpServletResponse
	 * response) { ModelAndView mav = new ModelAndView("newhome"); return mav; }
	 */
	 

	@RequestMapping(value = "/viewhome")
	public ModelAndView listProduct(ModelAndView model) throws IOException {
		List<Product> listProduct = productService.getAllProducts();
		model.addObject("listProduct", listProduct);
		model.setViewName("newhome");
		return model;
	}
	 
	 
	 
}
