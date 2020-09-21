package com.springboot.Application.WebHospital.Services;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.Application.WebHospital.Repository.Appointment;
import com.springboot.Application.WebHospital.modal.appointment;

@Service
public class AppointService {

	@Autowired
	private Appointment appoint;
	
	public List<appointment> getAppoint(String mail,Date dt){
		return appoint.getAppointment(mail, dt);
	}
}
