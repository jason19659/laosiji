/**
 * 
 */
package pw.jason19659.laosiji.utils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Scanner;

/**
 * @author <a href="mailto:jason19659@163.com">jason19659</a>
 *
 * pw.jason19659.laosiji.utils
 *
 * 2016年4月20日
 */
public class EasyCode {
	private static final char[] abcd = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
	private static final char[] qwer = {'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m'};
	public static void main(String[] args) {
		System.out.println(zhalan("woaini", 3));
		System.out.println(deZhalan("wionai", 3));
	}
	
	public static String qwerToAbcd(String qwer) {
		qwer = qwer.toLowerCase();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < qwer.length(); i++) {
			try {
				sb.append(abcd[getQWERIndex(qwer.charAt(i))]);
			} catch (Exception e) {
				sb.append(qwer.charAt(i));
			}
		
		}
		return sb.toString();
	}
	

	public static String abcdToQwer(String abcd) {
		abcd = abcd.toLowerCase();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < abcd.length(); i++) {
			try {
				sb.append(qwer[getABCDIndex(abcd.charAt(i))]);
			} catch (Exception e) {
				sb.append(abcd.charAt(i));
			}
			
		}
		return sb.toString();
	}
	
	public static char qwerToAbcd(char qwer) {
		return abcd[getQWERIndex(qwer)];
	}
	
	
	public static char abcdToQwer(char abcd) {
		return qwer[getABCDIndex(abcd)];
	}
	
	public static int getQWERIndex(char a){
		for (int i = 0; i < qwer.length; i++) {
			if (a == qwer[i]) {
				return i;
			}
		}
		return -1;
	}
	
	
	public static int getABCDIndex(char a){
		for (int i = 0; i < abcd.length; i++) {
			if (a == abcd[i]) {
				return i;
			}
		}
		return -1;
	}
	
	public static String offest(String text,int offest) {
		text = text.toLowerCase();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < text.length(); i++) {
			char a = text.charAt(i);
			try {
				int index = getABCDIndex(a);
				if (index == -1) {
					throw new Exception("非字母不位移");
				}
				index = (index + offest) % 26;
				sb.append(abcd[index]);
			} catch (Exception e) {
				sb.append(a);
			}
			
		}
		return sb.toString();
	}
	
	public static String zhalan(String text,int zhalan) {
		StringBuilder sb = new StringBuilder();
		HashMap<Integer, StringBuilder> hashMap = new HashMap<Integer, StringBuilder>();
		for (int i = 0; i < text.length(); i++) {
			int yushu = i % zhalan;
			if (hashMap.get(yushu) == null) {
				hashMap.put(yushu, new StringBuilder());
			}
			hashMap.get(yushu).append(text.charAt(i));
		}
		Integer[] array = hashMap.keySet().toArray(new Integer[0]);
		Arrays.sort(array);
		for (Integer i : array) {
			sb.append(hashMap.get(i));
		}
		return sb.toString();
	}
	
	public static String deZhalan(String text,int zhalan) {
		int size = text.length();
		int originZhanlan = size / zhalan;
		int offest = size % zhalan;
		StringBuilder end = new StringBuilder();
		StringBuilder sb = new StringBuilder(text);
		for (int i = originZhanlan; i < originZhanlan+offest; i++) {
			end.append(text.charAt(i));
		}
		try {
			sb.delete(originZhanlan, originZhanlan+offest);
		} catch (Exception e) {
		}
	
		return zhalan(sb.toString(),originZhanlan) + end;
	}
	
	public static String alphabetcal(String text) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < text.length(); i++) {
			char a = text.charAt(i);
			int index = getABCDIndex(a);
			index = 25 - index;
			sb.append(abcd[index]);
		}
		return sb.toString();
	}
}
