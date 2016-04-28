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
public class QwerToAbcd {
	private static final char[] abcd = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};
	private static final char[] qwer = {'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m'};
	public static void main(String[] args) {
//		Scanner sc = new Scanner(System.in);
//		while (true) {
////			System.out.print(abcd[sc.nextInt() ]);
//			String a =  sc.nextLine();
//			for (int i = 0; i < a.length(); i++) {
////				System.out.print(abcdToQwer(a.charAt(i)));
//				System.out.print(qwerToAbcd(a.charAt(i)));
//			}
//		}
		String text = "ALXYUWREKNPZPIALOJDMDQAOFIWIEJI";
//		String r1 = qwerToAbcd(text);
//		String r2 = abcdToQwer(text);
		text = alphabetcal(text);
		System.out.println(text);
//		for (int i = 1; i <= 25; i++) {
//			String offest = offest(text, i);
//			System.out.println(offest.length() == 28);
//			for (int j = 1; j <= 28; j++) {
//				String zhalan = zhalan("TAHCEIRPEHIESR", 2);
//				System.out.println(zhalan);
//			}
//		}
	}
	
	public static String qwerToAbcd(String qwer) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < qwer.length(); i++) {
			sb.append(abcd[getQWERIndex(qwer.charAt(i))]);
		}
		return sb.toString();
	}
	

	public static String abcdToQwer(String abcd) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < abcd.length(); i++) {
			sb.append(qwer[getABCDIndex(abcd.charAt(i))]);
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
		return 0;
	}
	
	
	public static int getABCDIndex(char a){
		for (int i = 0; i < abcd.length; i++) {
			if (a == abcd[i]) {
				return i;
			}
		}
		return 0;
	}
	
	public static String offest(String text,int offest) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < text.length(); i++) {
			char a = text.charAt(i);
			int index = getABCDIndex(a);
			index = (index + offest) % 26;
			sb.append(abcd[index]);
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
