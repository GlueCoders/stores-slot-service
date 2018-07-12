package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MockRestController {

	private static final Logger log = LoggerFactory.getLogger(MockRestController.class.getSimpleName());

	@RequestMapping(value = "/getmockstores", method = RequestMethod.GET)
	public String fetchPlanogramFromApi() {
		log.info("fetching all stores ");
		//String pgjson = "{ \"Store A\": { \"Position\": { \"Longitude\": 9.96233, \"Latitude\": 49.80404 } }, \"Store B\": { \"Position\": { \"Longitude\": 6.11499, \"Latitude\": 50.76891 } }, \"Store C\": { \"Position\": { \"Longitude\": 6.80592, \"Latitude\": 51.53548 } }, \"Store D\": { \"Position\": { \"Longitude\": 9.50523, \"Latitude\": 51.31991 } }, \"Store E\": { \"Position\": { \"Longitude\": 9.66089, \"Latitude\": 48.70158 } }, \"Store F\": { \"Position\": { \"Longitude\": 9.93368, \"Latitude\": 53.55608 } }, \"Store G\": { \"Position\": { \"Longitude\": 11.56122, \"Latitude\": 48.14496 } }, \"Store H\": { \"Position\": { \"Longitude\": 13.34253, \"Latitude\": 52.5319 } } }";
		String pgjson = "{ \"stores\": [{ \"name\": \"storeA\", \"Longitude\": 9.96233, \"Latitude\": 49.80404 }, { \"name\": \"storeB\", \"Longitude\": 6.11499, \"Latitude\": 50.76891 }, { \"name\": \"storeC\", \"Longitude\": 6.80592, \"Latitude\": 51.53548 }, { \"name\": \"storeD\", \"Longitude\": 9.50523, \"Latitude\": 51.31991 }, { \"name\": \"storeE\", \"Longitude\": 9.66089, \"Latitude\": 48.70158 }] }";
		log.info("output json: " + pgjson);
		return pgjson;
	}
}
