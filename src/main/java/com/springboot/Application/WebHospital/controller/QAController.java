package com.springboot.Application.WebHospital.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.Application.WebHospital.Services.QAService;
import com.springboot.Application.WebHospital.modal.complains;

@Controller
public class QAController {
	

	@Autowired
	private QAService qaService;

	@RequestMapping("/complain")
	public String complain() {
		return "Complain";
	}
	
	@RequestMapping("/saveComplain")
	public String saveComplain(@RequestParam Map<String,String> map,HttpSession session) {
		try {
			complains temp=new complains();
			temp.setAge(Integer.parseInt(map.get("age")));
			temp.setDescription(map.get("comp"));
			temp.setEmail(map.get("email"));
			temp.setGender(map.get("inlineRadioOptions"));
			temp.setMobile(map.get("phone"));
			temp.setName(map.get("name"));
			
			session.setAttribute("msg", "Complaint Registered Successfully");
			return "redirect:/complain";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}
	
	@GetMapping("/Employee2")
	public String QAEmployee(Model model) {
		List<complains> list=qaService.getAll();
		model.addAttribute("list", list);
		return "QA";
	}
	
	@RequestMapping("/Contact")
	public String Contact() {
		return "Contact";
	}
	
}
