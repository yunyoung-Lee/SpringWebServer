package com.javis.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	 @Override
	    public void addResourceHandlers(ResourceHandlerRegistry registry) {
		 registry.addResourceHandler("/script/**").addResourceLocations("/resources/script/");
		 registry.addResourceHandler("/css/**").addResourceLocations("/resources/css/");
		 registry.addResourceHandler("/images/**").addResourceLocations("/resources/images/");
		 registry.addResourceHandler("/videos/**").addResourceLocations("/resources/videos/");
	    }
	 
}