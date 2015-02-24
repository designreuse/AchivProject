package com.ita.softserveinc.achiever.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ita.softserveinc.achiever.service.IApplicationService;
import com.ita.softserveinc.achiever.service.IGroupService;
import com.ita.softserveinc.achiever.service.IRoleService;
import com.ita.softserveinc.achiever.service.IUserService;

/**
 * 
 * @author Andriana
 *
 */
@Controller
public class ApplicationController {

	@Autowired
	private IApplicationService applicationService;

	@Autowired
	private IGroupService groupService;

	@Autowired
	private IUserService userService;

	@Autowired
	private IRoleService roleService;

	@RequestMapping("/applications")
	public String listApplications(Model model, Principal principal) {
		model.addAttribute("applicationList",
				applicationService.findByManagerLogin(principal.getName()));
		return "application/application";
	}

	@RequestMapping(value = "/application/confirm/{applicationId}")
	public String confirmApplication(@PathVariable("applicationId") Long id) {
		applicationService.confirmApplication(id);
		return "redirect:/applications";
	}

	@RequestMapping(value = "/application/delete/{applicationId}")
	public String deleteApplication(@PathVariable("applicationId") Long id,
			Model model) {
		applicationService.delete(id);
		return "redirect:/applications";
	}

}
