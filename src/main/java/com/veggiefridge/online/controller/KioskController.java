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
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.model.Kiosk;
import com.veggiefridge.online.service.KioskService;

	@Controller
	@RequestMapping(value = "/kiosk")
	public class KioskController {

		private static final Logger logger = Logger.getLogger(KioskController.class);

		public KioskController() {
			System.out.println("KioskController.KioskController()");
		}

		@Autowired
		private KioskService service;
		
		  // get All Information
		  @RequestMapping(value = "/listKiosk")
		  public ModelAndView listKiosk(ModelAndView  model) throws IOException {
		  List<Kiosk> listkiosk =service.getAllKisok();
		  model.addObject("listkiosk",listkiosk);
		  model.setViewName("kiosklist"); 
		  return model; 
		  }
		  
		  
		    // AddLocation
			@RequestMapping(value ="/newKiosk", method = RequestMethod.GET)
			public ModelAndView newKiosk(ModelAndView model) {
				Kiosk kiosk = new Kiosk();
				model.addObject("kiosk", kiosk);
				model.setViewName("kioskform");
				return model;
			}

		
		// save location
		@RequestMapping(value = "/saveKiosk", method = RequestMethod.POST)
		public String saveKiosk(@Valid @ModelAttribute("kiosk") Kiosk kiosk,
				BindingResult result) {

			if (result.hasErrors()) {
				return "locationform";
			} else if (kiosk.getKioskId() == 0) { // if employee id is 0 then creating the
				// employee other updating the employee
				service.addKiosk(kiosk);
			} else {
				service.updateKiosk(kiosk);
			}
			return "redirect:/kiosk/listKiosk";
		}

		
		// deletLocation
		@RequestMapping(value = "/deleteKiosk", method = RequestMethod.GET)
		public String deleteKiosk(@RequestParam("kioskId") Long kioskId,Model model) {
		    service.deleteKisok(kioskId);
			model.addAttribute("message", "Kiosk '"+kioskId+"' record Deleted");
			return "redirect:/kiosk/listKiosk";
		}
	      
		// editLocation
		@RequestMapping(value = "/editKiosk", method = RequestMethod.GET)
		public ModelAndView editKiosk(HttpServletRequest request) {
			long kioskId = Long.parseLong(request.getParameter("kioskId"));
			Kiosk kiosk = service.getKiosk(kioskId);
			ModelAndView model = new ModelAndView("kioskform");
			model.addObject("kiosk", kiosk);
			return model;
		}

		/*
		 * //search location
		 * 
		 * @RequestMapping(value = "/searchLocation", method = RequestMethod.GET) public
		 * String searchLocation(@RequestParam("searchText") String searchText,Model
		 * model) { List<KioskLocation> listlocation
		 * =service.getLocationName(searchText); model.addAttribute(listlocation);
		 * return "redirect:/";
		 * 
		 * 
		 * }
		 */
		
		
		
		
	}


