package com.springboot.Application.WebHospital.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.Application.WebHospital.Repository.Complaints;
import com.springboot.Application.WebHospital.modal.complains;

@Service()
public class QAService {

	@Autowired
	private Complaints comp;
	
	public complains save(complains temp) {
		return comp.save(temp);
	}
	
	public List<complains> getAll(){
		return comp.findAll();
	}
	
	public String delete(int Id) {
		try {
			comp.deleteById(Id);
			return "done";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "exception";
		}
	}
}
