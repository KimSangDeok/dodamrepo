package myproj.goods.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Request;
import org.apache.tiles.jsp.taglib.GetAsStringTag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.animal.dto.AnimalVO;
import myproj.customer.dto.CustomerVO;
import myproj.goods.dao.GoodsDAO;
import myproj.goods.dto.GoodsVO;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	GoodsDAO goodsDAO;
	
	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url){
		System.out.println("페이지 전환!!!");
		return "/goods/"+url;
	}
	
	//재고현황 리스트 보이기
	@RequestMapping("/goodsShow.dodam")
	public ModelAndView goodslist(GoodsVO goodsVO){
		System.out.println("재고현황탔다@@");
		List<GoodsVO> list = new ArrayList<GoodsVO>();
		list = goodsDAO.goodslist();
		ModelAndView mv = new ModelAndView();
		mv.addObject("goodslist",list);
		mv.setViewName("/goods/goodsShow");
		return mv;
	}

//	//입출고내역 리스트 보이기
//		@RequestMapping("/goodsSHistory.dodam")
//		public ModelAndView historylist(GoodsVO goodsVO){
//			System.out.println("입출고탔다@@");
//			List<GoodsVO> list = new ArrayList<GoodsVO>();
//			list = goodsDAO.historylist();
//			ModelAndView mv = new ModelAndView();
//			mv.addObject("historylist",list);
//			mv.setViewName("/goods/goodsShow");
//			return mv;
//		}
	
	//재고화면에서 검색해서 불러오는 부분
	@RequestMapping("/goodsSearch.dodam")
	@ResponseBody
	public List<GoodsVO> goodsSearch(String goodsSearch){
		List<GoodsVO> list = goodsDAO.goodsSearchList(goodsSearch);
		System.out.println(list.get(1).getGoods_name());
		return list;
	}
	
	//상품추가에서 품목명 검색하는 부분
	@RequestMapping("/goodsMediSearch.dodam")
	@ResponseBody
	public List<GoodsVO> goodsMediSearch(String medisearchtxt){
		List<GoodsVO> list = goodsDAO.goodsSearchmedi(medisearchtxt);
		return list;
	}
	
	//상품등록하는 부분 
	@RequestMapping("/goodsInsert.dodam")
	public String goodsInsert(GoodsVO goodsVO){
		int goods = goodsDAO.goodsInsert(goodsVO);
				
		
		
		return "redirect:goodsShow.dodam";
		
	}	
	
}
