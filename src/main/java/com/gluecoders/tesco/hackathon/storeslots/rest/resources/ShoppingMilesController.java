package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import com.gluecoders.tesco.hackathon.storeslots.domain.ShoppingMiles;
import com.gluecoders.tesco.hackathon.storeslots.utility.QRCodeGenerator;
import com.gluecoders.tesco.hackathon.storeslots.utility.Random;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(path = "/miles")
public class ShoppingMilesController {

    private static final List<String> names = new ArrayList<>();

    static {
        names.add("Richard Doe");
        names.add("John Doe");
        names.add("Ken Adams");
    }

    @GetMapping(produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getProfile() {
        try {
            byte[] qrCode = QRCodeGenerator.qrCode(new ShoppingMiles(Random.randomElement(names), Integer.toString(Random.randomInt(1000)), Integer.toString(Random.randomInt(3000))));
            return ResponseEntity.ok(qrCode);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    @GetMapping(path = "/health", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ShoppingMiles> getHealthProfile(){
        try{
            return ResponseEntity.ok(new ShoppingMiles(Random.randomElement(names), Integer.toString(Random.randomInt(1000)), Integer.toString(Random.randomInt(100))));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    @GetMapping(path = "/carpool", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ShoppingMiles> getCarpoolProfile(){
        try{
            return ResponseEntity.ok(new ShoppingMiles(Random.randomElement(names), Integer.toString(Random.randomInt(500)), Integer.toString(Random.randomInt(3000))));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }
}