package com.springboot.Application.WebHospital.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.Application.WebHospital.Repository.Jobs;
import com.springboot.Application.WebHospital.modal.jobs;

@Service
public class JobsService {

	@Autowired
	private Jobs jobAll;
	
	public List<jobs> getAllJobs(){
		return jobAll.findAll();
	}
	
	public String saveJob(jobs jb) {
		try {
		jobAll.save(jb);
		return "done";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "exception";
		}
	}
	
	public String delete(int Id) {
		try {
			if(jobAll.findById(Id)!=null) {
				jobAll.deleteById(Id);
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
