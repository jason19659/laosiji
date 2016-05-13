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
 *         pw.jason19659.laosiji.utils
 *
 *         2016年5月4日
 */
public class Morse {
	public static String alphabetToMorseCode(String alphabet, String spilt) {
		StringBuilder sb = new StringBuilder();
		alphabet = alphabet.toUpperCase();
		for (int i = 0; i < alphabet.length(); i++) {
			sb.append(MORSE_CODE.get(alphabet.charAt(i) + "") + spilt);
		}
		return sb.substring(0, sb.length() - 1);
	}

	public static String morseToAlphabet(String morse, String spilt) {
		StringBuilder sb = new StringBuilder();
		String[] morses = morse.split(spilt);
		for (String m : morses) {
			sb.append(MORSE_CODE.inverse().getOrDefault(m,""));
		}
		return sb.toString();
	}

	private static final BiMap<String, String> MORSE_CODE = HashBiMap.create(new HashMap<String, String>() {
		/**
		 * 
		 */
		private static final long serialVersionUID = -1235568598199997734L;
		{
			put("A", ".-");
			put("B", "-...");
			put("C", "-.-.");
			put("D", "-..");
			put("E", ".");
			put("F", "..-.");
			put("G", "--.");
			put("H", "....");
			put("I", "..");
			put("J", ".---");
			put("K", "-.-");
			put("L", ".-..");
			put("M", "--");
			put("N", "-.");
			put("O", "---");
			put("P", ".--.");
			put("Q", "--.-");
			put("R", ".-.");
			put("S", "...");
			put("T", "-");
			put("U", "..-");
			put("V", "...-");
			put("W", ".--");
			put("X", "-..-");
			put("Y", "-.--");
			put("Z", "--..");
			put("1", ".----");
			put("2", "..---");
			put("3", "...--");
			put("4", "....-");
			put("5", ".....");
			put("6", "-....");
			put("7", "--...");
			put("8", "---..");
			put("9", "----.");
			put("0", "-----");
			put("?", "..--..");
			put("/", "-..-.");
			put("-", "-...-");
			put(".", ".-.-.-");
			put("()", "-.--.-");
		}
	});
}
