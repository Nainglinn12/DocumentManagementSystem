package com.dms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dms.services.ShareFileAnotherService;

@Controller
public class ShareFileAnotherController {
	@Autowired
	private ShareFileAnotherService sharefile;
	@RequestMapping(value="/sharefile_another.htm")
	public String home(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getName();
		model.addAttribute("sharefile_list",sharefile.shareFile(username));
		return "share_file_another";
	}
	@RequestMapping(value="/sharefile_to_another.htm")
	public String sharefiletoanother(Model model) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = ((UserDetails)principal).getName();
		model.addAttribute("sharefile_to_another_list",sharefile.shareFileAnother(username));
		return "share_file_to_another";
	}
}