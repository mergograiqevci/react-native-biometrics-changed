package com.reactlibrary;

import android.content.SharedPreferences;
import android.os.Build;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyPermanentlyInvalidatedException;
import java.security.InvalidKeyException;
import android.security.keystore.KeyProperties;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import java.security.KeyStore;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

public class RNBiometricsDetectionModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;
    private final String LAST_KEY_ID = "LAST_KEY_ID";
    private SharedPreferences spref;

    public RNBiometricsDetectionModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @ReactMethod
    public void hasFingerPrintChanged(final Promise pm) {
    Cipher cipher = getCipher();
    SecretKey secretKey = getSecretKey();
    if (getSecretKey() == null){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            generateSecretKey(new KeyGenParameterSpec.Builder(
                    "fingerPrintKey",
                    KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                    .setBlockModes(KeyProperties.BLOCK_MODE_CBC)
                    .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_PKCS7)
                    .setUserAuthenticationRequired(true)
                    .setInvalidatedByBiometricEnrollment(true)
                    .build());
        }
    }
        try {
             secretKey = getSecretKey();
             cipher.init(Cipher.ENCRYPT_MODE, secretKey);
             pm.resolve(false);
         }
          catch (KeyPermanentlyInvalidatedException e) {
              if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                  generateSecretKey(new KeyGenParameterSpec.Builder(
                  "fingerPrintKey",
                  KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                  .setBlockModes(KeyProperties.BLOCK_MODE_CBC)
                  .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_PKCS7)
                  .setUserAuthenticationRequired(true)
                  .setInvalidatedByBiometricEnrollment(true)
                  .build());
              }
              pm.resolve(true);
        } catch (InvalidKeyException e) {
            pm.resolve(false);
        }
    }   

    private void generateSecretKey(KeyGenParameterSpec keyGenParameterSpec) {
    try{
        KeyGenerator keyGenerator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
        keyGenerator.init(keyGenParameterSpec);
        keyGenerator.generateKey();
     }
        catch(Exception e){

        }
    }

    private SecretKey getSecretKey() {
        try{
            KeyStore keyStore = KeyStore.getInstance("AndroidKeyStore");
            keyStore.load(null);
            return ((SecretKey)keyStore.getKey("fingerPrintKey", null));
        }
        catch(Exception e){
            return null;
        }
    }

    private Cipher getCipher() {
        try {
            return Cipher.getInstance(KeyProperties.KEY_ALGORITHM_AES + "/"
                    + KeyProperties.BLOCK_MODE_CBC + "/"
                    + KeyProperties.ENCRYPTION_PADDING_PKCS7);
        }
        catch(Exception e){
            return null;
        }
    }
    
    @Override
    public String getName() {
        return "RNBiometricsDetection";
    }
}