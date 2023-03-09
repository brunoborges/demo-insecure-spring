package com.example.demo;

import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}

@RestController
class HelloController {

	static Logger LOGGER = org.apache.logging.log4j.LogManager.getLogger(DemoApplication.class);

	@GetMapping("/hello")
	public String hello() {
		LOGGER.warn("This app is running an insecure version of Log4j. Please upgrade to Log4j 2.17.1 or later.");
		return "Hello World!";
	}

}