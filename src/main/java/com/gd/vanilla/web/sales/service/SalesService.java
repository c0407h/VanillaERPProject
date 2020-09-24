package com.gd.vanilla.web.sales.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.vanilla.web.sales.dao.ISalesDao;

@Service
public class SalesService implements ISalesService{
	@Autowired
	public ISalesDao iSalesDao;

	

	@Override
	public List<HashMap<String, String>> getList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getList(params);
	}
	
	
	@Override
	public int getListCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getListCnt(params);
	}


	@Override
	public void Salesinsert(HashMap<String, String> params) throws Throwable {
		 iSalesDao.Salesinsert(params);
		
	}


	@Override
	public void bsnswhole_ajax(HashMap<String, String> params) throws Throwable {
		//사원번호session
		iSalesDao.bsnswhole_ajax(params);
	}


	@Override
	public int getocstmrlistCnt(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getocstmrlistCnt(params);
	}


	@Override
	public List<HashMap<String, String>> cstmrlistajax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.cstmrlistajax(params);
	}


	@Override
	public void bsnswhole2(HashMap<String, String> params) throws Throwable {
		iSalesDao.bsnswhole2(params);
	}


	@Override
	public void bsnswhole3(HashMap<String, String> params) throws Throwable {
		iSalesDao.bsnswhole3(params);
		
	}


	@Override
	public HashMap<String, String> getSales(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getSales(params);
	}


	@Override
	public String getBsnSeq(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getBsnSeq(params);
	}


	@Override
	public int updatechance(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.updatechance(params);
	}


	@Override
	public int updatechance2(HashMap<String, String> params) throws Throwable {
		return iSalesDao.updatechance2(params);
	}


	@Override
	public int writeSugajax1(HashMap<String, String> params) throws Throwable {
		return iSalesDao.writeSugajax1(params);
		//제안t영업번호update
	}


	@Override
	public void writeSugajax2(HashMap<String, String> params) throws Throwable {
		iSalesDao.writeSugajax2(params);
		
	}


	@Override
	public HashMap<String, String> getSales2(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getSales2(params);
	}

	@Override
	public HashMap<String, String> getSales3(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getSales3(params);
	}
	
	@Override
	public HashMap<String, String> getSales4(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getSales4(params);
	}
	@Override
	public int updateSug(HashMap<String, String> params) throws Throwable {
		return iSalesDao.updateSug(params);
	}


	@Override
	public int updateSug2(HashMap<String, String> params) throws Throwable {
		return iSalesDao.updateSug2(params);
	}


	@Override
	public int ngtn_Ajax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.ngtn_Ajax(params);
		
	}


	@Override
	public void ngtn_Ajax2(HashMap<String, String> params) throws Throwable {
		iSalesDao.ngtn_Ajax2(params);
		
	}


	@Override
	public int updatengtn(HashMap<String, String> params) throws Throwable {
		return iSalesDao.updatengtn(params);
	}


	@Override
	public int updatengtn2(HashMap<String, String> params) throws Throwable {
		return iSalesDao.updatengtn2(params);
	}


	@Override
	public void order_Ajax(HashMap<String, String> params) throws Throwable {
		iSalesDao.order_Ajax(params);
		
	}


	@Override
	public void order_Ajax2(HashMap<String, String> params) throws Throwable {
		iSalesDao.order_Ajax2(params);
		
	}


	@Override
	public int orderAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.orderAjax(params);
	}


	@Override
	public int orderAjax2(HashMap<String, String> params) throws Throwable {
		return iSalesDao.orderAjax2(params);
	}


	@Override
	public int itemlistCnt(HashMap<String, String> params) throws Throwable {
		return iSalesDao.itemlistCnt(params);
	}


	@Override
	public List<HashMap<String, String>> itemlistAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.itemlistAjax(params);
	}


	


	@Override
	public void oBinsert(HashMap<String, String> params) throws Throwable {
		iSalesDao.oBinsert(params);
		
	}


	@Override
	public HashMap<String, String> getoneAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getoneAjax(params);
	}


	@Override
	public int obupdateAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.obupdateAjax(params);
	}


	@Override
	public List<HashMap<String, String>> oBlist(HashMap<String, String> params) throws Throwable {
		return iSalesDao.oBlist(params);
	}


	@Override
	public int obDeleteAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.obDeleteAjax(params);
	}


	@Override
	public void schdlAjax(HashMap<String, String> params) throws Throwable {
		iSalesDao.schdlAjax(params);
		
	}


	@Override
	public void schdlAjax2(HashMap<String, String> params) throws Throwable {
		iSalesDao.schdlAjax2(params);
		
	}


	@Override
	public String getSchdlNoSeq(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getSchdlNoSeq(params);
	}




	@Override
	public int updateSchdl(HashMap<String, String> params) throws Throwable {
		return iSalesDao.updateSchdl(params);
	}


	@Override
	public List<HashMap<String, String>> getnewSchdlList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getnewSchdlList(params);
	}


	@Override
	public List<HashMap<String, String>> getnewsuggestList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getnewsuggestList(params);
	}


	@Override
	public HashMap<String, String> getSchdlAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getSchdlAjax(params);
	}


	@Override
	public int DeleteAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.DeleteAjax(params);
	}


	@Override
	public void itemsgstnAjax(HashMap<String, String> params) throws Throwable {
		iSalesDao.itemsgstnAjax(params);
		
	}


	@Override
	public List<HashMap<String, String>> newsuggestListAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.newsuggestListAjax(params);
	}


	@Override
	public void itemngtnAjax(HashMap<String, String> params) throws Throwable {
		iSalesDao.itemngtnAjax(params);
		
	}


	@Override
	public List<HashMap<String, String>> newsuggestListAjax2(HashMap<String, String> params) throws Throwable {
		return iSalesDao.newsuggestListAjax2(params);
	}


	@Override
	public void itemorderAjax(HashMap<String, String> params) throws Throwable {
		iSalesDao.itemorderAjax(params);
		
	}


	@Override
	public List<HashMap<String, String>> newsuggestListAjax3(HashMap<String, String> params) throws Throwable {
		return iSalesDao.newsuggestListAjax3(params);
	}


	@Override
	public int getoorderlistCnt(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getoorderlistCnt(params);
	}


	@Override
	public int getongtnlistCnt(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getongtnlistCnt(params);
	}


	@Override
	public int getosgstnlistCnt(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getosgstnlistCnt(params);
	}


	@Override
	public String getItemSeq(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getItemSeq(params);
	}


	@Override
	public void itemngtnAjax2(HashMap<String, String> params) throws Throwable {
		iSalesDao.itemngtnAjax2(params);
		
	}


	@Override
	public void itemorderAjax2(HashMap<String, String> params) throws Throwable {
		iSalesDao.itemorderAjax2(params);
		
	}


	@Override
	public void itemsgstnAjax2(HashMap<String, String> params) throws Throwable {
		iSalesDao.itemsgstnAjax2(params);
		
	}


	@Override
	public HashMap<String, String> getSgstnItemlAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getSgstnItemlAjax(params);
	}


	@Override
	public int DeletesgstnItemAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.DeletesgstnItemAjax(params);
	}


	@Override
	public HashMap<String, String> getNgtnItemlAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getNgtnItemlAjax(params);
	}


	@Override
	public int DeletengtnItemAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.DeletengtnItemAjax(params);
	}


	@Override
	public HashMap<String, String> getOrderItemlAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.getOrderItemlAjax(params);
	}


	@Override
	public int DeleteorderItemAjax(HashMap<String, String> params) throws Throwable {
		return iSalesDao.DeleteorderItemAjax(params);
	}

	@Override
	public int getCstmrCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getCstmrCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCstmrList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getCstmrList(params);
	}

	@Override
	public void AddCstmr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iSalesDao.AddCstmr(params);
		
	}

	@Override
	public int getCmpnyCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getCmpnyCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getCmpnyList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getCmpnyList(params);
	}

	@Override
	public void CSTMRCMPNYAdd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iSalesDao.CSTMRCMPNYAdd(params);
		
	}

	@Override
	public List<HashMap<String, String>> getgradeList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getgradeList(params);
	}

	@Override
	public HashMap<String, String> getdetailCstmrCmpnyList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getdetailCstmrCmpnyList(params);
	}

	@Override
	public List<HashMap<String, String>> gettypeList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.gettypeList(params);
	}

	@Override
	public int CSTMRCMPNYupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.CSTMRCMPNYupdate(params);
		
	}

	/*
	 * @Override public List<HashMap<String, String>>
	 * getcstmrcmpnyList(HashMap<String, String> params) throws Throwable { // TODO
	 * Auto-generated method stub return iSalesDao.getcstmrcmpnyList(params); } //
	 * 뭐여이거
	 */
	
	@Override
	public int CstmrAddgetcstmrcmpnyCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.CstmrAddgetcstmrcmpnyCnt(params);
	}

	@Override
	public List<HashMap<String, String>> CstmrAddgetsearchcstmrcmpnyList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.CstmrAddgetsearchcstmrcmpnyList(params);
	}

	@Override
	public HashMap<String, String> getdetailCstmr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getdetailCstmr(params);
	}

	@Override
	public int DetailCSTMRupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.DetailCSTMRupdate(params);
	}

	@Override
	public int DetailCSTMRDel(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.DetailCSTMRDel(params);	
	}

	@Override
	public void AddCstmrMngr(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iSalesDao.AddCstmrMngr(params);
	}

	@Override
	public String getCstmrNoSeq(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getCstmrNoSeq(params);
	}

	@Override
	public int CstmrUpategetEmplyCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.CstmrUpategetEmplyCnt(params);
	}

	@Override
	public List<HashMap<String, String>> CstmrUpdategetsearchEmplyList(HashMap<String, String> params)
			throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.CstmrUpdategetsearchEmplyList(params);
	}

	@Override
	public int getoutEmplyupdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getoutEmplyupdate(params);
	}

	@Override
	public void getEmplyMngradd(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iSalesDao.getEmplyMngradd(params);
	}




	@Override
	public int bsnsSchdlMgmntCnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.bsnsSchdlMgmntCnt(params);
	}

	@Override
	public List<HashMap<String, String>> cclist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.cclist(params);
	}

	@Override
	public int bsnsSchdlMgmntCnt2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.bsnsSchdlMgmntCnt2(params);
	}
	
	@Override
	public List<HashMap<String, String>> clist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.clist(params);
	}

	@Override
	public void bsnsSchdlMgmntWrite(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iSalesDao.bsnsSchdlMgmntWrite(params);
	}

	@Override
	public int bsnsSchdlMgmntCnt3(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.bsnsSchdlMgmntCnt3(params);
	}

	@Override
	public List<HashMap<String, String>> redrawList(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.redrawList(params);
	}

	@Override
	public List<HashMap<String, String>> infolist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.infolist(params);
	}

	@Override
	public int bsnsStsredrawPagingcnt(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.bsnsStsredrawPagingcnt(params);
	}

	@Override
	public List<HashMap<String, String>> bsnsStslist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.bsnsStslist(params);
	}

	@Override
	public int bsnsSchdlMgmntWrite2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.bsnsSchdlMgmntWrite2(params);
	}

	@Override
	public String getbsnsschdlcstmrNO(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.getbsnsschdlcstmrNO(params);
	}

	@Override
	public List<HashMap<String, String>> cal_list2(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.cal_list2(params);
	}

	@Override
	public List<HashMap<String, String>> chart(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.chart(params);
	}

	@Override
	public List<HashMap<String, String>> callist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.callist(params);
	}

	@Override
	public int delSchdlUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.delSchdlUpdate(params);
	}

	@Override
	public void SchdlUpdate(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		iSalesDao.SchdlUpdate(params);
	}

	
	

	//@Override
/*	public List<HashMap<String, String>> bsnsSchdlselectnamelist(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iSalesDao.bsnsSchdlselectnamelist(params);
	}*/



	

	
}