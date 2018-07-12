package com.gluecoders.tesco.hackathon.storeslots.data;

import com.gluecoders.tesco.hackathon.storeslots.domain.Slot;
import com.gluecoders.tesco.hackathon.storeslots.domain.Store;

import java.util.*;

public class Stores {

    private static final Map<String, Store> storeMap = new HashMap<>();

    static {

        storeMap.put("5b3a3fc2-e96d-44b7-9a2b-52857c04e374", new Store("Charing Cross Express", "5b3a3fc2-e96d-44b7-9a2b-52857c04e374", 51.5072, -0.12715, "1-4 Charing Cross\nLondon\nSW1A 2DR"));
        storeMap.put("95989824-9832-40a1-8274-24c68afca734", new Store("Covent Garden Metro", "95989824-9832-40a1-8274-24c68afca734", 51.51111, -0.12517, "22-25 Bedford St\nCovent Garden\nLondon\nWC2E 9EQ"));
        storeMap.put("3b93c4f6-29a1-455e-abdb-d684e868c9df", new Store("Regent St Metro", "3b93c4f6-29a1-455e-abdb-d684e868c9df", 51.50891, -0.13461, "17-25 Regent St\nLondon\nSW1Y 4LR"));
        storeMap.put("99d46844-eb70-4634-9d37-e6d74f05b2ba", new Store("Westminster Express", "99d46844-eb70-4634-9d37-e6d74f05b2ba", 51.5013, -0.12483, "Portcullis House\nBridge St\nLondon\nSW1A 2JR"));
        storeMap.put("ff160a85-b557-4029-a5db-e0ef41d095f7", new Store("Strand Express", "ff160a85-b557-4029-a5db-e0ef41d095f7", 51.51095, -0.11939, "125 The Strand\nStrand\nLondon\nWC2R 0AP"));
        storeMap.put("af3fa805-9702-474e-8ef6-76283ee2e6ed", new Store("Dean St Metro", "af3fa805-9702-474e-8ef6-76283ee2e6ed", 51.51559, -0.13353, "Dean St\nWestminster\nLondon\nW1D 3RF"));
        storeMap.put("7ea46efb-9504-4361-a688-d67810022b41", new Store("Victoria Monck St Express", "7ea46efb-9504-4361-a688-d67810022b41", 51.49642, -0.13058, "2 Monck St\nVictoria\nLondon\nSW1P 2BW"));
        storeMap.put("0eee26f3-446f-40e9-a7ed-52b74f4b78fd", new Store("Mayfair Express", "0eee26f3-446f-40e9-a7ed-52b74f4b78fd", 51.50708, -0.14569, "50-52 Curzon St\nMayfai\nLondon\nW1J 7UP"));
        storeMap.put("e1ed53bb-b0ac-4cd0-b59b-125b06614311", new Store("Fleet St Express", "e1ed53bb-b0ac-4cd0-b59b-125b06614311", 51.51347, -0.11216, "231-232 The Strand\nStrand\nLondon\nWC2R 1DA"));
        storeMap.put("7f0eb229-4eba-4e20-b375-589a06a6d947", new Store("Waterloo Rd Express", "7f0eb229-4eba-4e20-b375-589a06a6d947", 51.50292, -0.11039, "103-107 Waterloo Rd\nWaterloo\nSE1 8UL"));

        List<Slot> slots = new ArrayList<>();
        slots.add(new Slot("0900-1000hrs", 50));
        slots.add(new Slot("1000-1100hrs", 50));
        slots.add(new Slot("1100-1200hrs", 50));
        slots.add(new Slot("1200-1300hrs", 50));
        slots.add(new Slot("1300-1400hrs", 50));
        slots.add(new Slot("1400-1500hrs", 50));
        slots.add(new Slot("1500-1600hrs", 50));
        slots.add(new Slot("1600-1700hrs", 50));
        slots.add(new Slot("1700-1800hrs", 50));
        slots.add(new Slot("1800-1900hrs", 50));
        slots.add(new Slot("1900-2000hrs", 50));

        storeMap.entrySet()
                .forEach(entry -> entry.getValue().addSlots(slots));
    }


    public static List<Store> getStores(String zipCode) {
        return new ArrayList<>(storeMap.values());
    }

    public static boolean bookSlot(String storeId, String slotTime) {
        return Optional.ofNullable(storeMap.get(storeId))
                .map(store -> store.book(slotTime))
                .orElse(false);
    }

    public static Store getStore(String storeId) {
        return storeMap.get(storeId);

    }

}
