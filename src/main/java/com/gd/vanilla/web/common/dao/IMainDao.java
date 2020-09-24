package com.gd.vanilla.web.common.dao;

import java.util.HashMap;
import java.util.List;

public interface IMainDao {

	List<HashMap<String, String>> getArticle(HashMap<String, String> params) throws Throwable;

}
