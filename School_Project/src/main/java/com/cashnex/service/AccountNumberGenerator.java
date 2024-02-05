package com.cashnex.service;

import java.util.Random;

public class AccountNumberGenerator {
    public static String generateAccountNumber() {
        Random random = new Random();
        StringBuilder accountNumber = new StringBuilder();

        // Generate 16 random digits
        for (int i = 0; i < 16; i++) {
            accountNumber.append(random.nextInt(10));
        }

        return accountNumber.toString();
    }
}
