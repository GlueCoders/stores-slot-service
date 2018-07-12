package com.gluecoders.tesco.hackathon.storeslots.domain;

import java.util.ArrayList;
import java.util.List;

public class Store {

    private final String name;
    private final String id;
    private final Geo geo;
    private final String formattedAddress;
    private final List<Slot> slots;

    public Store(String name, String id, double latitude, double longitude, String formattedAddress) {
        this.name = name;
        this.id = id;
        this.geo = new Geo(latitude, longitude);
        this.formattedAddress = formattedAddress;
        this.slots = new ArrayList<>();
    }

    public List<Slot> getSlots() {
        return slots;
    }

    public String getName() {
        return name;
    }

    public void addSlots(List<Slot> slots){
        this.slots.addAll(slots);
    }

    public String getId() {
        return id;
    }

    public Geo getGeo() {
        return geo;
    }

    public String getFormattedAddress() {
        return formattedAddress;
    }

    public double getLatitude() {
        return geo.latitude;
    }

    public double getLongitude() {
        return geo.longitude;
    }

    public boolean book(String slotTime){
        return this.slots.stream().filter(arg -> arg.getTimeSlot().equals(slotTime)).findFirst().map(Slot::book).orElse(false);
    }

    private static class Geo {
        private final double latitude;
        private final double longitude;

        private Geo(double latitude, double longitude) {
            this.latitude = latitude;
            this.longitude = longitude;
        }

        public double getLatitude() {
            return latitude;
        }

        public double getLongitude() {
            return longitude;
        }
    }


}
