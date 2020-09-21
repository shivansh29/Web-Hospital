package com.springboot.Application.WebHospital.modal;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class jobs {
    
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    
    private String description;
    private String position;
    private int experience;
    private int salary;
    
    @OneToMany(fetch=FetchType.LAZY,mappedBy="jobs_can",
			   cascade= CascadeType.ALL)
	private List<candidates> candidate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public int getExperience() {
        return experience;
    }

    public void setExperience(int experience) {
        this.experience = experience;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public List<candidates> getCandidate() {
        return candidate;
    }

    public void setCandidate(List<candidates> candidate) {
        this.candidate = candidate;
    }
    
    public void add(candidates tempCourse) {
		
		if (candidate == null) {
			candidate = new ArrayList<>();
		}
		
		candidate.add(tempCourse);
		
		tempCourse.setJobs_can(this);
	}
    
}
