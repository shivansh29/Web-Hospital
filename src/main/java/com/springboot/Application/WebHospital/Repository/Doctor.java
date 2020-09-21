package com.springboot.Application.WebHospital.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springboot.Application.WebHospital.modal.doctor;

public interface Doctor extends JpaRepository<doctor, String> {

	@Query("from doctor where email = :user and password = :pass")
	public doctor getCustomer(@Param("user") String email,@Param("pass") String password);
	

	@Query("from doctor where email = :user ")
	public doctor checkEmployee(@Param("user") String email);
	
	@Query("from doctor where field = :user")
	public List<doctor> getDoctors(@Param("user") String field);
}
