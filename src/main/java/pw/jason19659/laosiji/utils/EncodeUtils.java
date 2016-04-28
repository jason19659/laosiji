package pw.jason19659.laosiji.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * 
 */

/**
 * @author <a href="mailto:ziywang@cisco.com">Jason</a>
 *
 * 
 *
 *         2015年12月24日
 */
public class EncodeUtils {
 
	public static int offest = 500;   
 
	public static String decode(String encode) {
		int[] re = encode.chars().map(c -> c - offest).toArray();
		long a = encode.chars().map(c -> c - offest).filter(c -> c == '_').count();
		StringBuilder decode = new StringBuilder((int) a);
		for (int i : re) {
			decode.append((char) i);
		}
		Character result[] = new Character[(int) a];
		Pattern team = Pattern.compile("([\\s\\S]{1}(_\\d+)+)");
		Matcher mteam = team.matcher(decode);
		ArrayList<String> teamsStrings = new ArrayList<String>();
		while (mteam.find()) {
			teamsStrings.add(mteam.group(0));
		}   
		Pattern p = Pattern.compile("_(\\d*)");
		for (String ss : teamsStrings) { 
			Matcher m = p.matcher(ss);
			while (m.find()) { 
				try {
					result[Integer.parseInt(m.group(1))] =  ss.charAt(0);
				} catch (Exception e) {
				}
			}
		}
		StringBuilder reStringBuilder = new StringBuilder();
		Arrays.stream(result).filter(c ->c != null).forEach(c -> reStringBuilder.append(c));
		return reStringBuilder.toString();
	}

	public static String encode(String string) {
		HashMap<Character, List<Integer>> maps = new HashMap<>();
		for (Character a : string.toCharArray()) {
			maps.put(a, new ArrayList<Integer>());
		}
		for (int i = 0; i < string.length(); i++) {
			maps.get(string.charAt(i)).add(i);
		}
		StringBuilder sb = new StringBuilder();
		maps.keySet().stream().forEach(c -> {
			if (c >= '0' && c <= '9') { 
				sb.append('.');
			}
			sb.append(c);
			maps.get(c).forEach(e -> sb.append("_" + e));
			sb.append(""); 
		});
		return offestString(sb.toString());
	}

	/**
	 * @param sb
	 * @return
	 */
	public static String offestString(String sb) {
		return offestString(sb,offest);
	}
	
	public static String offestString(String sb,int offest) {
		StringBuilder sb2 = new StringBuilder(sb.length());
		for (char b : sb.toString().toCharArray()) {
			sb2.append((char) (b + offest));
		}
		return sb2.toString();
	}
       
	public static void main(String[] args) throws IOException {
		System.out.println(decode(encode("123")));;
	}
}
