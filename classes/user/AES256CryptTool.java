package user;

//  Created by ½Å Çö¿õ on 12. 12. 26..
//  Copyright (c) 2012³â ½ÅÇö¿õ. All rights reserved.

	/* Doc 
	 * 	Precondition :
     *  
     *  commons-codec-1.4.jar library must added.
	 * 
	 * 	JavaVM need to installed 'Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction Policy Files'. 	
	 * 
	 * 	Usage : 
	 * 		
	 * 	#import user.AES256CryptTool
	 * 		
	 * 		(String) AES256CryptTool.Encryption(String plainText, String secretKey); // secretKey exactly must be 32byte
	 * 		(String) AES256CryptTool.Decryption(String cryptedText, String secretKey); // secretKey exactly must be 32byte
	 * 	
	 */

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.IvParameterSpec;
import org.apache.commons.codec.binary.Base64;

public class AES256CryptTool {
	private static Cipher cp;
	private static SecretKeySpec secKeySpec;
	private static AlgorithmParameterSpec ivSpec;
	private static byte[] ivBytes = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };

	public static String Encryption(String plainText, String secretKey) {
		SetupSecKey(secretKey);
		try {						
			cp.init(Cipher.ENCRYPT_MODE, secKeySpec, ivSpec);
			byte[] outBytes = cp.doFinal(plainText.getBytes("UTF-8"));	
			
			return Base64.encodeBase64String(outBytes);			
			} catch (InvalidKeyException e) {
			System.out.println("InvalidKeyException!");
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			System.out.println("IllegalBlockSizeException!");
			e.printStackTrace();
		} catch (BadPaddingException e) {
			System.out.println("BadPaddingException!");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {			
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static String Decryption(String cryptedText, String secretKey) {
		SetupSecKey(secretKey);		
		byte[] outbytes = Base64.decodeBase64(cryptedText);
		try {			
			cp.init(Cipher.DECRYPT_MODE, secKeySpec, ivSpec);
			return new String(cp.doFinal(outbytes), "UTF-8");
		} catch (InvalidKeyException e) {
			System.out.println("InvalidKeyException!");
			e.printStackTrace();
		} catch (InvalidAlgorithmParameterException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return null;		
	}
	private static void SetupSecKey(String secretKey) {
		try {			
			ivSpec = new IvParameterSpec(ivBytes);
			byte[] byteKey = secretKey.getBytes("UTF-8");
			//if(byteKey.length > 32) for(int i = 0; i < 32; i++) precise[i] = byteKey[i];
			//byteKey = precise;
			secKeySpec = new SecretKeySpec(byteKey, "AES");
			cp = Cipher.getInstance("AES/CBC/PKCS5Padding");			
		} catch (NoSuchAlgorithmException e) {
			System.out.println("NoSuchAlgorithmException!");
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			System.out.println("NoSuchPaddingException!");
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}