package com.gd.vanilla.web.common.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao implements ICommonDao {
	@Autowired
	public SqlSession sqlSession;

	@Override
	public HashMap<String, String> loginCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("common.loginCheck", params);
	}

	@Override
	public String menuAthrtyCheck(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("common.menuAthrtyCheck", params);
	}

	@Override
	public List<HashMap<String, String>> getMenu(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("common.getMenu", params);
	}

	@Override
	public List<HashMap<String, String>> getCmnCodeAjax(int majorCode) throws Throwable {
		return sqlSession.selectList("common.getCmnCodeAjax", majorCode);
	}

	@Override
	public List<HashMap<String, String>> getBoardList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("common.getBoardList", params);
	}
}
