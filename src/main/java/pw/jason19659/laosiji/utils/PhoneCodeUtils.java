/**
 * 
 */
package pw.jason19659.laosiji.utils;

import java.util.HashMap;

import com.google.common.collect.BiMap;
import com.google.common.collect.HashBiMap;

/**
 * @author <a href="mailto:jason19659@163.com">jason19659</a>
 *
 * pw.jason19659.laosiji.utils
 *
 * 2016年5月4日
 */
public class PhoneCodeUtils {
	public static String phoneToAlphatbet(String phonekey) {
		StringBuilder sb = new StringBuilder();
		phonekey = phonekey.replaceAll("0", "00");
		for (int i = 0; i < phonekey.length(); i+=2) {
			BiMap<String, String> inverse = PHONE_KEY.inverse();
			String str = inverse.getOrDefault(""+phonekey.charAt(i)+phonekey.charAt(i + 1),"");
			sb.append(str);
		}
		return sb.toString();
	}

	public static String alphabetToPhone(String alphabet) {
		StringBuilder sb = new StringBuilder();
		alphabet = alphabet.toUpperCase();
		for (char c : alphabet.toCharArray()) {
			sb.append(PHONE_KEY.getOrDefault(""+c,""));
		}
		return sb.toString();
	}
	
	
	private static final BiMap<String, String> PHONE_KEY = HashBiMap.create(new HashMap<String, String>() {
		/**
		 * 
		 */
		private static final long serialVersionUID = 1052436497142676664L;

		{

			put("A", "21");
			put("B", "22");
			put("C", "23");
			put("D", "31");
			put("E", "32");
			put("F", "33");
			put("G", "41");
			put("H", "42");
			put("I", "43");
			put("J", "51");
			put("K", "52");
			put("L", "53");
			put("M", "61");
			put("N", "62");
			put("O", "63");
			put("P", "71");
			put("Q", "72");
			put("R", "73");
			put("S", "74");
			put("T", "81");
			put("U", "82");
			put("V", "83");
			put("W", "91");
			put("X", "92");
			put("Y", "93");
			put("Z", "94");
			put(" ", "00");
		}
	});
}
