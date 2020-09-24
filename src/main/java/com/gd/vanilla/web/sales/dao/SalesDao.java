package com.gd.vanilla.web.sales.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao implements ISalesDao{
	@Autowired
	public SqlSession sqlSession;

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("sales.getList", params);//xml
	}

	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getListCnt", params);
	}

	@Override
	public void Salesinsert(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.Salesinsert", params);
		
	}

	@Override
	public void bsnswhole_ajax(HashMap<String, String> params) throws Throwable {
		//기회등록write
		sqlSession.insert("sales.bsnswhole_ajax", params);
	}

	@Override
	public int getocstmrlistCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getocstmrlistCnt", params);
	}

	@Override
	public List<HashMap<String, String>> cstmrlistajax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("sales.cstmrlistajax", params);
	}

	@Override
	public void bsnswhole2(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.bsnswhole2", params);
		
	}

	@Override
	public void bsnswhole3(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.bsnswhole3", params);
		
	}

	@Override
	public HashMap<String, String> getSales(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getSales", params);
	}

	@Override
	public String getBsnSeq(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getBsnSeq", params);
	}

	@Override
	public int updatechance(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.updatechance", params);
	}

	@Override
	public int updatechance2(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.updatechance2", params);
	}

	@Override
	public int writeSugajax1(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.writeSugajax1", params);
	}

	@Override
	public void writeSugajax2(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.writeSugajax2", params);
		
	}

	@Override
	public HashMap<String, String> getSales2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getSales2", params);
	}
	@Override
	public HashMap<String, String> getSales3(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getSales3", params);
	}
	@Override
	public HashMap<String, String> getSales4(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getSales4", params);
	}
	
	@Override
	public int updateSug(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.updateSug", params);
	}

	@Override
	public int updateSug2(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.updateSug2", params);
	}

	@Override
	public int ngtn_Ajax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.ngtn_Ajax", params);
		
	}

	@Override
	public void ngtn_Ajax2(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.ngtn_Ajax2", params);
		
	}

	@Override
	public int updatengtn(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.updatengtn", params);
	}

	@Override
	public int updatengtn2(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.updatengtn2", params);
	}

	@Override
	public void order_Ajax(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.order_Ajax", params);
		
	}

	@Override
	public void order_Ajax2(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.order_Ajax2", params);
		
	}

	@Override
	public int orderAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.orderAjax", params);
	}

	@Override
	public int orderAjax2(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.orderAjax2", params);
	}

	@Override
	public int itemlistCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.itemlistCnt", params);
	}

	@Override
	public List<HashMap<String, String>> itemlistAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("sales.itemlistAjax", params);
	}
	

	@Override
	public void oBinsert(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.oBinsert", params);
		
	}

	@Override
	public HashMap<String, String> getoneAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getoneAjax",params);
	}

	@Override
	public int obupdateAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.obupdateAjax", params);
	}

	@Override
	public List<HashMap<String, String>> oBlist(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("sales.oBlist", params);
	}

	@Override
	public int obDeleteAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.obDeleteAjax", params);
	}

	@Override
	public void schdlAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.schdlAjax", params);
		
	}

	@Override
	public void schdlAjax2(HashMap<String, String> params) throws Throwable {
		sqlSession.selectOne("sales.schdlAjax2", params);
		
	}

	@Override
	public String getSchdlNoSeq(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getSchdlNoSeq", params);
	}

	

	@Override
	public int updateSchdl(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.updateSchdl", params);
	}

	@Override
	public List<HashMap<String, String>> getnewSchdlList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.getnewSchdlList", params);
	}

	@Override
	public List<HashMap<String, String>> getnewsuggestList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.getnewsuggestList", params);
	}

	@Override
	public HashMap<String, String> getSchdlAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getSchdlAjax",params);
	}

	@Override
	public int DeleteAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.DeleteAjax", params);
	}

	

	@Override
	public void itemsgstnAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.itemsgstnAjax", params);
		
	}

	@Override
	public List<HashMap<String, String>> newsuggestListAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("sales.newsuggestListAjax", params);
	}

	@Override
	public void itemngtnAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.itemngtnAjax", params);
		
	}

	@Override
	public List<HashMap<String, String>> newsuggestListAjax2(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("sales.newsuggestListAjax2", params);
	}

	@Override
	public void itemorderAjax(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.itemorderAjax", params);
		
	}

	@Override
	public List<HashMap<String, String>> newsuggestListAjax3(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("sales.newsuggestListAjax3", params);
	}

	@Override
	public int getongtnlistCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getongtnlistCnt", params);
	}

	@Override
	public int getosgstnlistCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getosgstnlistCnt", params);
	}

	@Override
	public int getoorderlistCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getoorderlistCnt", params);
	}

	@Override
	public String getItemSeq(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getItemSeq", params);
	}

	@Override
	public void itemngtnAjax2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.itemngtnAjax2", params);
		
	}

	@Override
	public void itemorderAjax2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.itemorderAjax2", params);
		
	}

	@Override
	public void itemsgstnAjax2(HashMap<String, String> params) throws Throwable {
		sqlSession.insert("sales.itemsgstnAjax2", params);
		
	}

	@Override
	public HashMap<String, String> getSgstnItemlAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getSgstnItemlAjax",params);
	}

	@Override
	public int DeletesgstnItemAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.DeletesgstnItemAjax", params);
	}

	@Override
	public HashMap<String, String> getNgtnItemlAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getNgtnItemlAjax",params);
	}

	@Override
	public int DeletengtnItemAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.DeletengtnItemAjax", params);
	}

	@Override
	public HashMap<String, String> getOrderItemlAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("sales.getOrderItemlAjax",params);
	}

	@Override
	public int DeleteorderItemAjax(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("sales.DeleteorderItemAjax", params);
	}

	

	

	@Override
	public int bsnsSchdlMgmntCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.bsnsSchdlMgmntCnt", params); //고객사카운트
	}

	@Override
	public List<HashMap<String, String>> cclist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.cclist", params); //고객사
	}

	@Override
	public int bsnsSchdlMgmntCnt2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.bsnsSchdlMgmntCnt2", params); //고객카운트
	}
	
	@Override
	public List<HashMap<String, String>> clist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.clist", params); // 고객
	}

	@Override
	public void bsnsSchdlMgmntWrite(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.bsnsSchdlMgmntWrite", params);
		
	}

	@Override
	public int bsnsSchdlMgmntCnt3(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.bsnsSchdlMgmntCnt3", params); // 일정리스트카운트
	}

	@Override
	public List<HashMap<String, String>> redrawList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.redrawList", params); //일정리스트
	}

	@Override
	public List<HashMap<String, String>> infolist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.infolist", params); // 일정상세보기
	}

	@Override
	public int bsnsStsredrawPagingcnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.bsnsStsredrawPagingcnt", params); // 영업현황 카운트
	}

	@Override
	public List<HashMap<String, String>> bsnsStslist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.bsnsStslist", params); // 영업현황 리스트
	}

	@Override
	public int bsnsSchdlMgmntWrite2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("bsnsSchdlMgmntWrite2", params);
	}

	@Override
	public String getbsnsschdlcstmrNO(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("getbsnsschdlcstmr", params);
	}

	@Override
	public List<HashMap<String, String>> cal_list2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("cal_list2", params);
	}

	@Override
	public List<HashMap<String, String>> chart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("chart", params);
	}

	@Override
	public List<HashMap<String, String>> callist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("callist", params); //일정 바 리스트
	}

	@Override
	public int delSchdlUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("sales.delSchdlUpdate",params);
	}

	@Override
	public void SchdlUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.update("sales.SchdlUpdate", params);
		
	}

	/*
	 * @Override public List<HashMap<String, String>> getChartData(HashMap<String,
	 * String> params) throws Throwable { // TODO Auto-generated method stub return
	 * sqlSession.selectOne("getChartData", params); }
	 */

	/*
	 * @Override public List<HashMap<String, String>>
	 * bsnsSchdlselectnamelist(HashMap<String, String> params) throws Throwable { //
	 * TODO Auto-generated method stub return
	 * sqlSession.selectOne("bsnsSchdlselectnamelist", params); }
	 */
	@Override
	public int getCstmrCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.getCstmrCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCstmrList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.getCstmrList", params);
	}

	@Override
	public void AddCstmr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.AddCstmr", params);
	}

	@Override
	public int getCmpnyCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.getCmpnyCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getCmpnyList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.getCmpnyList", params);
	}

	@Override
	public void CSTMRCMPNYAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.CSTMRCMPNYAdd", params);
	}

	@Override
	public List<HashMap<String, String>> getgradeList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.getgradeList", params);
	}

	@Override
	public HashMap<String, String> getdetailCstmrCmpnyList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.getdetailCstmrCmpnyList", params);
	}

	@Override
	public List<HashMap<String, String>> gettypeList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.gettypeList", params);
	}

	@Override
	public int CSTMRCMPNYupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("sales.CSTMRCMPNYupdate", params);
	}

	/*
	 * @Override public List<HashMap<String, String>>
	 * getcstmrcmpnyList(HashMap<String, String> params) throws Throwable { // TODO
	 * Auto-generated method stub return
	 * sqlSession.selectList("sales.getcstmrcmpnyList", params); } //뭐냐이거
	 */
	@Override
	public int CstmrAddgetcstmrcmpnyCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.CstmrAddgetcstmrcmpnyCnt", params);
	}

	@Override
	public List<HashMap<String, String>> CstmrAddgetsearchcstmrcmpnyList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.CstmrAddgetsearchcstmrcmpnyList", params);
	}

	@Override
	public HashMap<String, String> getdetailCstmr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.getdetailCstmr", params);
	}

	@Override
	public int DetailCSTMRupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("sales.DetailCSTMRupdate", params);
	}

	@Override
	public int DetailCSTMRDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("sales.DetailCSTMRDel",params);
	}

	@Override
	public void AddCstmrMngr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.AddCstmrMngr", params);
		
	}

	@Override
	public String getCstmrNoSeq(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.getCstmrNoSeq",params);
	}

	@Override
	public int CstmrUpategetEmplyCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sales.CstmrUpategetEmplyCnt", params);
	}

	@Override
	public List<HashMap<String, String>> CstmrUpdategetsearchEmplyList(HashMap<String, String> params)
			throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectList("sales.CstmrUpdategetsearchEmplyList", params);
	}

	@Override
	public int getoutEmplyupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("sales.getoutEmplyupdate", params);
	}

	@Override
	public void getEmplyMngradd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		sqlSession.insert("sales.getEmplyMngradd", params);
	}




	
}