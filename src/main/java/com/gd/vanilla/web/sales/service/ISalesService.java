package com.gd.vanilla.web.sales.service;

import java.util.HashMap;
import java.util.List;

import javax.swing.plaf.metal.MetalBorders.TableHeaderBorder;

import com.gd.vanilla.common.bean.PagingBean;

public interface ISalesService {

	public int getListCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> getList(HashMap<String, String> params)throws Throwable;

	public void Salesinsert(HashMap<String, String> params)throws Throwable;

	public void bsnswhole_ajax(HashMap<String, String> params)throws Throwable;
	//사원번호


	public int getocstmrlistCnt(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> cstmrlistajax(HashMap<String, String> params) throws Throwable;

	public void bsnswhole2(HashMap<String, String> params) throws Throwable;

	public void bsnswhole3(HashMap<String, String> params) throws Throwable;

	

	public String getBsnSeq(HashMap<String, String> params)throws Throwable;

	public int updatechance(HashMap<String, String> params)throws Throwable;

	public int updatechance2(HashMap<String, String> params)throws Throwable;

	public int writeSugajax1(HashMap<String, String> params)throws Throwable;

	public void writeSugajax2(HashMap<String, String> params)throws Throwable;
	
	public HashMap<String, String> getSales4(HashMap<String, String> params)throws Throwable;
	
	public HashMap<String, String> getSales3(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSales2(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSales(HashMap<String, String> params)throws Throwable;

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

	public int itemlistCnt(HashMap<String, String> params)throws Throwable;//조회item

	public List<HashMap<String, String>> itemlistAjax(HashMap<String, String> params)throws Throwable;

	

	public void oBinsert(HashMap<String, String> params)throws Throwable;//영업의견

	public HashMap<String, String> getoneAjax(HashMap<String, String> params)throws Throwable;

	public int obupdateAjax(HashMap<String, String> params)throws Throwable;

	
	//의견list
	public List<HashMap<String, String>> oBlist(HashMap<String, String> params)throws Throwable;

	public int obDeleteAjax(HashMap<String, String> params)throws Throwable;

	public void schdlAjax(HashMap<String, String> params)throws Throwable;

	public void schdlAjax2(HashMap<String, String> params)throws Throwable;

	public String getSchdlNoSeq(HashMap<String, String> params)throws Throwable;
	//일정등록시 일정번호시퀀스주기

	
	

	public int updateSchdl(HashMap<String, String> params)throws Throwable;
	//일정수정

	public List<HashMap<String, String>> getnewSchdlList(HashMap<String, String> params) throws Throwable;
	// new 일정수정

	public List<HashMap<String, String>> getnewsuggestList(HashMap<String, String> params) throws Throwable;
	// new 품목 리스트

	public HashMap<String, String> getSchdlAjax(HashMap<String, String> params)throws Throwable;
	//일정 하나가져오기

	public int DeleteAjax(HashMap<String, String> params)throws Throwable;


	public void itemsgstnAjax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> newsuggestListAjax(HashMap<String, String> params) throws Throwable;

	public void itemngtnAjax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> newsuggestListAjax2(HashMap<String, String> params) throws Throwable;

	public void itemorderAjax(HashMap<String, String> params)throws Throwable;

	public List<HashMap<String, String>> newsuggestListAjax3(HashMap<String, String> params)throws Throwable;

	public int getoorderlistCnt(HashMap<String, String> params)throws Throwable;

	public int getongtnlistCnt(HashMap<String, String> params)throws Throwable;

	public int getosgstnlistCnt(HashMap<String, String> params)throws Throwable;

	public String getItemSeq(HashMap<String, String> params)throws Throwable;
//아이템 등록시 시퀀스
	public void itemngtnAjax2(HashMap<String, String> params)throws Throwable;

	public void itemorderAjax2(HashMap<String, String> params)throws Throwable;

	public void itemsgstnAjax2(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getSgstnItemlAjax(HashMap<String, String> params)throws Throwable;

	public int DeletesgstnItemAjax(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getNgtnItemlAjax(HashMap<String, String> params)throws Throwable;

	public int DeletengtnItemAjax(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getOrderItemlAjax(HashMap<String, String> params)throws Throwable;

	public int DeleteorderItemAjax(HashMap<String, String> params)throws Throwable;
	

	

	

	public int getCstmrCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCstmrList(HashMap<String, String> params) throws Throwable;

	public void AddCstmr(HashMap<String, String> params)  throws Throwable;

	public int getCmpnyCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getCmpnyList(HashMap<String, String> params) throws Throwable;

	public void CSTMRCMPNYAdd(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getgradeList(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getdetailCstmrCmpnyList(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> gettypeList(HashMap<String, String> params) throws Throwable;

	public int CSTMRCMPNYupdate(HashMap<String, String> params) throws Throwable;

	/*
	 * public List<HashMap<String, String>> getcstmrcmpnyList(HashMap<String,
	 * String> params) throws Throwable; //위에꺼머임
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




	public int bsnsSchdlMgmntCnt(HashMap<String, String> params) throws Throwable; // 고객사 카운트

	public List<HashMap<String, String>> cclist(HashMap<String, String> params) throws Throwable; //고객사 리스트

	public int bsnsSchdlMgmntCnt2(HashMap<String, String> params) throws Throwable; //고객 카운트

	public List<HashMap<String, String>> clist(HashMap<String, String> params) throws Throwable; //고객 리스트

	public void bsnsSchdlMgmntWrite(HashMap<String, String> params) throws Throwable;  // 일정등록

	public int bsnsSchdlMgmntCnt3(HashMap<String, String> params) throws Throwable; // 일정 리스트 카운트

	public List<HashMap<String, String>> redrawList(HashMap<String, String> params) throws Throwable; //일정 리스트

	public List<HashMap<String, String>> infolist(HashMap<String, String> params) throws Throwable; //영업상세보기

	public int bsnsStsredrawPagingcnt(HashMap<String, String> params) throws Throwable; // 영업현황 카운트

	public List<HashMap<String, String>> bsnsStslist(HashMap<String, String> params) throws Throwable; // 영업현황 리스트

	public int bsnsSchdlMgmntWrite2(HashMap<String, String> params) throws Throwable;  // 일정등록2

	public String getbsnsschdlcstmrNO(HashMap<String, String> params) throws Throwable; // 일정등록 (일정고객)

	public List<HashMap<String, String>> cal_list2(HashMap<String, String> params) throws Throwable;// 일정리스트 바

	public List<HashMap<String, String>> chart(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> callist(HashMap<String, String> params) throws Throwable; //일정 바 리스트

	public int delSchdlUpdate(HashMap<String, String> params) throws Throwable;  //일정삭제 

	public void SchdlUpdate(HashMap<String, String> params) throws Throwable; //일정 수정

		








}