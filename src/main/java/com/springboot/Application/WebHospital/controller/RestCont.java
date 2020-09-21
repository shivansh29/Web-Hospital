package com.springboot.Application.WebHospital.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestCont {

	@GetMapping("/")
	public String hello() {
		
		return "hello people";
	}
}
