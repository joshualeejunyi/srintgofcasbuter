package com.sus.srintgofcasbuter;

import android.os.Build;
import android.util.Log;

import androidx.annotation.RequiresApi;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class DontLookHere {
    @RequiresApi(api = Build.VERSION_CODES.O)
    public static String decrypt(String data) throws NoSuchPaddingException, NoSuchAlgorithmException, InvalidAlgorithmParameterException, InvalidKeyException, IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException {
        Log.d("original data", data);
        // decode base64
        byte[] decodedBytes = Base64.getDecoder().decode(data);
        String decodedString = new String(decodedBytes, StandardCharsets.UTF_8);
        Log.d("base64 decoded", decodedString);

        // get info from given string
        String key = decodedString.substring(0, 16);
        String iv = decodedString.substring(16, 32);
        String ciphertext = decodedString.substring(32);

        Log.d("sliced key", key);
        Log.d("sliced iv", iv);
        Log.d("sliced cipher", ciphertext);

        SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES");
        IvParameterSpec ivSpec = new IvParameterSpec(iv.getBytes(StandardCharsets.UTF_8));

        Cipher cipher = Cipher.getInstance("AES/CFB/NoPadding");
        cipher.init(Cipher.DECRYPT_MODE, keySpec, ivSpec);
        byte[] decrypted = cipher.doFinal(Base64.getDecoder().decode(ciphertext));
        String decryptedString = new String(decrypted, StandardCharsets.UTF_8);
        Log.d("wtf", decryptedString);
        return decryptedString;
    }
}
