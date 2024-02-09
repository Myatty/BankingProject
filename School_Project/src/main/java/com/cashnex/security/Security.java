package com.cashnex.security;

import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;

public class Security {

	private static final String hashedPassword = null;
	
  
    
	private String hashPassword(String rawPassword) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException {
	
		// Step 1: Choose the encryption algorithm and mode
	    String algorithm = "AES";
	    String transformation = "AES/ECB/PKCS5Padding";
	    
	    // Step 2: Create a key for the chosen encryption algorithm
	    KeyGenerator keyGenerator = KeyGenerator.getInstance(algorithm);
	    SecretKey secretKey = keyGenerator.generateKey();
	    
	    // Step 3: Initialize a cipher object with the key and encryption mode
	    Cipher cipher = Cipher.getInstance(transformation);
	    cipher.init(Cipher.ENCRYPT_MODE,secretKey);
	    
	    String plaintext = rawPassword;
	    byte[] encryptedBytes = cipher.doFinal(plaintext.getBytes(StandardCharsets.UTF_8));
        String encryptedBase64 = Base64.getEncoder().encodeToString(encryptedBytes);
        
	    return encryptedBase64;
	}
	
	
}
