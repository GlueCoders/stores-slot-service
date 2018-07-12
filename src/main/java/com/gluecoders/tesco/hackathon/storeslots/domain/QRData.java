package com.gluecoders.tesco.hackathon.storeslots.domain;

import com.gluecoders.tesco.hackathon.storeslots.utility.Random;

public class QRData {

    private final String sequenceId;
    private final String storeId;
    private final String storeName;
    private final String slotTime;

    public QRData(String storeId, String storeName, String slotTime) {
        this.sequenceId = Random.alphaNumeric(6);
        this.storeId = storeId;
        this.storeName = storeName;
        this.slotTime = slotTime;
    }

    public String formattedText(){
        return "Store Name : " + storeName + "\n"
                + "StoreID : "+storeId + "\n"
                + "Slot time : "+slotTime +"\n"
                +  "Sequence : "+sequenceId+"\n";
    }
}
