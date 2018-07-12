package com.gluecoders.tesco.hackathon.storeslots.utility;

import java.util.UUID;

public class Random {

    private final static java.util.Random random = new java.util.Random();
    private final static char[] characters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','1','2','3','4','5','6','7','8','9','0'};

    public static String alphaNumeric(int length){
        StringBuilder stb = new StringBuilder();
        while(length -- > 0){
            int pos = random.nextInt(characters.length);
            stb.append(characters[pos]);
        }
        return stb.toString();
    }

    public static String randomUUID(){
        return UUID.randomUUID().toString();
    }


}
