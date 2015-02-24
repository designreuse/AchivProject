package com.ita.softserveinc.achiever.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ita.softserveinc.achiever.entity.Group;
import com.ita.softserveinc.achiever.exception.ElementExistsException;
import com.ita.softserveinc.achiever.exception.InvalidDateException;
import com.ita.softserveinc.achiever.service.IApplicationService;
import com.ita.softserveinc.achiever.service.IDirectionService;
import com.ita.softserveinc.achiever.service.IGroupService;
import com.ita.softserveinc.achiever.service.IRoleService;
import com.ita.softserveinc.achiever.service.IUserService;
import com.ita.softserveinc.achiever.tool.GroupFormBean;

/**
 * 
 * @author Andriana
 * 
 */
@Controller
public class GroupController {

	@Autowired
	private IGroupService groupService;

	@Autowired
	private IDirectionService directionService;

	@Autowired
	private IUserService userService;

	@Autowired
	private IRoleService roleService;

	@Autowired
	private IApplicationService applicationService;

	@RequestMapping("/groups")
	@PreAuthorize(value = "isAuthenticated()")
	public String getListGroups(Model model, Principal principal) {
		model.addAttribute("groupFormBean", new GroupFormBean());
		model.addAttribute("directionList", directionService.findAll());
		model.addAttribute("managerList", userService.findManagers());
		if (userService.isOnlyUser(principal.getName())) {
			model.addAttribute("futureGroups", groupService.findFutureGroups());
			return "group/futuregroups";
		}
		model.addAttribute("groupList",
				groupService.getChosenGroups(principal.getName()));
		model.addAttribute("resultsOnPage",
				groupService.getResultsOnPageCount());
		return "group/group";
	}

	@RequestMapping("/filterGroup")
	public @ResponseBody
	List<Group> getFilteredGroups(
			@RequestParam(value = "direction") String directionName,
			@RequestParam(value = "startFrom") String startFrom,
			@RequestParam(value = "startTo") String startTo,
			@RequestParam(value = "finishFrom") String finishFrom,
			@RequestParam(value = "finishTo") String finishTo,
			Principal principal) {
		List<Group> result = groupService.getFilteredGroups(directionName,
				startFrom, startTo, finishFrom, finishTo, principal.getName());
		return result;
	}

	@RequestMapping("/chooseGroup")
	public @ResponseBody
	List<Group> helloTable2(@RequestParam(value = "future") boolean future,
			@RequestParam(value = "current") boolean current,
			@RequestParam(value = "finished") boolean finished,
			Principal principal) {
		return groupService.getChosenGroups2(future, current, finished,
				principal.getName());
	}

	@RequestMapping(value = "/addGroup", method = RequestMethod.POST)
	public String addGroup(
			@ModelAttribute("groupFormBean") GroupFormBean groupFormBean,
			BindingResult result, RedirectAttributes redirectAttributes) {
		try {
			groupService.create(groupService.getGroup(groupFormBean));
		} catch (ElementExistsException e) {
			redirectAttributes.addFlashAttribute("groupexists", true);
			return "redirect:/groups";
		} catch (InvalidDateException e) {
			redirectAttributes.addFlashAttribute("invaliddate", true);
			return "redirect:/groups";
		}
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/groups";
	}

	@RequestMapping(value = "/editGroup", method = RequestMethod.POST)
	public String editGroup(
			@ModelAttribute("groupFormBean") GroupFormBean groupFormBean,
			BindingResult result, RedirectAttributes redirectAttributes) {
		try {
			groupService.update(groupService.getGroupToEdit(groupFormBean));
		} catch (ElementExistsException e) {
			redirectAttributes.addFlashAttribute("groupexists", true);
			return "redirect:/groups";
		} catch (InvalidDateException e) {
			redirectAttributes.addFlashAttribute("invaliddate", true);
			return "redirect:/groups";
		}
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/groups";
	}
	
	@RequestMapping(value = "/editGroup")
	public String editGroup(
			@RequestParam(value="name") String name,
			@RequestParam(value="start") String start,
			@RequestParam(value="end") String end,
			@RequestParam(value="direction") String directionName,
			@RequestParam(value="manager") String manager){
		return "redirect:/groups";
	}

	@RequestMapping("/group/delete/{groupId}")
	public String deleteGroup(@PathVariable("groupId") Long id) {
		Group group = groupService.findById(id);
		groupService.delete(group);
		return "redirect:/groups";
	}

	@RequestMapping("/group/apply/{groupId}")
	public String applyToGroup(@PathVariable("groupId") Long id,
			Principal principal, RedirectAttributes redirectAttributes) {
		try {
			groupService.applyToGroup(id, principal.getName());
		} catch (ElementExistsException e) {
			redirectAttributes.addFlashAttribute("fail", true);
			return "redirect:/groups";
		}
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/groups";
	}

	@RequestMapping("/group/{groupId}")
	public String showGroupDetail(Model model, @PathVariable("groupId") Long id) {
		Group group = groupService.findById(id);
		model.addAttribute("group", group);
		model.addAttribute(
				"userList",
				userService.findByGroup(group,
						roleService.findByType("ROLE_STUDENT")));
		model.addAttribute(
				"managerList",
				userService.findByGroup(group,
						roleService.findByType("ROLE_MANAGER")));
		return "group/groupInfo";
	}

}
