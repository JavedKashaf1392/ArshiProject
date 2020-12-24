package com.veggiefridge.online.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.veggiefridge.online.model.CartPage;
import com.veggiefridge.online.model.Customer;
import com.veggiefridge.online.model.CustomerModel;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.model.Product;
import com.veggiefridge.online.service.CustomerService;
import com.veggiefridge.online.service.KioskLocationService;
import com.veggiefridge.online.service.ProductService;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

	private static final Logger logger = Logger.getLogger(CustomerController.class);

	public CustomerController() {
		System.out.println("CustomerController()");
	}

	@Autowired
	private CustomerService customerService;

	@Autowired
	private EncryptPassword enpwd;

	@Autowired
	private HttpSession session;

	// get cartPage
	/*
	 * private CartPage getCartPage() { return ((CustomerModel)
	 * session.getAttribute("customerModel")).getCartpage(); }
	 */

	// getAll Customer
	@RequestMapping(value = "/listCustomer")
	public ModelAndView listCustomer(ModelAndView model) throws IOException {
		List<Customer> listCustomer = customerService.getAllCustomers();
		model.addObject("listCustomer", listCustomer);
		model.setViewName("customerlist");
		return model;
	}

	// add customer
	@RequestMapping(value = "/newCustomer", method = RequestMethod.GET)
	public ModelAndView newCustomer(ModelAndView model) {
		Customer customer = new Customer();
		model.addObject("customer", customer);
		model.setViewName("customerform");
		return model;
	}

	// save and update customer
	@RequestMapping(value = "/saveCustomer", method = RequestMethod.POST)
	public String saveCustomer(@Valid @ModelAttribute("customer") Customer customer, BindingResult result,
			HttpSession session) throws NoSuchAlgorithmException {
		if (result.hasErrors()) {
			return "customerform";

		} else if (customer.getCustomerid() == 0) { // if customer id is 0 then creating the
			// customer other updating the customer
			// String passwordToHash =customer.getPassword();
			// byte[] salt = getSalt();
			String roles = "ROLE_USER";
			customer.setRole(roles);
			// String securePassword = get_SHA_256_SecurePassword(passwordToHash, salt);
			// customer.setPassword(securePassword);
			customer.setPassword(EncryptPassword.sha256(customer.getPassword()));

			customerService.addCustomer(customer);
			logger.info("Customer Registered successfully");
			session.setAttribute("customer", customer);
		} else {
			customerService.updateCustomer(customer);
		}
		return "redirect:/customer/listCustomer";
	}

	private static String get_SHA_256_SecurePassword(String passwordToHash, byte[] salt) {
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(salt);
			byte[] bytes = md.digest(passwordToHash.getBytes());
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < bytes.length; i++) {
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return generatedPassword;
	}

	// Add salt
	private static byte[] getSalt() throws NoSuchAlgorithmException {
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
		byte[] salt = new byte[16];
		sr.nextBytes(salt);
		return salt;
	}

	// edit customer
	@RequestMapping(value = "/editCustomer", method = RequestMethod.GET)
	public ModelAndView editCustomer(HttpServletRequest request) {
		int customerid = Integer.parseInt(request.getParameter("customerid"));
		Customer customer = customerService.getCustomer(customerid);
		ModelAndView model = new ModelAndView("customerform");
		model.addObject("customer", customer);
		return model;
	}

	// delete customer
	@RequestMapping(value = "/deleteCustomer", method = RequestMethod.GET)
	public String deleteCustomer(@RequestParam("customerid") Integer customerId) {
		customerService.deleteCustomer(customerId);
		return "redirect:/customer/listCustomer ";
	}

	// getAll Customer
	@RequestMapping(value = "/androidlistCustomer")
	@ResponseBody
	public List<Customer> androidCustomer() {
		List<Customer> listCustomer = customerService.getAllCustomers();
		return listCustomer;
	}

//////////////////////////////////////////////////////////////
/////////////////////////////////////////////// Customer API's

// Login customer into database
// http://localhost:8082/vfs-online/android/login?email=me@gmail.com&password=90
	@ResponseBody
	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public Customer loginCustomer(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(email + password);
		Customer customer = new Customer();
		customer.setEmail(email);
		customer.setPassword(password);
		customer = customerService.loginCustomer(customer);

		if (customer != null) {
			return customer;
		} else
			customer.setCustomerid(0);
		return customer;
	}

	// edit customer
	@RequestMapping(value = "/searchCustomer", method = RequestMethod.GET)
	public ModelAndView searchCustomer(HttpServletRequest request) {
		int customerid = Integer.parseInt(request.getParameter("customerid"));
		Customer customer = customerService.getCustomer(customerid);
		ModelAndView model = new ModelAndView("cust");
		model.addObject("customer", customer);
		return model;
	}

	// edit customer
	/*
	 * @RequestMapping(value = "/editProfile{customerid}", method =
	 * RequestMethod.GET) public ModelAndView editProfile() {
	 * System.out.println("editProfile"); Customer customer =
	 * customerService.getCustomer(this.getCartPage().getCustomer().getCustomerid())
	 * ; System.out.println("customer" + customer.toString());
	 * System.out.println("customName" + customer.getFirstName()); ModelAndView
	 * model = new ModelAndView("editprofile"); model.addObject("customer",
	 * customer); return model; }
	 */
	// save and update customer
	/*
	 * @RequestMapping(value = "/saveEditProfile", method = RequestMethod.POST)
	 * public String saveEditCustomer(@Valid @ModelAttribute("customer") Customer
	 * customer, BindingResult result, HttpSession session) throws
	 * NoSuchAlgorithmException { customerService.updateCustomer(customer); return
	 * "redirect:/customer/editProfile/{customerid}"; }
	 */
	// changePassword
	/*
	 * @RequestMapping(value = "/changePassword/{email}") public String
	 * resetPassword(@PathVariable String email, Model model) { //check if the email
	 * id is valid and registered with us. Customer customer = new Customer();
	 * customer.setEmail(email); model.addAttribute("customer", customer); return
	 * "editPassword"; }
	 */

	// mapping set New Password
	/*
	 * @RequestMapping(value = "/newPasswordChange", method = RequestMethod.POST)
	 * public String setNewPassword(@ModelAttribute("customer") Customer cust,
	 * ModelMap map, BindingResult resultcust) {
	 * 
	 * Customer customer = customerService.getCustomerByEmail(cust.getEmail()); if
	 * (customer != null) {
	 * 
	 * // update password and Acct Status $ Displyay Successe Message
	 * 
	 * customer.setPassword(cust.getNewPassword());
	 * customer.setPassword(EncryptPassword.sha256(cust.getNewPassword()));
	 * customerService.updateCustomer(customer);
	 * System.out.println("update customer successfully"); }
	 * 
	 * return "redirect:/customer/changePassword/{email}"; }
	 */

}
