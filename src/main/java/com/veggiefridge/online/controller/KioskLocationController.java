package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.veggiefridge.online.dao.KioskLocationDAO;
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.service.KioskLocationService;

@Controller
@RequestMapping(value = "/location")
public class KioskLocationController {

	private static final Logger logger = Logger.getLogger(KioskLocationController.class);

	public KioskLocationController() {
		System.out.println("KIoskLocationController.KIoskLocationController()");
	}

	@Autowired
	private KioskLocationService service;

	// get All Information
	@RequestMapping(value = "/listLocation")
	public ModelAndView listLocation(ModelAndView model) throws IOException {
		List<KioskLocation> listlocation = service.getAllLocation();
		model.addObject("listlocation", listlocation);
		model.setViewName("locationlist");
		return model;
	}

	// AddLocation
	@RequestMapping(value = "/newLocation", method = RequestMethod.GET)
	public ModelAndView newLocation(ModelAndView model) {
		KioskLocation kiosklocation = new KioskLocation();
		model.addObject("kiosklocation", kiosklocation);
		model.setViewName("locationform");
		return model;
	}

	// save location
	@RequestMapping(value = "/saveLocation", method = RequestMethod.POST)
	public String saveLocation(@Valid @ModelAttribute("kiosklocation") KioskLocation kiosklocation,
			BindingResult result) {

		if (result.hasErrors()) {
			return "locationform";
		} else if (kiosklocation.getLocationid() == 0) { // if employee id is 0 then creating the
			// employee other updating the employee
			service.addLocation(kiosklocation);
		} else {
			service.updateLocation(kiosklocation);
		}
		return "redirect:/location/listLocation";
	}

	// deletLocation
	@RequestMapping(value = "/deleteLocation", method = RequestMethod.GET)
	public String deleteLocation(@RequestParam("locationid") Long locationId, Model model) {
		service.deleteLocation(locationId);
		model.addAttribute("message", "KioskLocation '" + locationId + "' record Deleted");
		return "redirect:/location/listLocation";
	}

	// editLocation
	@RequestMapping(value = "/editLocation", method = RequestMethod.GET)
	public ModelAndView editLocation(HttpServletRequest request) {
		long locationid = Long.parseLong(request.getParameter("locationid"));
		KioskLocation kiosklocation = service.getLocation(locationid);
		ModelAndView model = new ModelAndView("locationform");
		model.addObject("kiosklocation", kiosklocation);
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
