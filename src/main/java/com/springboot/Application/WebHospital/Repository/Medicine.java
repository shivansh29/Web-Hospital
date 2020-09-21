package com.springboot.Application.WebHospital.Repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.Application.WebHospital.modal.medicine;

public interface Medicine extends JpaRepository<medicine, String> {


	@Query("from medicine")
	public List<medicine> getPrices();
	
	@Query("from medicine where name = :nm")
	public medicine checkMedicine(@Param("nm") String name);
	
	@Transactional
	@Modifying
	@Query("update medicine set exp = :exp , mfg = :mfg , Quantity = :quantity where name = :name")
	public void addQuantity(@Param("exp") Date exp,@Param("mfg") Date mfg,@Param("quantity") int quantity,@Param("name") String name);
}
