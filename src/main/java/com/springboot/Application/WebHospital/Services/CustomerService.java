package com.springboot.Application.WebHospital.Services;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.Application.WebHospital.Repository.Appointment;
import com.springboot.Application.WebHospital.Repository.Customer;
import com.springboot.Application.WebHospital.Repository.Doctor;
import com.springboot.Application.WebHospital.modal.appointment;
import com.springboot.Application.WebHospital.modal.customer;
import com.springboot.Application.WebHospital.modal.doctor;

@Service
public class CustomerService {

	@Autowired
	private Customer cust;
	
	@Autowired
	private Doctor doc;
	
	@Autowired
	private Appointment appoint;
	
	public customer getCustomer(String email,String password) {
		return cust.getCustomer(email, password);
	}
	
	public customer customerExists(String email) {
		return cust.customerExists(email);
	}
	
	public customer save(customer customer) {
		return cust.save(customer);
	}
	
	public String appoint(String description,Date dt,String time,appointment recieved) {
		List<doctor> list= doc.getDoctors("Doctor");
		for(doctor temp: list) {
			appointment ap=appoint.getAppoint(temp.getEmail(), dt, time);
			if(ap==null) {
				recieved.setDocId(temp);
				appoint.save(recieved);
				return temp.getName();
			}
		}
		return null;
		
	}
}
