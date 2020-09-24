package com.gd.vanilla.web.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao implements IMainDao {
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getArticle(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("common.getArticle", params);
	}

}
