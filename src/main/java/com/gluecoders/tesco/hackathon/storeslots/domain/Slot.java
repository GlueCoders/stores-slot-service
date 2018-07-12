package com.gluecoders.tesco.hackathon.storeslots.domain;

public class Slot {

    private final String timeSlot;
    private final int capacity;
    private int booked;

    public Slot(String timeSlot, int capacity) {
        this.timeSlot = timeSlot;
        this.capacity = capacity;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public int getCapacity() {
        return capacity;
    }

    public int getBooked() {
        return booked;
    }

    public boolean book(){
        if(booked >= capacity) return false;
        else {
            booked++;
            return true;
        }
    }
}
