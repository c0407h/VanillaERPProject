package com.gd.vanilla.web.sales.dao;

import java.util.HashMap;
import java.util.List;

public interface ISalesDao {

	public List<HashMap<String, String>> getList(HashMap<String, String> params)throws Throwable;

	public int getListCnt(HashMap<String, String> params)throws Throwable;

	public void Salesinsert(HashMap<String, String> params)throws Throwable;

	public void bsnswhole_ajax(HashMap<String, String> params)throws Throwable;

	public int getocstmrlistCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> cstmrlistajax(HashMap<String, String> params) throws Throwable;

	public void bsnswhole2(HashMap<String, String> params) throws Throwable;

	public void bsnswhole3(HashMap<String, String> params) throws Throwable;

	

	public String getBsnSeq(HashMap<String, String> params) throws Throwable;

	public int updatechance(HashMap<String, String> params)throws Throwable;

	public int updatechance2(HashMap<String, String> params)throws Throwable;

	public int writeSugajax1(HashMap<String, String> params)throws Throwable;
	//제안t 등록시 영업번호 update

	public void writeSugajax2(HashMap<String, String> params)throws Throwable;
	
	public HashMap<String, String> getSales(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getSales2(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSales3(HashMap<String, String> params)throws Throwable;
	
	public HashMap<String, String> getSales4(HashMap<String, String> params)throws Throwable;
	
	public int updateSug(HashMap<String, String> params)throws Throwable;

	public int updateSug2(HashMap<String, String> params)throws Throwable;

	public int ngtn_Ajax(HashMap<String, String> params)throws Throwable;

	public void ngtn_Ajax2(HashMap<String, String> params)throws Throwable;

	public int updatengtn(HashMap<String, String> params)throws Throwable;

	public int updatengtn2(HashMap<String, String> params)throws Throwable;

	public void order_Ajax(HashMap<String, String> params)throws Throwable;

	public void order_Ajax2(HashMap<String, String> params)throws Throwable;

	public int orderAjax(HashMap<String, String> params)throws Throwable;

	public int orderAjax2(HashMap<String, String> params)throws Throwable;

	public int itemlistCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> itemlistAjax(HashMap<String, String> params)throws Throwable;



	public void oBinsert(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getoneAjax(HashMap<String, String> params)throws Throwable;

	public int obupdateAjax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> oBlist(HashMap<String, String> params)throws Throwable;

	public int obDeleteAjax(HashMap<String, String> params)throws Throwable;

	public void schdlAjax(HashMap<String, String> params)throws Throwable;

	public void schdlAjax2(HashMap<String, String> params)throws Throwable;

	public String getSchdlNoSeq(HashMap<String, String> params)throws Throwable;

	

	public int updateSchdl(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getnewSchdlList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getnewsuggestList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getSchdlAjax(HashMap<String, String> params)throws Throwable;

	public int DeleteAjax(HashMap<String, String> params)throws Throwable;

	public void itemsgstnAjax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> newsuggestListAjax(HashMap<String, String> params)throws Throwable;

	public void itemngtnAjax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> newsuggestListAjax2(HashMap<String, String> params)throws Throwable;

	public void itemorderAjax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> newsuggestListAjax3(HashMap<String, String> params)throws Throwable;

	public int getongtnlistCnt(HashMap<String, String> params)throws Throwable;

	public int getosgstnlistCnt(HashMap<String, String> params)throws Throwable;

	public int getoorderlistCnt(HashMap<String, String> params)throws Throwable;

	public String getItemSeq(HashMap<String, String> params)throws Throwable;

	public void itemngtnAjax2(HashMap<String, String> params)throws Throwable;

	public void itemorderAjax2(HashMap<String, String> params)throws Throwable;

	public void itemsgstnAjax2(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSgstnItemlAjax(HashMap<String, String> params)throws Throwable;

	public int DeletesgstnItemAjax(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getNgtnItemlAjax(HashMap<String, String> params)throws Throwable;

	public int DeletengtnItemAjax(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getOrderItemlAjax(HashMap<String, String> params)throws Throwable;

	public int DeleteorderItemAjax(HashMap<String, String> params)throws Throwable;
	




	public int bsnsSchdlMgmntCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> cclist(HashMap<String, String> params) throws Throwable;

	public int bsnsSchdlMgmntCnt2(HashMap<String, String> params) throws Throwable;
	
	public List<HashMap<String, String>> clist(HashMap<String, String> params) throws Throwable;

	public void bsnsSchdlMgmntWrite(HashMap<String, String> params) throws Throwable;

	public int bsnsSchdlMgmntCnt3(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> redrawList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> infolist(HashMap<String, String> params) throws Throwable;

	public int bsnsStsredrawPagingcnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> bsnsStslist(HashMap<String, String> params) throws Throwable;

	public int bsnsSchdlMgmntWrite2(HashMap<String, String> params) throws Throwable;

	public String getbsnsschdlcstmrNO(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> cal_list2(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> chart(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> callist(HashMap<String, String> params) throws Throwable;

	public int delSchdlUpdate(HashMap<String, String> params) throws Throwable;

	public void SchdlUpdate(HashMap<String, String> params) throws Throwable;

//	public List<HashMap<String, String>> getChartData(HashMap<String, String> params) throws Throwable;

	//public List<HashMap<String, String>> bsnsSchdlselectnamelist(HashMap<String, String> params) throws Throwable;

	public int getCstmrCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCstmrList(HashMap<String, String> params) throws Throwable;

	public void AddCstmr(HashMap<String, String> params) throws Throwable;

	public int getCmpnyCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCmpnyList(HashMap<String, String> params) throws Throwable;

	public void CSTMRCMPNYAdd(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getgradeList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getdetailCstmrCmpnyList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> gettypeList(HashMap<String, String> params) throws Throwable;

	public int CSTMRCMPNYupdate(HashMap<String, String> params) throws Throwable;

	/*
	 * public List<HashMap<String, String>> getcstmrcmpnyList(HashMap<String,
	 * String> params) throws Throwable; //위에꺼뭐임?
	 */	
	public int CstmrAddgetcstmrcmpnyCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> CstmrAddgetsearchcstmrcmpnyList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getdetailCstmr(HashMap<String, String> params) throws Throwable;

	public int DetailCSTMRupdate(HashMap<String, String> params) throws Throwable;

	public int DetailCSTMRDel(HashMap<String, String> params) throws Throwable;

	public void AddCstmrMngr(HashMap<String, String> params) throws Throwable;

	public String getCstmrNoSeq(HashMap<String, String> params) throws Throwable;

	public int CstmrUpategetEmplyCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> CstmrUpdategetsearchEmplyList(HashMap<String, String> params) throws Throwable;

	public int getoutEmplyupdate(HashMap<String, String> params) throws Throwable;

	public void getEmplyMngradd(HashMap<String, String> params) throws Throwable;



}