package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	
	private static final Logger logger = Logger.getLogger(ProductController.class);

	public ProductController() {
		System.out.println("ProductController()");
	}

	@Autowired
	private ProductService productService;
	
  
	  @RequestMapping(value = "/listProduct")
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
	public String saveProduct( @Valid @ModelAttribute Product product,BindingResult result){
		if (result.hasErrors()) {
			return "productform";
		}else if(product.getProductid() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			productService.addProduct(product);
		} else {
			productService.updateProduct(product);
		}
		return "redirect:/product/viewAll";
	}

	/*
	 * @RequestMapping(value = "/deleteProduct", method = RequestMethod.GET) public
	 * ModelAndView deleteProduct(HttpServletRequest request) { int productId =
	 * Integer.parseInt(request.getParameter("productid"));
	 * productService.deleteProduct(productId); return new
	 * ModelAndView("redirect:/"); }
	 */

	@RequestMapping(value ="/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(@RequestParam("productid") Integer productId) {
		productService.deleteProduct(productId);
		return "redirect:/product/listProduct ";
	}
    
	
	  @RequestMapping(value = "/editProduct", method = RequestMethod.GET) 
	  public ModelAndView editProduct(HttpServletRequest request) { 
		  int productId = Integer.parseInt(request.getParameter("productid"));
		  Product product = productService.getProduct(productId); 
		  ModelAndView model = new ModelAndView("productform"); model.addObject("product", product);
	  
	  return model;
	  }
	
	  
	  @ResponseBody
	  @RequestMapping(value ="/listProducts")
	  public List<Product> listandroidProduct(ModelAndView model) throws IOException {
	  List<Product> listProduct = productService.getAllProducts();
	  model.addObject("listProduct", listProduct);
	  return listProduct; 
	  }
	  
	  
	  
	    @RequestMapping(value="/viewAll",method=RequestMethod.GET)
		public String getAllProducts(HttpServletRequest req,Model model) {
			
			String category="";
			String prodStr=req.getParameter("category");
			
			if(prodStr==null){
				List<Product> listAllproducts=productService.getAllProducts();
				System.out.println(listAllproducts);
				if(!listAllproducts.isEmpty()) {
					model.addAttribute("productcatg",listAllproducts);
					return "productlist";
			}
			}
			
			else{
				if( prodStr!=null &&  !prodStr.equals("")) {
					category=prodStr;
			   }
				List<Product> productcatg=productService.getProductsBycatogary(category);
				model.addAttribute("productcatg", productcatg);
				return "productlist";
				
			}
			
			return "productlist";
			
			
			
	  
	  
}

}

	
	
	
	
	

	