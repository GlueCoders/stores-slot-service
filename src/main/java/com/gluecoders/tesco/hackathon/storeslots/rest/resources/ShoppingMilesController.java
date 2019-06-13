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
        names.add("Ken Adams");
    }

    @GetMapping(path = "/carpoolqrcode", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getCarpoolQrcode() {
        try {
            byte[] qrCode = QRCodeGenerator.qrCode(new ShoppingMiles("Ken Adams", "927","2487"));
            return ResponseEntity.ok(qrCode);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    @GetMapping(path = "/healthqrcoe", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity getHealthQrcode() {
        try {
            byte[] qrCode = QRCodeGenerator.qrCode(new ShoppingMiles("Ken Adams", "238","89"));
            return ResponseEntity.ok(qrCode);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    @GetMapping(path = "/health", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ShoppingMiles> getHealthProfile(){
        try{
            return ResponseEntity.ok(new ShoppingMiles("Ken Adams", "238","89"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }

    @GetMapping(path = "/carpool", produces=MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ShoppingMiles> getCarpoolProfile(){
        try{
            return ResponseEntity.ok(new ShoppingMiles("Ken Adams", "927","2487"));
        }catch (Exception e){
            e.printStackTrace();
            return ResponseEntity.status(500).build();
        }
    }
}