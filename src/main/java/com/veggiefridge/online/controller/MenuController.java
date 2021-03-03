package com.veggiefridge.online.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.constants.VFOnlineConstants;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.Images;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Menu;
import com.veggiefridge.online.model.OrderItem;
import com.veggiefridge.online.model.Orders;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.model.SubMenu;
import com.veggiefridge.online.service.CartService;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.MenuService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping("menu")
public class MenuController {
	
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private KioskLocationService kiosklocationservice;
	
	@Autowired
	private CustomerService customerservice;
	
	@Autowired
	private CartService cartservice;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MenuService menuservice;

}
			
	   


