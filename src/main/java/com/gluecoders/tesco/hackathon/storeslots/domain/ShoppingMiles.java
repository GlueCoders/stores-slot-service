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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPoints() {
        return points;
    }

    public void setPoints(String points) {
        this.points = points;
    }

    public String getKms() {
        return kms;
    }

    public void setKms(String kms) {
        this.kms = kms;
    }

    @Override
    public String qrFormattedText() {
        return "Name: "+name+"\n"
                + "Points: "+ points;
    }
}
