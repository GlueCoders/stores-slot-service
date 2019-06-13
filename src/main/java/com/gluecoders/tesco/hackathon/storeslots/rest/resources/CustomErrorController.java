package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
