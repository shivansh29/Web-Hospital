package com.springboot.Application.WebHospital.Services;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.Application.WebHospital.Repository.Medicine;
import com.springboot.Application.WebHospital.modal.medicine;

@Service
public class MedicineService {

	@Autowired
	private Medicine med;
	
	public HashMap<String, Double> getPricesAndProduct(){
		List<medicine> list=med.getPrices();
		HashMap<String,Double> map=new HashMap<>();
        int i=0;
        while(i<list.size()){
            medicine med=list.get(i++);
            double d=Double.parseDouble(med.getPrice().substring(2));
            map.put(med.getName(),d);
        }
        return map;
	}
	
	
	
	public List<medicine> getPrices(){
		return med.getPrices();
	}
	
	
	
	public String enterMedicine(medicine medic) {
		try {
			medicine temp=med.checkMedicine(medic.getName());
			if(temp==null) {
				med.save(medic);
			}
			else {
				med.addQuantity(medic.getExp(), medic.getMfg(), medic.getQuantity()+temp.getQuantity(), medic.getName());
			}
			return "done";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "exception";
		}
		
	}
	
	public String delete(String name) {
		try {
			if(med.checkMedicine(name)!=null) {
				med.deleteById(name);
				return "done";
			}
			return "exist";
		}
		catch(Exception e) {
			e.printStackTrace();
			return "exception";
		}
	}
	
}
