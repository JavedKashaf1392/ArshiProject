package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.ProductService;

@Controller
//@RequestMapping(value = "/product")
public class ProductController {
	
	
	private static final Logger logger = Logger.getLogger(ProductController.class);

	public ProductController() {
		System.out.println("EmployeeController()");
	}

	@Autowired
	private ProductService productService;

	@RequestMapping(value = "/")
	public ModelAndView listProduct(ModelAndView model) throws IOException {
		List<Product> listProduct = productService.getAllProducts();
		model.addObject("listProduct", listProduct);
		model.setViewName("productlist");
		return model;
	}

	@RequestMapping(value = "/newProduct", method = RequestMethod.GET)
	public ModelAndView newProduct(ModelAndView model) {
		
		Product product = new Product();
		model.addObject("product", product);
		model.setViewName("productform");
		return model;
	}

	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public String saveProduct( @Valid @ModelAttribute Product product,BindingResult result) {
		if (result.hasErrors()) {
			return "productform";
		} else if (product.getProductid() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			productService.addProduct(product);
		} else {
			productService.updateProduct(product);
		}
		return "redirect:/";
	}

	/*
	 * @RequestMapping(value = "/deleteProduct", method = RequestMethod.GET) public
	 * ModelAndView deleteProduct(HttpServletRequest request) { int productId =
	 * Integer.parseInt(request.getParameter("productid"));
	 * productService.deleteProduct(productId); return new
	 * ModelAndView("redirect:/"); }
	 */

	@RequestMapping(value = "/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("productid") Integer productId) {
		productService.deleteProduct(productId);
		return "redirect:/ ";
	}

	
	
	  @RequestMapping(value = "/editProduct", method = RequestMethod.GET) 
	  public ModelAndView editProduct(HttpServletRequest request) { 
		  int productId = Integer.parseInt(request.getParameter("productid"));
		  Product product = productService.getProduct(productId); 
		  ModelAndView model = new ModelAndView("productform"); model.addObject("product", product);
	  
	  return model;
	  }
	 
	
}
	
	
	
	
	

	