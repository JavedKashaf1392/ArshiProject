package com.veggiefridge.online.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
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
import com.veggiefridge.online.model.KioskLocation;
import com.veggiefridge.online.service.KioskLocationService;
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

	@Autowired
	private KioskLocationService kiosklocationservice;

	// get All Information
	@RequestMapping(value = "/listKiosk")
	public ModelAndView listKiosk(ModelAndView model) throws IOException {
		List<Kiosk> listkiosk = service.getAllKisok();
		model.addObject("listkiosk", listkiosk);
		model.setViewName("kiosklist");
		return model;
	}

	// newKiosk
	@RequestMapping(value = "/newKiosk")
	public ModelAndView newKiosk(ModelAndView model, @ModelAttribute("kiosklocation") KioskLocation kiosklocation,
			BindingResult resultlocation, @ModelAttribute("kiosk") Kiosk kiosk, BindingResult resultkiosk) {
		List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
		model.addObject("listkiosklocation", listkiosklocation);
		model.setViewName("addkiosk");
		return model;
	}

	// save location
	@RequestMapping(value = "/saveKiosk", method = RequestMethod.POST)
	public String saveKiosk(@ModelAttribute("kiosk") Kiosk kiosk, BindingResult resultkiosk,
			@ModelAttribute("kiosklocation") KioskLocation kiosklocation, BindingResult resultlocation) {

		if (kiosk.getId() == 0) { // if kiosk id is 0 then creating the
			// kiosk other updating the kiosk
			System.out.println("addKiosk method is running");
			service.addKiosk(kiosk);
		}
		return "redirect:/kiosk/listKiosk";
		// else {
		// System.out.println("updateKiosk method is running");
		// service.updateKiosk(kiosk);
		// }
	}

	// deletLocation
	@RequestMapping(value = "/deleteKiosk", method = RequestMethod.GET)
	public String deleteKiosk(@RequestParam("id") Long id, Model model) {
		service.deleteKiosk(id);
		model.addAttribute("message", "Kiosk '" + id + "' record Deleted");
		return "redirect:/kiosk/listKiosk";
	}

	// editLocation
	// @RequestMapping(value = "/editKiosk", method = RequestMethod.GET)
	// public ModelAndView editKiosk(HttpServletRequest request) {
	// long id = Long.parseLong(request.getParameter("id"));
	// Kiosk kiosk = service.getKiosk(id);
	// ModelAndView model = new ModelAndView("kioskform");
	// model.addObject("kiosk", kiosk);
	// return model;
	// }

	// editKiosk
	@RequestMapping(value = "/editKiosk", method = RequestMethod.GET)
	public ModelAndView editKiosk(HttpServletRequest request) {
		List<KioskLocation> listkiosklocation = kiosklocationservice.getAllLocation();
		long id = Long.parseLong(request.getParameter("id"));
		Kiosk kiosk = service.getKiosk(id);
		ModelAndView model = new ModelAndView("editkiosk");
		model.addObject("listkiosklocation", listkiosklocation);
		model.addObject("kiosk", kiosk);
		return model;
	}

	// save location
	@RequestMapping(value = "/updateKiosk", method = RequestMethod.POST)
	public String updateKiosk(@ModelAttribute("kiosk") Kiosk kiosk, BindingResult resultkiosk,
			@ModelAttribute("kiosklocation") KioskLocation kiosklocation, BindingResult resultlocation) {

		if (kiosk.getId() != 0) { // if kiosk id is not equal to 0 then
			// updating the kiosk

			System.out.println("updateKiosk method is running");
			service.updateKiosk(kiosk);
		}
		return "redirect:/kiosk/listKiosk";
	}

}
