package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Controller
public class WebPageController {

	private static final Logger log = LoggerFactory.getLogger(WebPageController.class.getSimpleName());
	/*@RequestMapping("/home")
	public String welcome(Map<String, Object> model) {
		//model.put("message", this.message);
		return "hello";
	}*/
	
	@RequestMapping("/home")
	public String home(Map<String, Object> model) {
		log.info("Welcome to Store Channel App");
		model.put("message", "abcd");
		return "home";
	}
		
	@RequestMapping("/storelocator")
	public String storeLocator(Map<String, Object> model) {
		log.info("Loading Store Locator Page");
		//model.put("message", "abcd");
		return "storeLocator";
	}
	
}
