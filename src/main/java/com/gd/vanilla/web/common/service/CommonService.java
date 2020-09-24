package com.gd.vanilla.web.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.vanilla.web.common.dao.ICommonDao;

@Service
public class CommonService implements ICommonService {
	@Autowired
	public ICommonDao iCommonDao;

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return iCommonDao.loginCheck(params);
	}
	
	/*
	 menuAuthCheck
	 param : authNo - 권한번호
	       : menuNo - 메뉴번호
	 return : 권한타입 - 0(권한없음), 1(읽기), 2(읽기,쓰기)
	 */
	@Override
	public String menuAthrtyCheck(String athrtyNo, String menuNo) throws Throwable {
		HashMap<String, String> params = new HashMap<String, String>();
		
		params.put("athrtyNo", athrtyNo);
		params.put("menuNo", menuNo);
		
		return iCommonDao.menuAthrtyCheck(params);
	}

	@Override
	public List<HashMap<String, String>> getMenu(HashMap<String, String> params) throws Throwable {
		return iCommonDao.getMenu(params);
	}

	@Override
	public List<HashMap<String, String>> getCmnCodeAjax(int majorCode) throws Throwable {
		return iCommonDao.getCmnCodeAjax(majorCode);
	}

	@Override
	public List<HashMap<String, String>> getBoardList(HashMap<String, String> params) throws Throwable {
		return iCommonDao.getBoardList(params);
	}
}
