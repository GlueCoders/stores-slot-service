package com.gluecoders.tesco.hackathon.storeslots.domain;

public class ShoppingMiles implements QRFormat {

    private String name;
    private String points;
    private String kms;


    public ShoppingMiles(String name, String points, String kms) {
        this.name = name;
        this.points = points;
        this.kms = kms;
    }

    @Override
    public String qrFormattedText() {
        return "Name: "+name+"\n"
                + "Points: "+ points;
    }
}
