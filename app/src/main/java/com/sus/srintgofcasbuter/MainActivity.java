package com.sus.srintgofcasbuter;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Build;
import android.os.Bundle;
import android.widget.TextView;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

public class MainActivity extends AppCompatActivity {

    @RequiresApi(api = Build.VERSION_CODES.O)
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        TextView one = (TextView) findViewById(R.id.string_one);
        TextView two = (TextView) findViewById(R.id.string_two);
        TextView three = (TextView) findViewById(R.id.string_three);
        TextView four = (TextView) findViewById(R.id.string_four);

        try {
            one.setText(DontLookHere.decrypt("<encryptme>hello!!!</encryptme>"));
            two.setText(DontLookHere.decrypt("<encryptme>this is so cool</encryptme>"));
            three.setText(DontLookHere.decrypt("<encryptme>please work</encryptme>"));
            four.setText(DontLookHere.decrypt("<encryptme>bye!!!</encryptme>"));
        } catch (NoSuchPaddingException | InvalidAlgorithmParameterException | IllegalBlockSizeException | UnsupportedEncodingException | NoSuchAlgorithmException | BadPaddingException | InvalidKeyException e) {
            e.printStackTrace();
        }
    }
}