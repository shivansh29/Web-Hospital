package com.springboot.Application.WebHospital.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.Application.WebHospital.modal.complains;

public interface Complaints extends JpaRepository<complains, Integer> {

}
