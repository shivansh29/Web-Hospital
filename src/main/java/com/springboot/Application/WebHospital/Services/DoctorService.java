package com.springboot.Application.WebHospital.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.Application.WebHospital.Repository.Doctor;
import com.springboot.Application.WebHospital.modal.doctor;

@Service
public class DoctorService {
	
	@Autowired
	private Doctor doc;
	
	public doctor doctorLogin(String email,String pass) {
		
		return doc.getCustomer(email, pass);
	}

	public String saveEmployee(doctor temp) {
		try {
			if(doc.checkEmployee(temp.getEmail())!=null)
				return "Exists";
			doc.save(temp);
			return "done";
		}
		catch(Exception e) {
			return "exception";
		}
	}
	
	public String delete(String email) {
		try {
			if(doc.checkEmployee(email)!=null) {
				doc.deleteById(email);
				return "done";
			}
			return "exists";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "exception";
		}
	}
}
