package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
public class CustomRestController {

	private static final Logger log = LoggerFactory.getLogger(RestController.class.getSimpleName());

	@RequestMapping(value = "/storelocatorjson", method = RequestMethod.GET)
	public String fetchPlanogramFromApi() {
		final String uri = "/getmockstores";

		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(uri, String.class);

		log.info("Result: " + result);

		return result;
	}
}
