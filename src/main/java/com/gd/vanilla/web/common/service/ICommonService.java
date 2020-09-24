package com.gd.vanilla.web.common.service;

import java.util.HashMap;
import java.util.List;

public interface ICommonService {

	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable;
	
	public String menuAthrtyCheck(String athrtyNo, String menuNo) throws Throwable;

	public List<HashMap<String, String>> getMenu(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCmnCodeAjax(int majorCode) throws Throwable;

	public List<HashMap<String, String>> getBoardList(HashMap<String, String> params) throws Throwable;
}
