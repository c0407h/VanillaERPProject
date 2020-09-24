package com.gd.vanilla.web.sales.controller;


import java.util.List;
import java.util.Map;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.mapper.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;

import com.gd.vanilla.common.service.IPagingService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gd.vanilla.common.bean.PagingBean;
import com.gd.vanilla.util.Utils;
import com.gd.vanilla.web.sales.service.ISalesService;
import com.mysql.fabric.xmlrpc.base.Params;
import com.mysql.jdbc.Util;


@Controller
public class SalesController{
	@Autowired
	public ISalesService iSalesService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/bsnsMngmnt")
	public ModelAndView bsnsMngmnt(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
	
		mav.setViewName("sales/bsnsMngmnt");
		return mav;

	}
	
	
	
	
	
	//수주품목ITEM상세보기후 삭제
	@RequestMapping(value = "/DeleteorderItemAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String DeleteorderItemAjax(@RequestParam HashMap<String, String> params
			, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
		
			
			int cnt = iSalesService.DeleteorderItemAjax(params);

			if (cnt > 0) {
				modelMap.put("result", "success");
			} else {
				modelMap.put("result", "fail");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	//협상품목ITEM상세보기 후 삭제
	@RequestMapping(value = "/DeletengtnItemAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String DeletengtnItemAjax(@RequestParam HashMap<String, String> params
			, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
		
			
			int cnt = iSalesService.DeletengtnItemAjax(params);

			if (cnt > 0) {
				modelMap.put("result", "success");
			} else {
				modelMap.put("result", "fail");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	//제안품목item상세보기 후 삭제
	@RequestMapping(value = "/DeletesgstnItemAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String DeletesgstnItemAjax(@RequestParam HashMap<String, String> params
			, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
		
			
			int cnt = iSalesService.DeletesgstnItemAjax(params);

			if (cnt > 0) {
				modelMap.put("result", "success");
			} else {
				modelMap.put("result", "fail");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	//수주품목하나get
	@RequestMapping(value = "/getOrderItemlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String getOrderItemlAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		 try {

			 HashMap<String,String> data = iSalesService.getOrderItemlAjax(params);
	            modelMap.put("data", data);
	            modelMap.put("result", "success");

	         } catch (Throwable e) {
	            
	            e.printStackTrace();
	            modelMap.put("result", "exception");
	            
	         }
	         System.out.println(mapper.writeValueAsString(modelMap));
	         
	         return mapper.writeValueAsString(modelMap);


	}
	//협상품목하나get
	@RequestMapping(value = "/getNgtnItemlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String getNgtnItemlAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		 try {

			 HashMap<String,String> data = iSalesService.getNgtnItemlAjax(params);
	            modelMap.put("data", data);
	            modelMap.put("result", "success");

	         } catch (Throwable e) {
	            
	            e.printStackTrace();
	            modelMap.put("result", "exception");
	            
	         }
	         System.out.println(mapper.writeValueAsString(modelMap));
	         
	         return mapper.writeValueAsString(modelMap);


	}
	
	
	
	
	//제안품목하나 get
	@RequestMapping(value = "/getSgstnItemlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String getSgstnItemlAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		 try {

			 HashMap<String,String> data = iSalesService.getSgstnItemlAjax(params);
	            modelMap.put("data", data);
	            modelMap.put("result", "success");

	         } catch (Throwable e) {
	            
	            e.printStackTrace();
	            modelMap.put("result", "exception");
	            
	         }
	         System.out.println(mapper.writeValueAsString(modelMap));
	         
	         return mapper.writeValueAsString(modelMap);


	}
	
	
	//영업일정수정
	@RequestMapping(value="/updateSchdl", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String updateSchdl(@RequestParam HashMap<String,String> params) throws Throwable { 
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				
				int cnt = iSalesService.updateSchdl(params); 
				
				
				if(cnt > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "일정수정실패");
				}
				
			} catch(Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			System.out.println(mapper.writeValueAsString(modelMap));
			return mapper.writeValueAsString(modelMap);
		}
	
	
	
	
	
	
	
	
	
	
	
	//영업일정등록
	@RequestMapping(value = "/schdlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String schdlAjax(@RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			
			params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
			
			String seq = iSalesService.getSchdlNoSeq(params);
			params.put("schdlNo", seq);
			//일정시퀀스
			
			iSalesService.schdlAjax(params);
			iSalesService.schdlAjax2(params);
			
			modelMap.put("result", "success");
				
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//영업의견등록
	@RequestMapping(value = "/obWriteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String obWriteAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			
			iSalesService.oBinsert(params);
			modelMap.put("result", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		System.out.println(mapper.writeValueAsString(modelMap));

		return mapper.writeValueAsString(modelMap);
	}
	
	//삭제일정
		@RequestMapping(value = "/DeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
		@ResponseBody
		public String DeleteAjax(@RequestParam HashMap<String, String> params
				, HttpSession session) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
				
				int cnt = iSalesService.DeleteAjax(params);

				if (cnt > 0) {
					modelMap.put("result", "success");
				} else {
					modelMap.put("result", "fail");
				}

			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			return mapper.writeValueAsString(modelMap);
		}
	
	
	
	
	
	
	
	//삭제의견
	@RequestMapping(value = "/obDeleteAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String obDeleteAjax(@RequestParam HashMap<String, String> params
			, HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
			// getobject no임으로 형변환 필요//안의 내용이 숫자인경우 문자로 인식을 하지않아서(String)
			// session안의 숫자는
			int cnt = iSalesService.obDeleteAjax(params);

			if (cnt > 0) {
				modelMap.put("result", "success");
			} else {
				modelMap.put("result", "fail");
			}

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	//영업의견수정을 위해 하나가져오기
	@RequestMapping(value = "/getoneAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String getoneAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		 try {

			 HashMap<String,String> data = iSalesService.getoneAjax(params);
	            modelMap.put("data", data);
	            modelMap.put("result", "success");

	         } catch (Throwable e) {
	            
	            e.printStackTrace();
	            modelMap.put("result", "exception");
	            
	         }
	         System.out.println(mapper.writeValueAsString(modelMap));
	         
	         return mapper.writeValueAsString(modelMap);


	}
	
	//일정하나 가져오기
	//영업의견수정을 위해 하나가져오기
	@RequestMapping(value = "/getSchdlAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String getSchdlAjax(@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		 try {

			 HashMap<String,String> data = iSalesService.getSchdlAjax(params);
	            modelMap.put("data", data);
	            modelMap.put("result", "success");

	         } catch (Throwable e) {
	            
	            e.printStackTrace();
	            modelMap.put("result", "exception");
	            
	         }
	         System.out.println(mapper.writeValueAsString(modelMap));
	         
	         return mapper.writeValueAsString(modelMap);


	}
	
	
	@RequestMapping(value = "/obupdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody 
	public String obupdateAjax(@RequestParam HashMap<String, String> params
					) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

				try {
						int cnt = iSalesService.obupdateAjax(params);
							if (cnt > 0) {
								modelMap.put("result", "success");
							} else {
								modelMap.put("result", "fail");
							}
				} catch (Throwable e) {
					e.printStackTrace();
					modelMap.put("result", "exception");
				}
				System.out.println(mapper.writeValueAsString(modelMap));
					return mapper.writeValueAsString(modelMap);
	}
	//의견리스트
	@RequestMapping(value = "/oBlistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String oBlistAjax(@RequestParam HashMap<String, String> params,
			
			ModelAndView modelAndView) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			//count도 제외??
			//page말고 scroll구현
			List<HashMap<String, String>> list = iSalesService.oBlist(params);
			modelMap.put("list", list);
			modelMap.put("result", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		System.out.println(mapper.writeValueAsString(modelMap));
		

		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	//item조회
	@RequestMapping(value = "/itemlistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String itemlistAjax(@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			
			if (params.get("page") == null) {
				params.put("page", "1");

			}
			int cnt = iSalesService.itemlistCnt(params);
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iSalesService.itemlistAjax(params);
		
			 
			modelMap.put("list", list);
			
			
			
			modelMap.put("pb", pb);
			modelMap.put("result", "success");
			/* 추가 */
			modelMap.put("page", params.get("page"));

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		System.out.println(mapper.writeValueAsString(modelMap));
		return mapper.writeValueAsString(modelMap);
	}
	
	//item조회 end
	//영업list목록reroladList(){}
		@RequestMapping(value = "/listAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") // 글자는json{키
		@ResponseBody
		public String listAjax(@RequestParam HashMap<String, String> params,
				ModelAndView modelAndView) throws Throwable {
		
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
		
			try {
				int cnt = iSalesService.getListCnt(params);
				PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")),cnt,10,5);
			
				params.put("startCnt", Integer.toString(pb.getStartCount()));
				params.put("endCnt", Integer.toString(pb.getEndCount()));
				
				List<HashMap<String, String>> list = iSalesService.getList(params);
		
				modelMap.put("list", list);
				modelMap.put("pb", pb);
				modelMap.put("result", "success");

			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			System.out.println(mapper.writeValueAsString(modelMap));
			return mapper.writeValueAsString(modelMap);
		}//listAjax end
		
		
		//new 일정 list
			
			@RequestMapping(value = "/newschdlReloadAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
			@ResponseBody
			public String newschdlReloadAjax(@RequestParam HashMap<String, String> params, 
					ModelAndView modelAndView) throws Throwable {
					
				ObjectMapper mapper = new ObjectMapper();
				Map<String, Object> modelMap = new HashMap<String, Object>();

				try {
					List<HashMap<String,String>> list = iSalesService.getnewSchdlList(params);
					modelMap.put("list", list);
					modelMap.put("result", "success");
						
				} catch (Throwable e) {
					e.printStackTrace();
					modelMap.put("result", "exception");
				}
				System.out.println(mapper.writeValueAsString(modelMap));
				return mapper.writeValueAsString(modelMap);
			}
				
		
		
		
		
		
	/* 고객, 고객사 검색 */
	@RequestMapping(value = "/cstmrlistajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody 
	public String cstmrlistAjax(@RequestParam HashMap<String, String> params,
			ModelAndView modelAndView) throws Throwable {
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {
			
			if (params.get("page") == null) {
				params.put("page", "1");

			}
			int cnt = iSalesService.getocstmrlistCnt(params);
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> list = iSalesService.cstmrlistajax(params);
			
			
			 
			modelMap.put("list", list);
			modelMap.put("pb", pb);
			modelMap.put("result", "success");
			/* 추가 */
			modelMap.put("page", params.get("page"));

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		System.out.println(mapper.writeValueAsString(modelMap));
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	
	
	
	
	
	
	//등록기회작성ajax
	@RequestMapping(value = "/bsnswhole_ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String bsnswhole_Ajax(@RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
			
			String seq = iSalesService.getBsnSeq(params);
			params.put("bsnsNo", seq);
			
			iSalesService.bsnswhole_ajax(params);
			iSalesService.bsnswhole2(params);
			iSalesService.bsnswhole3(params);
			modelMap.put("result", "success");
				
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//제안등록작성
	@RequestMapping(value = "/writeSugajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String writeSugAjax(@RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
			iSalesService.writeSugajax1(params);
			iSalesService.writeSugajax2(params);
			
			modelMap.put("result", "success");
				
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	//협상등록
	@RequestMapping(value = "/ngtn_Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String ngtn_Ajax(@RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
			iSalesService.ngtn_Ajax(params);
			iSalesService.ngtn_Ajax2(params);
			
			modelMap.put("result", "success");
				
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	//협상등록end
	
	//수주등록order_Ajax
	@RequestMapping(value = "/order_Ajax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
	@ResponseBody
	public String order_Ajax(@RequestParam HashMap<String, String> params,
			HttpSession session) throws Throwable {
			
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {
			params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
			iSalesService.order_Ajax(params);
			iSalesService.order_Ajax2(params);
			
			modelMap.put("result", "success");
				
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}
	
	//수주등록end
	
	//수주수정orderAjax
	@RequestMapping(value="/orderAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String orderAjax(@RequestParam HashMap<String,String> params) throws Throwable { 
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				
				int cnt = iSalesService.orderAjax(params); 
				int cnt2 = iSalesService.orderAjax2(params); 
				
				if(cnt > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance");
				}
				if(cnt2 > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance2");
				}
			} catch(Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			System.out.println(mapper.writeValueAsString(modelMap));
			return mapper.writeValueAsString(modelMap);
		}
	//수주수정end
	
	//ngtnupdate_Ajax협상수정
	@RequestMapping(value="/ngtnupdate_Ajax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String ngtnupdate_Ajax(@RequestParam HashMap<String,String> params) throws Throwable { 
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				
				int cnt = iSalesService.updatengtn(params); 
				int cnt2 = iSalesService.updatengtn2(params); 
				
				if(cnt > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance");
				}
				if(cnt2 > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance2");
				}
			} catch(Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			System.out.println(mapper.writeValueAsString(modelMap));
			return mapper.writeValueAsString(modelMap);
		}//수정
	//협상수정end
	
	
	//suggestAjax제안수정
	@RequestMapping(value="/suggestAjax", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")
			@ResponseBody
			public String suggestAjax(@RequestParam HashMap<String,String> params) throws Throwable { 
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				
				int cnt = iSalesService.updateSug(params); 
				int cnt2 = iSalesService.updateSug2(params); 
				
				if(cnt > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance");
				}
				if(cnt2 > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance2");
				}
			} catch(Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			System.out.println(mapper.writeValueAsString(modelMap));
			return mapper.writeValueAsString(modelMap);
		}//수정
	
	
	//기회수정
	@RequestMapping(value="/updatechance", method = RequestMethod.POST, 
			produces = "text/json;charset=UTF-8")


			@ResponseBody
			public String updatechance(@RequestParam HashMap<String,String> params) throws Throwable { //params 받아오기 
				
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			try {
				int cnt = iSalesService.updatechance(params); 
				int cnt2 = iSalesService.updatechance2(params); 
				if(cnt > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance");
				}
				if(cnt2 > 0) {
					modelMap.put("result", "성공"); 
				} else {
					modelMap.put("result", "failupdatechance2");
				}
			} catch(Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			System.out.println(mapper.writeValueAsString(modelMap));
			return mapper.writeValueAsString(modelMap);
			
		}//수정
	//영업상세보기
		@RequestMapping(value="/detail")
		public ModelAndView detail(
				@RequestParam HashMap<String,String> params, ModelAndView mav) throws Throwable {
			
			HashMap<String,String> data = iSalesService.getSales(params);
			//기회상세보기
			HashMap<String,String> data2 = iSalesService.getSales2(params); 
			HashMap<String,String> data3 = iSalesService.getSales3(params); 
			HashMap<String,String> data4 = iSalesService.getSales4(params); 
			
			
			
			
			
			
		/* HashMap<String,String> sc = iSalesService.schdldata(params); */
			mav.addObject("data", data);
			mav.addObject("data2", data2);
			mav.addObject("data3", data3);
			mav.addObject("data4", data4);
		/* mav.addObject("sc", sc); */
			mav.setViewName("sales/detail");
			
			return mav;
		}
		//영업상세보기2
		//제안DETAIL
		
		
	
		
		@RequestMapping(value = "/newsuggestListAjax", method = RequestMethod.POST, 
				produces = "text/json;charset=UTF-8") 
		@ResponseBody
		public String newsuggestListAjax(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				
				
				if (params.get("page") == null) {
					params.put("page", "1");

				}
				int cnt = iSalesService.getosgstnlistCnt(params);
				PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
				params.put("startCnt", Integer.toString(pb.getStartCount()));
				params.put("endCnt", Integer.toString(pb.getEndCount()));
				List<HashMap<String,String>> list = iSalesService.newsuggestListAjax(params);
				modelMap.put("list", list);
				modelMap.put("pb", pb);
				modelMap.put("result", "success");
				
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			return mapper.writeValueAsString(modelMap);
		}
			
		//item등록
		@RequestMapping(value = "/itemorderAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
		@ResponseBody
		public String itemorderAjax(@RequestParam HashMap<String, String> params,
				HttpSession session) throws Throwable {
				
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				 
					iSalesService.itemorderAjax(params);
					iSalesService.itemorderAjax2(params);
				modelMap.put("result", "success");
					
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			return mapper.writeValueAsString(modelMap);
		}
		
		
		
		
		
		@RequestMapping(value = "/itemsgstnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
		@ResponseBody
		public String itemsgstnAjax(@RequestParam HashMap<String, String> params,
				HttpSession session) throws Throwable {
				
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				 
					iSalesService.itemsgstnAjax(params);
					iSalesService.itemsgstnAjax2(params);
				modelMap.put("result", "success");
					
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			return mapper.writeValueAsString(modelMap);
		}
		
		
		@RequestMapping(value = "/newsuggestListAjax2", method = RequestMethod.POST, 
				produces = "text/json;charset=UTF-8") 
		@ResponseBody
		public String newsuggestListAjax2(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				
				
				if (params.get("page") == null) {
					params.put("page", "1");

				}
				int cnt = iSalesService.getongtnlistCnt(params);
				PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
				params.put("startCnt", Integer.toString(pb.getStartCount()));
				params.put("endCnt", Integer.toString(pb.getEndCount()));
				List<HashMap<String,String>> list = iSalesService.newsuggestListAjax2(params);
				modelMap.put("list", list);
				modelMap.put("pb", pb);
				modelMap.put("result", "success");
				
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/itemngtnAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8") 
		@ResponseBody
		public String itemngtnAjax(@RequestParam HashMap<String, String> params,
				HttpSession session) throws Throwable {
			
				
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();

			try {
				 
				
				String seq = iSalesService.getItemSeq(params);
				params.put("itemNo", seq);
					iSalesService.itemngtnAjax(params);
					iSalesService.itemngtnAjax2(params);

				modelMap.put("result", "success");
					
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			return mapper.writeValueAsString(modelMap);
		}
		
		@RequestMapping(value = "/newsuggestListAjax3", method = RequestMethod.POST, 
				produces = "text/json;charset=UTF-8") 
		@ResponseBody
		public String newsuggestListAjax3(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			try {
				
				
				if (params.get("page") == null) {
					params.put("page", "1");

				}
				int cnt = iSalesService.getoorderlistCnt(params);
				PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
			
				params.put("startCnt", Integer.toString(pb.getStartCount()));
				params.put("endCnt", Integer.toString(pb.getEndCount()));
				List<HashMap<String,String>> list = iSalesService.newsuggestListAjax3(params);
				modelMap.put("list", list);
				modelMap.put("pb", pb);
				modelMap.put("result", "success");
				
			} catch (Throwable e) {
				e.printStackTrace();
				modelMap.put("result", "exception");
			}
			return mapper.writeValueAsString(modelMap);
		}
		
		



	@RequestMapping(value = "/bsnsSchdlMgmnt")
	public ModelAndView bsnsSchdlMgmnt(HttpSession session, ModelAndView mav) {

		mav.setViewName("sales/bsnsSchdlMgmnt");
		return mav;
	}// 영업 스케쥴 연결
	@RequestMapping(value = "/cstmrMngmnt")
	public ModelAndView cstmrMngmnt(HttpSession session, ModelAndView mav) {
		
		mav.setViewName("salescstmr/cstmrMngmnt");
		return mav;
	}// 영업 고객 연결
	@RequestMapping(value = "/cstmrCmpnyMngmnt")
	public ModelAndView cstmrCmpnyMngmnt(HttpSession session, ModelAndView mav) {
		
		mav.setViewName("salescstmr/cstmrCmpnyMngmnt");
		return mav;
	}// 영업 고객사 연결

	@RequestMapping(value = "/cclistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String cclistAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 오브젝트를 때려박겠다.

		try {
			int cnt = iSalesService.bsnsSchdlMgmntCnt(params);
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> cclist = iSalesService.cclist(params);

			// 리스트를 돌려받기 위함
			modelMap.put("cclist", cclist);
			modelMap.put("pb", pb); // 페이지를 그리기 위함
			modelMap.put("result", "success");

		} catch (Throwable e) {
			e.printStackTrace(); // 콘솔에 찍어 문제발생확인
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);

	}// 고객사 리스트 / 카운트

	@RequestMapping(value = "/clistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String clistAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		System.out.println(params);

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 오브젝트를 때려박겠다.

		try {
			int cnt = iSalesService.bsnsSchdlMgmntCnt2(params);
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page1")), cnt, 5, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> clist = iSalesService.clist(params);

			// 리스트를 돌려받기 위함
			modelMap.put("clist", clist);
			modelMap.put("pb", pb); // 페이지를 그리기 위함
			modelMap.put("result", "success");

		} catch (Throwable e) {
			e.printStackTrace(); // 콘솔에 찍어 문제발생확인
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);

	}// 고객 리스트 /카운트

	@RequestMapping(value = "/bsnsSchdlMgmntWriteAjax", method = RequestMethod.POST, // post일때만 동작을 하겠다.
			produces = "text/json;charset=UTF-8") // produces -> 결과의 형태 지정 글자는 json으로 이루어지로 UTF-8로 처리될것이다.

	@ResponseBody
	public String bsnsSchdlMgmntWriteAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 오브젝트를 때려박겠다.

		try {
			String seq = iSalesService.getbsnsschdlcstmrNO(params);
			params.put("SCHDL_NO", seq);

			// List<HashMap<String, String>> bsnsSchdlselectnamelist =
			// iSalesService.bsnsSchdlselectnamelist(params);
			System.out.println("------------------------------------------");
			System.out.println(seq);
			iSalesService.bsnsSchdlMgmntWrite(params); // 영업일정 (schdl 테이블)
			iSalesService.bsnsSchdlMgmntWrite2(params); // 영업일정2(고객사, 고객)
			modelMap.put("result", "success");
		} catch (Throwable e) {
			e.printStackTrace(); // 콘솔에 찍어 문제발생확인
			modelMap.put("result", "exception");
		}
		System.out.println(mapper.writeValueAsString(modelMap));
		// writeValueAsString : 값을 문자열로 변환(JSON 형태)

		return mapper.writeValueAsString(modelMap);

	}// 일정 등록

	@RequestMapping(value = "/reloadcallistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String reloadcallistAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		try {

			List<HashMap<String, String>> list = iSalesService.callist(params);
			list = Utils.toLowerListMapKeyCamel(list);
			modelMap.put("list", list);
			modelMap.put("result", "success");

		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/infolistAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String infolistAjax(@RequestParam HashMap<String, String> params) throws Throwable {

		System.out.println(params);

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 오브젝트를 때려박겠다.

		try {

			List<HashMap<String, String>> infolist = iSalesService.infolist(params);

			modelMap.put("infolist", infolist);
			modelMap.put("result", "success");

		} catch (Throwable e) {
			e.printStackTrace(); // 콘솔에 찍어 문제발생확인
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);

	}// 영업일정 // 리스트

	/*
	 * @RequestMapping(value = "/cal_listAjax", method = RequestMethod.POST,
	 * produces = "text/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String cal_listAjax(@RequestParam HashMap<String,
	 * String> params, ModelAndView modelAndView) throws Throwable {
	 * 
	 * 
	 * 
	 * ObjectMapper mapper = new ObjectMapper(); Map<String, Object> modelMap = new
	 * HashMap<String, Object>(); // 오브젝트를 때려박겠다.
	 * 
	 * try {
	 * 
	 * int cnt = iSalesService.bsnsSchdlMgmntCnt3(params); PagingBean pb =
	 * iPagingService.getPageingBean(Integer.parseInt(params.get("page3")), cnt, 10,
	 * 5);
	 * 
	 * params.put("startCnt", Integer.toString(pb.getStartCount()));
	 * params.put("endCnt", Integer.toString(pb.getEndCount()));
	 * 
	 * List<HashMap<String, String>> redrawList = iSalesService.redrawList(params);
	 * 
	 * 
	 * // 리스트를 돌려받기 위함 modelMap.put("redrawList", redrawList); modelMap.put("pb",
	 * pb); // 페이지를 그리기 위함 modelMap.put("result", "success");
	 * 
	 * 
	 * 
	 * } catch (Throwable e) { e.printStackTrace(); // 콘솔에 찍어 문제발생확인
	 * modelMap.put("result", "exception"); } return
	 * mapper.writeValueAsString(modelMap);
	 * 
	 * } //영업일정 리스트
	 * 
	 * 
	 * 
	 * @RequestMapping(value = "/cal_list2Ajax", method = RequestMethod.POST,
	 * produces = "text/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String cal_list2Ajax(@RequestParam HashMap<String,
	 * String> params, ModelAndView modelAndView) throws Throwable {
	 * 
	 * ObjectMapper mapper = new ObjectMapper(); Map<String, Object> modelMap = new
	 * HashMap<String, Object>(); // 오브젝트를 때려박겠다.
	 * 
	 * try {
	 * 
	 * List<HashMap<String, String>> list = iSalesService.cal_list2(params); list =
	 * Utils.toLowerListMapKey(list); modelMap.put("list", list);
	 * modelMap.put("result", "success");
	 * 
	 * 
	 * } catch (Throwable e) { e.printStackTrace(); // 콘솔에 찍어 문제발생확인
	 * modelMap.put("result", "exception"); } return
	 * mapper.writeValueAsString(modelMap);
	 * 
	 * }// 영업일정 // 달력이벤트 바
	 */

	// ------------------------------------------------------------------------------//

	// 영업현황 연결
	@RequestMapping(value = "/bsnsSts")
	public ModelAndView bsnsSts(@RequestParam HashMap<String, String> params, ModelAndView mav, Object bsnsStslist)
			throws Throwable {

		mav.setViewName("sales/bsnsSts");

		return mav;
	}

	@RequestMapping(value = "/bsnsStsAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String bsnsStsAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView)
			throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 오브젝트를 때려박겠다.

		try {
			int cnt = iSalesService.bsnsStsredrawPagingcnt(params);
			PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("paging")), cnt, 10, 5);

			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));

			List<HashMap<String, String>> bsnsStslist = iSalesService.bsnsStslist(params);

			// 리스트를 돌려받기 위함
			modelMap.put("bsnsStslist", bsnsStslist);
			modelMap.put("pb", pb); // 페이지를 그리기 위함
			modelMap.put("result", "success");

		} catch (Throwable e) {
			e.printStackTrace(); // 콘솔에 찍어 문제발생확인
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);

	}// 영업현황 아작스

	@RequestMapping(value = "/chartAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String chartAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 오브젝트를 때려박겠다.

		try {

			List<HashMap<String, String>> chart = iSalesService.chart(params);

			// 리스트를 돌려받기 위함
			modelMap.put("chart", chart);
			modelMap.put("result", "success");

		} catch (Throwable e) {
			e.printStackTrace(); // 콘솔에 찍어 문제발생확인
			modelMap.put("result", "exception");
		}
		return mapper.writeValueAsString(modelMap);

	}// 영업현황 아작스

	// 일정삭제
	@RequestMapping(value = "/delSchdlUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String delSchdlUpdateAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView,
			HttpSession session) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
		System.out.println(params);

		try {
			iSalesService.delSchdlUpdate(params);
			modelMap.put("result", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		System.out.println(mapper.writeValueAsString(modelMap));
		return mapper.writeValueAsString(modelMap);

	}

	// 일정 수정
	@RequestMapping(value = "/SchdlUpdateAjax", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")

	@ResponseBody
	public String SchdlUpdateAjax(@RequestParam HashMap<String, String> params, ModelAndView modelAndView,
			HttpSession session) throws Throwable {

		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		params.put("emplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
		System.out.println(params);

		try {
			iSalesService.SchdlUpdate(params);
			modelMap.put("result", "success");
		} catch (Throwable e) {
			e.printStackTrace();
			modelMap.put("result", "exception");
		}
		System.out.println(mapper.writeValueAsString(modelMap));
		return mapper.writeValueAsString(modelMap);

	}

	@RequestMapping(value="/CSTMRListAjax", method = RequestMethod.POST, 
		      produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String CSTMRListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   try {
		      int cnt = iSalesService.getCstmrCnt(params);   //최대개수부터 가져옴
		      
		      PagingBean pb 
		         = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		      //PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, viewCnt, pageCnt);         
		      //viewcnt 한번에 몇줄을 보여줄 것인가?  pageCnt 한번에 몇페이지까지 보여줄것인가?
		      params.put("startCnt", Integer.toString(pb.getStartCount()));
		      params.put("endCnt", Integer.toString(pb.getEndCount()));
		      
		      //결과 받아오기
		      List<HashMap<String,String>> list = iSalesService.getCstmrList(params);
		      
		      modelMap.put("list",list);
		      modelMap.put("pb",pb);
		      modelMap.put("result", "success");
		      
		   }catch(Throwable e){
		      e.printStackTrace();
		      modelMap.put("result", "exception");
		   }
		   return mapper.writeValueAsString(modelMap);

		}

		@RequestMapping(value="/cstmrAddAjax", method = RequestMethod.POST, 
		         produces = "text/json;charset=UTF-8")
		         
		         //@ResponseBody : 이게 뷰다라고 말하는거랑 같음. view로 인식 뷰리졸브 동작안함
		         //돌려주는 결과가 View의 내용으로 인식됨.(text를 json형태(문자열형태)로 돌려주기때문에 String을 줌)
		         @ResponseBody
		         public String cstmrAddAjax(@RequestParam HashMap<String, String> params,
		         ModelAndView modelAndView) throws Throwable{
		         // ObjectMapper : jackson에서 제공. 객체정보를 문자열로 변환.(json형태) 자동으로 변환해줌
		         // (보통 값을 맵이나 리스트로 담는데 담긴 값을 문자열로 변환 하겠다)
		         
		         ObjectMapper mapper = new ObjectMapper();
		         Map<String, Object> modelMap = new HashMap<String, Object>();
		         
		         try {
		            
		         String seq = iSalesService.getCstmrNoSeq(params);
		         params.put("CstmrNoSeq", seq);
		            
		            
		         iSalesService.AddCstmr(params);
		         iSalesService.AddCstmrMngr(params);
		         //인서트가 성공하면 
		         modelMap.put("result", "success");
		         }catch(Throwable e){
		         e.printStackTrace();
		         //인서트가 실패하면
		         modelMap.put("result", "exception");
		         }
		         System.out.println(mapper.writeValueAsString(modelMap));
		         //writeValueAsString : 값을 문자열로 변환(json형태)
		         return mapper.writeValueAsString(modelMap);

		}

		@RequestMapping(value="/CSTMRCMPNYListAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String CSTMRCMPNYListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> modelMap = new HashMap<String, Object>();
		      
		      try {
		         int cnt = iSalesService.getCmpnyCnt(params);   //최대개수부터 가져옴
		         
		         PagingBean pb 
		            = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 10, 5);
		         //PagingBean pb = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, viewCnt, pageCnt);         
		         //viewcnt 한번에 몇줄을 보여줄 것인가?  pageCnt 한번에 몇페이지까지 보여줄것인가?
		         params.put("startCnt", Integer.toString(pb.getStartCount()));
		         params.put("endCnt", Integer.toString(pb.getEndCount()));
		         
		         //결과 받아오기
		         List<HashMap<String,String>> CMlist = iSalesService.getCmpnyList(params);
		         
		         modelMap.put("CMlist",CMlist);
		         modelMap.put("pb",pb);
		         modelMap.put("result", "success");
		         
		      }catch(Throwable e){
		         e.printStackTrace();
		         modelMap.put("result", "exception");
		         }
		      return mapper.writeValueAsString(modelMap);
		         
		         }


		//고객사등록
		@RequestMapping(value="/CSTMRCMPNYAddAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		//@ResponseBody : 이게 뷰다라고 말하는거랑 같음. view로 인식 뷰리졸브 동작안함
		//돌려주는 결과가 View의 내용으로 인식됨.(text를 json형태(문자열형태)로 돌려주기때문에 String을 줌)
		@ResponseBody
		public String CSTMRCMPNYAddAjax(@RequestParam HashMap<String, String> params,
		   ModelAndView modelAndView) throws Throwable{
		   // ObjectMapper : jackson에서 제공. 객체정보를 문자열로 변환.(json형태) 자동으로 변환해줌
		   // (보통 값을 맵이나 리스트로 담는데 담긴 값을 문자열로 변환 하겠다)
		   
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   try {
		   iSalesService.CSTMRCMPNYAdd(params);
		   //인서트가 성공하면 
		   modelMap.put("result", "success");
		   }catch(Throwable e){
		   e.printStackTrace();
		   //인서트가 실패하면
		   modelMap.put("result", "exception");
		   }
		   System.out.println(mapper.writeValueAsString(modelMap));
		   //writeValueAsString : 값을 문자열로 변환(json형태)
		   return mapper.writeValueAsString(modelMap);
		   
		   }

		//등급조회
		@RequestMapping(value="/CstmrCmpnyGradeAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String CstmrCmpnyGradeAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   try {
		   
		   //결과 받아오기
		   List<HashMap<String,String>> gradelist = iSalesService.getgradeList(params);
		   
		   modelMap.put("gradelist",gradelist);
		   modelMap.put("params",params);
		   modelMap.put("result", "success");
		   
		   }catch(Throwable e){
		   e.printStackTrace();
		   modelMap.put("result", "exception");
		   }
		   return mapper.writeValueAsString(modelMap);

		}
		//유형조회
		@RequestMapping(value="/CstmrCmpnyTypeAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String CstmrCmpnyTypeAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   try {
		      
		      //결과 받아오기
		      List<HashMap<String,String>> typelist = iSalesService.gettypeList(params);
		      
		      modelMap.put("typelist",typelist);
		      modelMap.put("params",params);
		      modelMap.put("result", "success");
		      
		   }catch(Throwable e){
		      e.printStackTrace();
		      modelMap.put("result", "exception");
		   }
		   return mapper.writeValueAsString(modelMap);
		   
		}

		//고객사 상세
		@RequestMapping(value="/detailcstmrCmpny")
		public ModelAndView detailcstmrCmpny (@RequestParam HashMap<String,String> params,
		            ModelAndView mav) throws Throwable{
		   
		   HashMap<String, String> data = iSalesService.getdetailCstmrCmpnyList(params);
		   
		   mav.addObject("data", data);
		   mav.setViewName("salescstmr/detailcstmrCmpny");
		   
		   
		   return mav;
		   
		   
		}
		//고객사 수정 
		@RequestMapping(value="/CSTMRCMPNYUpdateAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String CSTMRCMPNYUpdateAjax(@RequestParam HashMap<String, String> params,
		   ModelAndView modelAndView, HttpSession session) throws Throwable{
		   
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   params.put("emplyNo",String.valueOf(session.getAttribute("sEmplyNo")));
		   System.out.println(params);
		   
		   
		   try {
		   iSalesService.CSTMRCMPNYupdate(params);
		   modelMap.put("result", "success");
		   }catch(Throwable e){
		   e.printStackTrace();
		   modelMap.put("result", "exception");
		   }
		   System.out.println(mapper.writeValueAsString(modelMap));
		   return mapper.writeValueAsString(modelMap);
		   
		   }
		   /*
		    * //고객등록 고객사 조회--->>????? 필요없는아약스
		    * 
		    * @RequestMapping(value="/checkcstmrcmpnyAjax", method = RequestMethod.POST,
		    * produces = "text/json;charset=UTF-8")
		    * 
		    * @ResponseBody public String checkcstmrcmpnyAjax(@RequestParam HashMap<String,
		    * String> params) throws Throwable{ ObjectMapper mapper = new ObjectMapper();
		    * Map<String, Object> modelMap = new HashMap<String, Object>();
		    * 
		    * try {
		    * 
		    * //결과 받아오기 List<HashMap<String,String>> getcstmrcmpnylist =
		    * iSalesService.getcstmrcmpnyList(params);
		    * 
		    * modelMap.put("getcstmrcmpnylist",getcstmrcmpnylist);
		    * modelMap.put("params",params); modelMap.put("result", "success");
		    * 
		    * }catch(Throwable e){ e.printStackTrace(); modelMap.put("result",
		    * "exception"); } return mapper.writeValueAsString(modelMap);
		    * 
		    * }
		    */


		@RequestMapping(value="/searchCSTMRcmpnyListAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String searchCSTMRcmpnyListAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();

		   try {
		      int cnt = iSalesService.CstmrAddgetcstmrcmpnyCnt(params);   //최대개수부터 가져옴
		      
		      PagingBean pb 
		         = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		      params.put("startCnt", Integer.toString(pb.getStartCount()));
		      params.put("endCnt", Integer.toString(pb.getEndCount()));
		      
		      //결과 받아오기
		      List<HashMap<String,String>> cmpnylist = iSalesService.CstmrAddgetsearchcstmrcmpnyList(params);
		      
		      modelMap.put("cmpnylist",cmpnylist);
		      modelMap.put("pb",pb);
		      modelMap.put("result", "success");
		      
		   }catch(Throwable e){
		      e.printStackTrace();
		      modelMap.put("result", "exception");
		   }
		   return mapper.writeValueAsString(modelMap);

		}



		//고객 상세페이지 이동
		@RequestMapping(value="/detailCstmr")
		public ModelAndView detailCstmr (@RequestParam HashMap<String,String> params,
		            ModelAndView mav) throws Throwable{
		   
		   HashMap<String, String> data = iSalesService.getdetailCstmr(params);
		   
		   mav.addObject("data", data);
		   mav.setViewName("salescstmr/detailCstmr");
		   
		   
		   return mav;
		   
		   
		}
		//고객 수정  저장
		@RequestMapping(value="/DetailCSTMRUpdateAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String DetailCSTMRUpdateAjax(@RequestParam HashMap<String, String> params,
		   ModelAndView modelAndView, HttpSession session) throws Throwable{
		   
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   params.put("emplyNo",String.valueOf(session.getAttribute("sEmplyNo")));
		   System.out.println(params);
		   
		   
		   try {
		   iSalesService.getoutEmplyupdate(params);
		   iSalesService.getEmplyMngradd(params);
		   iSalesService.DetailCSTMRupdate(params);
		   modelMap.put("result", "success");
		   }catch(Throwable e){
		   e.printStackTrace();
		   modelMap.put("result", "exception");
		   }
		   System.out.println(mapper.writeValueAsString(modelMap));
		   return mapper.writeValueAsString(modelMap);
		   
		   }
		//고객등급조회
		@RequestMapping(value="/CheckCsmrGradeAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String CheckCsmrGradeAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   try {
		   
		   //결과 받아오기
		   List<HashMap<String,String>> gradelist = iSalesService.getgradeList(params);
		   
		   modelMap.put("gradelist",gradelist);
		   modelMap.put("params",params);
		   modelMap.put("result", "success");
		   
		   }catch(Throwable e){
		   e.printStackTrace();
		   modelMap.put("result", "exception");
		   }
		   return mapper.writeValueAsString(modelMap);

		}
		//고객삭제
		@RequestMapping(value="/CSTMRDelAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String CSTMRDelAjax(@RequestParam HashMap<String, String> params, HttpSession session) throws Throwable{
		   
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();
		   
		   try {
		      params.put("EmplyNo", String.valueOf(session.getAttribute("sEmplyNo")));
		      
		      int cnt = iSalesService.DetailCSTMRDel(params);
		      
		      if(cnt>0) {
		         modelMap.put("result", "seccess");
		      }else {
		         modelMap.put("result", "fail");
		      }
		      
		      
		   }catch(Throwable e){
		      e.printStackTrace();
		      modelMap.put("result", "exception");
		   }
		   return mapper.writeValueAsString(modelMap);
		   
		}
		//고객 수정 담당자 변경 Ajax
		@RequestMapping(value="/searchEmplyMngmntAjax", method = RequestMethod.POST, 
		produces = "text/json;charset=UTF-8")

		@ResponseBody
		public String searchEmplyMngmntAjax(@RequestParam HashMap<String, String> params) throws Throwable{
		   ObjectMapper mapper = new ObjectMapper();
		   Map<String, Object> modelMap = new HashMap<String, Object>();

		   try {
		      int cnt = iSalesService.CstmrUpategetEmplyCnt(params);   //최대개수부터 가져옴
		      
		      PagingBean pb 
		         = iPagingService.getPageingBean(Integer.parseInt(params.get("page")), cnt, 5, 5);
		      params.put("startCnt", Integer.toString(pb.getStartCount()));
		      params.put("endCnt", Integer.toString(pb.getEndCount()));
		      
		      //결과 받아오기
		      List<HashMap<String,String>> Emplylist = iSalesService.CstmrUpdategetsearchEmplyList(params);
		      
		      modelMap.put("Emplylist",Emplylist);
		      modelMap.put("pb",pb);
		      modelMap.put("result", "success");
		      
		   }catch(Throwable e){
		      e.printStackTrace();
		      modelMap.put("result", "exception");
		   }
		   return mapper.writeValueAsString(modelMap);

		}



	
}
	
	
	
	
