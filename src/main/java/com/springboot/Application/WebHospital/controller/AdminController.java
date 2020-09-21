package com.springboot.Application.WebHospital.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.Application.WebHospital.Services.DoctorService;
import com.springboot.Application.WebHospital.Services.JobsService;
import com.springboot.Application.WebHospital.Services.MedicineService;
import com.springboot.Application.WebHospital.Services.QAService;
import com.springboot.Application.WebHospital.modal.doctor;
import com.springboot.Application.WebHospital.modal.jobs;
import com.springboot.Application.WebHospital.modal.medicine;

@Controller
public class AdminController {
	
	@Autowired
	private MedicineService Med;
	
	@Autowired
	private DoctorService docService;
	
	@Autowired
	private JobsService jobService;
	
	@Autowired
	private QAService qaService;

	@RequestMapping("/Store")
	public String store(@RequestParam Map<String,String> map) {
		
		medicine medic =new medicine();
		medic.setURL(map.get("url"));
		medic.setName(map.get("name"));
		medic.setPrescription(map.get("pres"));
		medic.setPrice("Rs"+map.get("price"));
		medic.setQuantity(Integer.parseInt(map.get("quantity")));

        String mfg=map.get("mfg");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
        LocalDate localDate = LocalDate.parse(mfg,formatter);
         java.sql.Date mfgDt = java.sql.Date.valueOf( localDate );
        medic.setMfg(mfgDt);
        
        String exp=map.get("exp");
        LocalDate localDate2 = LocalDate.parse(exp,formatter);
         java.sql.Date expDt = java.sql.Date.valueOf( localDate2 );
         medic.setExp(expDt);
         
        String text=Med.enterMedicine(medic);
        
        if(text.equals("done"))
		return "redirect:/config";
        
        else
        return "Error";
		
	}
	
	@GetMapping("/config")
	public String getPage() {
		return "admin";
	}
	
	@RequestMapping("/DeleteObject")
	public String delete(@RequestParam("id") String name,@RequestParam("serv") String type,HttpSession session) {
		if(type.equals("comp")) {
			String text=qaService.delete(Integer.parseInt(name));
			if(text.equals("exception")) {
				return "Error";
			}
			else if(text.equals("done"))
				session.setAttribute("msg1", "deleted Sucessfully");
			else
				session.setAttribute("msg1", "Does Not Exists");
			
			
			return "redirect:/Employee2";
		}
		else if(type.equals("med")) {
			String text=Med.delete(name);
			if(text.equals("exception")) {
				return "Error";
			}
			else if(text.equals("done"))
				session.setAttribute("msg1", "deleted Sucessfully");
			else
				session.setAttribute("msg1", "Does Not Exists");
			
		}
		else if(type.equals("emp")) {
			String text=docService.delete(name);
			if(text.equals("exception")) {
				return "Error";
			}
			else if(text.equals("done"))
				session.setAttribute("msg1", "deleted Sucessfully");
			else
				session.setAttribute("msg1", "Does Not Exists");
		}
		else if(type.equals("job")) {
			String text=jobService.delete(Integer.parseInt(name));
			if(text.equals("exception")) {
				return "Error";
			}
			else if(text.equals("done"))
				session.setAttribute("msg1", "deleted Sucessfully");
			else
				session.setAttribute("msg1", "Does Not Exists");
		}
		return "redirect:/config";
		
	}
	
	@GetMapping("/Hire")
	public String hirePage() {
		return "Hire";
	}
	
	@RequestMapping("/hireEmployee")
	public String hireEmployee(@RequestParam Map<String,String> map,HttpSession session) {
		doctor temp=new doctor();
		temp.setAadhar(map.get("aadhar"));
		temp.setAddress(map.get("address"));
		temp.setAge(Integer.parseInt(map.get("age")));
		temp.setCity(map.get("city"));
		temp.setCollege(map.get("college"));
		
		String dob=map.get("dob");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
        LocalDate localDate = LocalDate.parse(dob,formatter);
         java.sql.Date dt = java.sql.Date.valueOf( localDate );
		
		temp.setDob(dt);
		temp.setEmail(map.get("email"));
		temp.setField(map.get("field"));
		temp.setGender(map.get("inlineRadioOptions"));
		temp.setMobile(map.get("mobile"));
		temp.setName(map.get("name"));
		temp.setPan(map.get("pan"));
		temp.setPassword(map.get("pass"));
		temp.setState(map.get("state"));
		
		String text=docService.saveEmployee(temp);
		if(text.equals("done"))
			session.setAttribute("msg", "Employee Registered");
		else if(text.equals("Exists"))
			session.setAttribute("msg", "Already Registered");
		else
			return "Error";
			
		
		return "redirect:/Hire";
	}
	
	
	@RequestMapping("/Jobs")
	public String getJobs(Model model) {
		List<jobs> list=jobService.getAllJobs();
		model.addAttribute("list",list);
		return "TotalJobs";
	}


	@RequestMapping("/PostJob")
	public String saveJob(@RequestParam Map<String,String> map,HttpSession session) {
		jobs jb=new jobs();
		jb.setPosition(map.get("pos"));
		jb.setDescription(map.get("descrip"));
		jb.setExperience(Integer.parseInt(map.get("experience")));
		jb.setSalary(Integer.parseInt(map.get("sal")));
		String text = jobService.saveJob(jb);
		if(text.equals("done")){
			session.setAttribute("msg1", "Job Added Successfully");
			return "redirect:/config";
		}
		else
			return "Error";
			
	}
}



