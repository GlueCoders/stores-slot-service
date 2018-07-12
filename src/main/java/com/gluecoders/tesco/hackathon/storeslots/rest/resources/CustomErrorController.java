package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import java.util.Map;

import org.springframework.boot.autoconfigure.web.ErrorController;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class CustomErrorController implements ErrorController {
	 @RequestMapping("/error")
	    public String handleError() {
	        System.out.println("I am called in error");
	        return "error";
	    }
	 
	    @Override
	    public String getErrorPath() {
	        return "/error";
	    }
}
