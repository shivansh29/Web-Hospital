package com.springboot.Application.WebHospital.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springboot.Application.WebHospital.modal.customer;

public interface Customer extends JpaRepository<customer, Integer> {

	@Query("from customer where email = :user and password = :pass")
	public customer getCustomer(@Param("user") String email,@Param("pass") String password);
	
	@Query("from customer where email = :user ")
	public customer customerExists(@Param("user") String email);
	
	
}
