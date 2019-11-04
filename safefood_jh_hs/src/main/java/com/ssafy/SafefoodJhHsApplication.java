package com.ssafy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class SafefoodJhHsApplication {

	public static void main(String[] args) {
		SpringApplication.run(SafefoodJhHsApplication.class, args);
	}

}
