package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path = "/ping")
public class Ping {

    @GetMapping
    public ResponseEntity ping(){
        return ResponseEntity.ok().body("All is well");
    }

    @PostMapping
    public ResponseEntity ping1(){
        return ResponseEntity.ok().body("All is well");
    }
}
