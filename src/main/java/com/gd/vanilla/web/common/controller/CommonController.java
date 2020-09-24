package com.gd.vanilla.web.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.vanilla.common.CommonProperties;
import com.gd.vanilla.util.Utils;
import com.gd.vanilla.web.common.service.ICommonService;

@Controller
public class CommonController {
	@Autowired
	public ICommonService iCommonService;
	
	@RequestMapping({ "/login", "/" })
	public ModelAndView commonLogin(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sEmpNo") != null) {
			mav.setViewName("redirect:sample");
		} else {
			mav.setViewName("common/login");
		}

		return mav;
	}
	
	@RequestMapping(value = "/loginAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commonLoginAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			//패스워드 암호화
			params.put("psrd", Utils.encryptAES128(params.get("psrd")));
			
			HashMap<String, String> data = iCommonService.loginCheck(params);
			
			if(data != null && !data.isEmpty()) {
				session.setAttribute("sEmplyNo", data.get("EMPLY_NO"));
				session.setAttribute("sEmplyName", data.get("EMPLY_NAME"));
				session.setAttribute("sPhtgr", data.get("PHTGR"));
				session.setAttribute("sAthrtyNo", data.get("ATHRTY_NO"));
				session.setAttribute("sDprtmntNo", data.get("DPRTMNT_NO"));
				session.setAttribute("sDprtmntName", data.get("DPRTMNT_NAME"));
				session.setAttribute("sPstnNo", data.get("PSTN_NO"));
				session.setAttribute("sPstnName", data.get("PSTN_NAME"));
				
				modelMap.put("res", CommonProperties.RESULT_SUCCESS);
			} else {
				modelMap.put("res", CommonProperties.RESULT_FAILED);
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("res", CommonProperties.RESULT_ERROR);
		}
		
		
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/logoff")
	public ModelAndView commonLogoff(HttpSession session, ModelAndView mav) {
		session.invalidate();
		
		mav.setViewName("redirect:login");

		return mav;
	}
	
	@RequestMapping(value = "/header")
	public ModelAndView commonHeader(HttpSession session, ModelAndView mav) throws Throwable {
		
		mav.setViewName("common/header");
		
		return mav;
	}

	@RequestMapping(value = "/topLeft")
	public ModelAndView commonTopLeft(HttpSession session, ModelAndView mav) throws Throwable {
		
		mav.setViewName("common/topLeft");

		return mav;
	}
	
	@RequestMapping(value = "/bottom")
	public ModelAndView commonBottom(HttpSession session, ModelAndView mav) throws Throwable {
		
		mav.setViewName("common/bottom");
		
		return mav;
	}

	@RequestMapping(value = "/commonGetMenuAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String commonGetMenuAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		params.put("athrtyNo", String.valueOf(session.getAttribute("sAthrtyNo")));
		params.put("dprtmntNo", String.valueOf(session.getAttribute("sDprtmntNo")));
		params.put("pstnNo", String.valueOf(session.getAttribute("sPstnNo")));
		
		List<HashMap<String, String>> leftMenu = iCommonService.getMenu(params);
		
		modelMap.put("leftMenu", leftMenu);
		
		for(int i = 0 ; i < leftMenu.size() ; i++) {
			if(String.valueOf(leftMenu.get(i).get("MENU_NO")).equals(params.get("menuNo"))) {
				modelMap.put("depth", leftMenu.get(i).get("DEPTH"));
				modelMap.put("flow", leftMenu.get(i).get("MENU_FLOW").split(","));
			}
		}
		
		if(!modelMap.containsKey("flow")) {
			modelMap.put("flow", "");
			modelMap.put("depth", "");
		}
		
		List<HashMap<String, String>> boardList = iCommonService.getBoardList(params);
		
		modelMap.put("boardList", boardList);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/getCmnCodeAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String getCmnCodeAjax(@RequestParam("majorCode") int majorCode) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		List<HashMap<String, String>> codeList = iCommonService.getCmnCodeAjax(majorCode);
		
		modelMap.put("codeList", codeList);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/sample")
	public ModelAndView contentsTest(HttpSession session, ModelAndView mav) {
		if(session.getAttribute("sAthrtyNo") != null) {
			mav.setViewName("common/sample");
		} else {
			mav.setViewName("redirect:login");
		}
		
		return mav;
	}
}
