package com.javis.web.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.javis.web")
@MapperScan(value = { "com.javis.web.repository" })
public class Application extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

	
	 @Override 
	 protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) { 
		 return builder.sources(Application.class); 
	 }
	 
}
