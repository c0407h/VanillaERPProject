package com.gd.vanilla.web.common.dao;

import java.util.HashMap;
import java.util.List;

public interface ICommonDao {

	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable;

	public String menuAthrtyCheck(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMenu(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCmnCodeAjax(int majorCode) throws Throwable;

	public List<HashMap<String, String>> getBoardList(HashMap<String, String> params) throws Throwable;
}
