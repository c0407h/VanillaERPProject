package com.gd.vanilla.web.common.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.vanilla.web.common.dao.IMainDao;

@Service
public class MainService implements IMainService {
	
	@Autowired
	public IMainDao iMainDao;

	@Override
	public List<HashMap<String, String>> getArticle(HashMap<String, String> params) throws Throwable {
		
		return iMainDao.getArticle(params);
	}
	

}
