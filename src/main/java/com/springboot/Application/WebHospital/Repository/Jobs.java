package com.springboot.Application.WebHospital.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.Application.WebHospital.modal.jobs;

public interface Jobs extends JpaRepository<jobs, Integer> {


}
