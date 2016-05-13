/**
 * 
 */
package pw.jason19659.laosiji.controller;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import pw.jason19659.laosiji.model.Code;
import pw.jason19659.laosiji.utils.EasyCode;
import pw.jason19659.laosiji.utils.EncodeUtils;
import pw.jason19659.laosiji.utils.Esu;
import pw.jason19659.laosiji.utils.Morse;
import pw.jason19659.laosiji.utils.PhoneCodeUtils;

import com.alibaba.fastjson.JSON;

/**
 * @author <a href="mailto:ziywang@cisco.com">Jason</a>
 *
 * pw.jason19659.laosiji.controller
 *
 * 2015年12月28日
 */
@RestController
public class MainController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	@RequestMapping("/encode")
	@ResponseBody 
	public Code encode(String code) { 
		Code c = new Code();
		try {
			String encode = EncodeUtils.encode(code);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	@RequestMapping("/decode")
	@ResponseBody 
	public Code decode(String code) { 
		Code c = new Code();
		try {
			String encode = EncodeUtils.decode(code);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	} 
	
	@RequestMapping("/esu")
	@ResponseBody 
	public Code esu(String code) { 
		Code c = new Code();
		try {
			c.setCode(Esu.getEsuSentence());
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	@RequestMapping("/abcdToQwer")
	@ResponseBody 
	public Code abcdToQwer(String code) { 
		Code c = new Code();
		try {
			String encode = EasyCode.abcdToQwer(code);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	@RequestMapping("/qwerToAbcd")
	@ResponseBody 
	public Code qwerToAbcd(String code) { 
		Code c = new Code();
		try {
			String encode = EasyCode.qwerToAbcd(code);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	} 
	@RequestMapping("/zhalan")
	@ResponseBody 
	public Code zhanlan(String code,int number) { 
		Code c = new Code();
		try {
			String encode = EasyCode.zhalan(code, number);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	@RequestMapping("/deZhalan")
	@ResponseBody 
	public Code deZhalan(String code,int number) { 
		Code c = new Code();
		try {
			String encode = EasyCode.deZhalan(code, number);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	} 
	
	@RequestMapping("/offest")
	@ResponseBody 
	public Code offest(String code,int number) { 
		Code c = new Code();
		try {
			String encode = EasyCode.offest(code, number);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	
	@RequestMapping("/alphabetToMorse")
	@ResponseBody 
	public Code alphabetToMorse(String code,@RequestParam(required=false)String spilt) { 
		Code c = new Code();
		try {
			if (StringUtils.isEmpty(spilt)) {
				spilt = " ";
			}
			String encode = Morse.alphabetToMorseCode(code, spilt);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	@RequestMapping("/morseToAlphabet")
	@ResponseBody 
	public Code morseToAlphabet(String code,@RequestParam(required=false)String spilt) { 
		Code c = new Code();
		try {
			if (StringUtils.isEmpty(spilt)) {
				spilt = " ";
			}
			String encode = Morse.morseToAlphabet(code, spilt);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	@RequestMapping("/alphabetToPhone")
	@ResponseBody 
	public Code alphabetToPhone(String code) { 
		Code c = new Code();
		try {
			String encode = PhoneCodeUtils.alphabetToPhone(code);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	}
	
	@RequestMapping("/phoneToAlphabet")
	@ResponseBody 
	public Code phoneToAlphabet(String code) { 
		Code c = new Code();
		try {
			String encode = PhoneCodeUtils.phoneToAlphatbet(code);
			c.setCode(encode);
		} catch (Exception e) {
			c.setCode("无法转换");
		}
		return c;
	} 
}
