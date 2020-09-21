package com.springboot.Application.WebHospital.controller;

import java.io.InputStream;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.zxing.BinaryBitmap;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.HybridBinarizer;
import com.springboot.Application.WebHospital.Services.AppointService;
import com.springboot.Application.WebHospital.Services.CustomerService;
import com.springboot.Application.WebHospital.Services.MedicineService;
import com.springboot.Application.WebHospital.modal.appointment;
import com.springboot.Application.WebHospital.modal.customer;
import com.springboot.Application.WebHospital.modal.medicine;

@Controller
public class CustomerController {

	@Autowired
	private MedicineService med;
	
	@Autowired
	private AppointService appoint;
	
	@Autowired
	private CustomerService custServ;
	
	@RequestMapping("/pay")
	public String hello(@RequestParam("image") MultipartFile file,Model model) {
		try {
			InputStream in = file.getInputStream();
			Result re=new MultiFormatReader().decode(new BinaryBitmap(new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(in)))));
            String text=re.getText();
            StringTokenizer st = new StringTokenizer(text,"-");  
            HashMap<String,Double> listMap=med.getPricesAndProduct();
            //System.out.println(listMap);
            //System.out.println(listMap.get(0).get("0"));
            double price=0;
            while (st.hasMoreTokens()){
                String name=st.nextToken();
                int qty=Integer.parseInt(st.nextToken());
                price+=(qty*listMap.get(name));
             //   System.out.println(name+"   "+qty+"   "+price);
            }
            
            model.addAttribute("Price", price);
            return "PaytmPayment";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "Error";
		}
	}
	
	
	@RequestMapping("/Appointment")
	public String appoint(Model model,HttpSession session) {
		model.addAttribute("customer", (customer)session.getAttribute("customer"));
		return "appoint";
	}
	
	@RequestMapping("/CheckSlot")
	public String check(@RequestParam Map<String,String> map,HttpSession session,Model model) {
		try {
		String dob=map.get("dob");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d/MM/yyyy");
        LocalDate localDate = LocalDate.parse(dob,formatter);
         java.sql.Date dt = java.sql.Date.valueOf( localDate );
         appointment temp=new appointment();
         temp.setDate(dt);
         temp.setTime(map.get("time"));
         temp.setDescription(map.get("prob"));
         temp.setCustomerId(((customer)session.getAttribute("customer")).getEmail());
        //  System.out.println("Weeeeeeeeeeeeeeeeeeeeeeeee"+"\n"+custServ);
         String text=custServ.appoint(map.get("prob"), dt, map.get("time"), temp);
         if(text==null)
        	 session.setAttribute("msg", "Please choose another slot");
		else
			session.setAttribute("msg", "Your Appointment is fixed with "+text+" on "+map.get("dob")+" at "+map.get("time"));
         
         return "redirect:/Appointment";
		}
		catch(Exception e) {
			System.out.println("ttttttttttttt");
			e.printStackTrace();
			return "Error";
		}
	}
	
	@RequestMapping("/Shopping")
	public String shop(Model model,HttpSession session) {
		List<medicine> list=med.getPrices();
		model.addAttribute("list",list);
		return "store";
	}
	
}
