/**
 * 
 */
package pw.jason19659.laosiji.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import pw.jason19659.laosiji.model.Code;
import pw.jason19659.laosiji.utils.EncodeUtils;
import pw.jason19659.laosiji.utils.Esu;

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
	
}
