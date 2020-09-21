package com.springboot.Application.WebHospital.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.Application.WebHospital.modal.candidates;

public interface Candidates extends JpaRepository<candidates, Integer> {

}
