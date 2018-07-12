package com.gluecoders.tesco.hackathon.storeslots.rest.resources;

import com.gluecoders.tesco.hackathon.storeslots.domain.QRData;
import com.gluecoders.tesco.hackathon.storeslots.domain.Store;
import com.gluecoders.tesco.hackathon.storeslots.utility.QRCodeGenerator;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/stores")
public class Stores {

    @GetMapping(path = "/{zipcode}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Store>> getStores(@PathVariable("zipcode") String zipcode){
        List<Store> stores = com.gluecoders.tesco.hackathon.storeslots.data.Stores.getStores(zipcode);
        return ResponseEntity.ok(stores);
    }

    @GetMapping(path = "/{storeId}/book", produces = MediaType.IMAGE_PNG_VALUE)
    public ResponseEntity bookSlot(@PathVariable("storeId") String storeID, @RequestParam("slotTime") String slotTime){
        boolean booked = com.gluecoders.tesco.hackathon.storeslots.data.Stores.bookSlot(storeID, slotTime);
        if(booked){
            Store store = com.gluecoders.tesco.hackathon.storeslots.data.Stores.getStore(storeID);
            try {
                byte[] qrCode = QRCodeGenerator.qrCode(new QRData(store.getId(), store.getName(), slotTime));
                return ResponseEntity.ok(qrCode);
            } catch (Exception e) {
                e.printStackTrace();
                return ResponseEntity.status(500).build();
            }
        }
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
    }

}