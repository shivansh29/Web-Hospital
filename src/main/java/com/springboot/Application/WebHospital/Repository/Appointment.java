package com.springboot.Application.WebHospital.Repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.springboot.Application.WebHospital.modal.appointment;

public interface Appointment extends JpaRepository<appointment, Integer>{

	@Query("from appointment where doctorId =:doc and Date=:dt and Time=:time ")
	public appointment getAppoint(@Param("doc") String email,@Param("dt") Date dt,@Param("time") String time);
	

	@Query("from appointment where doctorId =:doc and Date=:dt ")
	public List<appointment> getAppointment(@Param("doc") String email,@Param("dt") Date dt);
}

//where field = :doc