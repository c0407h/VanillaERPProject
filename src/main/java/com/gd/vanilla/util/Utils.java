package com.gd.vanilla.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.lang.RandomStringUtils;

import com.gd.vanilla.common.CommonProperties;

public class Utils {
	/**
	 * Primary Key 생성
	 * 
	 * @return String
	 */
	public static String getPrimaryKey() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		return formatter.format(new java.util.Date()) + RandomStringUtils.randomNumeric(6);
	}

	/**
	 * 문자열을 key를 통해 암호화 하고 base64 로 인코딩
	 * 
	 * @return String
	 * @throws Throwable
	 */
	public static String encryptAES128(String value) throws Throwable {
		SecretKeySpec keySpec 
				= new SecretKeySpec(CommonProperties.SECURE_KEY.getBytes("UTF-8"), "AES");

		SecretKeySpec skeySpec = new SecretKeySpec(
				DatatypeConverter.parseBase64Binary(
						(String) DatatypeConverter.printBase64Binary(keySpec.getEncoded())),
				"AES");

		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
		byte[] encrypted = cipher.doFinal(value.getBytes()); // 암호화

		String encodeString = DatatypeConverter.printBase64Binary(encrypted); // 바이트 타입의 배열을 문자열로 변환

		return encodeString;
	}

	/**
	 * key 를 통해 문자열 base64 디코딩
	 * 
	 * @return String
	 * @throws Throwable
	 */
	public static String decryptAES128(String value) throws Throwable {
		SecretKeySpec keySpec = new SecretKeySpec(CommonProperties.SECURE_KEY.getBytes("UTF-8"), "AES");
		SecretKeySpec sKeySpec = new SecretKeySpec(
				DatatypeConverter.parseBase64Binary(DatatypeConverter.printBase64Binary(keySpec.getEncoded())), "AES");

		Cipher cipher = Cipher.getInstance("AES");
		cipher.init(Cipher.DECRYPT_MODE, sKeySpec);

		byte[] decodeBytes = DatatypeConverter.parseBase64Binary(value); //문자열 형태의 파라메터를 배열에 바이트 변환 후 삽입

		byte[] decryptBytes = cipher.doFinal(decodeBytes); // 복호화

		return new String(decryptBytes);
	}
	
	/**
	 * MAP의 Key를 소문자로 변환
	 * 
	 * @return HashMap<String, String>
	 */
	public static HashMap<String, String> toLowerMapKey(HashMap<String, String> oldMap) throws Throwable {
		Set<String> keySet = oldMap.keySet();
		
		Iterator<String> keys = keySet.iterator();
		
		HashMap<String, String> newMap = new HashMap<String, String>();
		
		while(keys.hasNext()) {
			String key = keys.next();
			newMap.put(key.toLowerCase(), String.valueOf(oldMap.get(key)));
		}
		
		return newMap;
	}
	
	/**
	 * List의 MAP Key를 소문자로 변환
	 * 
	 * @return HashMap<String, String>
	 */
	public static List<HashMap<String, String>> toLowerListMapKey(List<HashMap<String, String>> oldList) {
		List<HashMap<String, String>> newList = new ArrayList<HashMap<String, String>>();
		
		for(HashMap<String, String> oldMap : oldList) {
			Set<String> keySet = oldMap.keySet();
			
			Iterator<String> keys = keySet.iterator();
			
			HashMap<String, String> newMap = new HashMap<String, String>();
			
			while(keys.hasNext()) {
				String key = keys.next();
				newMap.put(key.toLowerCase(), String.valueOf(oldMap.get(key)));
			}
			
			newList.add(newMap);
		}
		
		return newList;
	}
	
	/**
	 * List의 MAP Key를 카멜식 변환
	 * 
	 * @return HashMap<String, String>
	 */
	public static List<HashMap<String, String>> toLowerListMapKeyCamel(List<HashMap<String, String>> oldList) {
		List<HashMap<String, String>> newList = new ArrayList<HashMap<String, String>>();
		
		for(HashMap<String, String> oldMap : oldList) {
			Set<String> keySet = oldMap.keySet();
			
			Iterator<String> keys = keySet.iterator();
			
			HashMap<String, String> newMap = new HashMap<String, String>();
			
			while(keys.hasNext()) {
				String key = keys.next();
				
				String[] temp = key.split("_");
				
				String newKey = temp[0].toLowerCase();
				
				for(int i = 1 ; i < temp.length ; i++) {
					newKey += temp[i].substring(0, 1).toUpperCase();
					newKey += temp[i].substring(1).toLowerCase();
				}
				
				newMap.put(newKey, String.valueOf(oldMap.get(key)));
			}
			
			newList.add(newMap);
		}
		
		return newList;
	}
}
