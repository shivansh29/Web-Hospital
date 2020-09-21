package com.springboot.Application.WebHospital.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.sql.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.Application.WebHospital.Services.AppointService;
import com.springboot.Application.WebHospital.Services.CustomerService;
import com.springboot.Application.WebHospital.Services.DoctorService;
import com.springboot.Application.WebHospital.Services.MedicineService;
import com.springboot.Application.WebHospital.Services.QAService;
import com.springboot.Application.WebHospital.modal.appointment;
import com.springboot.Application.WebHospital.modal.complains;
import com.springboot.Application.WebHospital.modal.customer;
import com.springboot.Application.WebHospital.modal.doctor;

@Controller
public class ApplicationController {
	@Autowired
	private MedicineService med;
	
	@Autowired
	private DoctorService doc;
	
	@Autowired
	private CustomerService Customer;
	
	@Autowired
	private AppointService checkAppointment;
	
	@Autowired
	private QAService qaService;

	
	@RequestMapping("/home")
	public String hello() {
		
		return "home";
	}
	
	
	@RequestMapping("/Login")
	public String login(@RequestParam Map<String,String> map,HttpSession session,Model model) {
		try {
		
		if(map.get("kind").equals("Customer")) {
			customer ct=Customer.getCustomer(map.get("user"), map.get("pass"));
			if(ct==null) {
				session.setAttribute("msg", "Invalid User or Password");
				return "home";
			}
			else {
				//System.out.println(ct.getName());
				session.setAttribute("customer",ct);
				return "customer";
			}
		}
		else if(map.get("kind").equals("Employee")) {
			doctor dt=doc.doctorLogin(map.get("user"), map.get("pass"));
			
			if(dt==null) {
				session.setAttribute("msg", "Invalid User or Password");
				return "home";
			}
			else if(dt.getField().equals("Doctor")) {
			//	System.out.println("sssssssssssssssssssssssssssssssssssssssssss");
				Date date = Date.valueOf(LocalDate.now());
				List<appointment> list=checkAppointment.getAppoint(map.get("user"), date);
				model.addAttribute("list",med.getPrices());
				model.addAttribute("appointList",list);
				model.addAttribute("customer", Customer);
				System.out.println(list.size());
				return "Doctor";
			}
			else if(dt.getField().equals("Q & A Section")) {
				List<complains> list=qaService.getAll();
				model.addAttribute("list", list);
				return "QA";	
			}
			else {
				session.setAttribute("msg", "Some other problem");
				return "home";
			}
		}
		else {
			if(map.get("user").equals("Shivansh")&& map.get("pass").equals("shivansh29")) {
				return "admin";
			}
			else {
				session.setAttribute("msg", "Invalid User or Password");
				return "home";
			}
		}
		
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return "Error";
		}
	}
	
	@RequestMapping("/RegisterPage")
	public String register() {
		return "Register";
	}
	
	
	@RequestMapping("/RegisterUser")
	public String registerCustomer(@RequestParam Map<String,String> map,HttpSession session) {
		customer newCustomer=new customer();
		newCustomer.setAge(Integer.parseInt(map.get("age")));
		newCustomer.setAddress(map.get("address"));
		newCustomer.setCity(map.get("city"));
		newCustomer.setEmail(map.get("email"));
		newCustomer.setGender(map.get("inlineRadioOptions"));
		newCustomer.setMobile(map.get("phone"));
		newCustomer.setName(map.get("name"));
		newCustomer.setPassword(map.get("pass"));
		newCustomer.setState(map.get("state"));
		String dob=map.get("dob");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
        LocalDate localDate = LocalDate.parse(dob,formatter);
         java.sql.Date dt = java.sql.Date.valueOf( localDate );
 		newCustomer.setDob(dt);
         
         
 		customer ct=Customer.customerExists(map.get("email"));
 		if(ct==null)
		try {
			Customer.save(newCustomer);
 			session.setAttribute("msg", "User Successfully Registered");
		}
		catch(Exception e) {
			return "Error";
		}
 		else {
 			session.setAttribute("msg", "User Already Exists");
 		}
 		return "Register";
	}
}
