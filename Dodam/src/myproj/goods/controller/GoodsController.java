package myproj.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.goods.dao.GoodsDAO;
import myproj.goods.dto.GoodsVO;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	GoodsDAO goodsDAO;

	@RequestMapping("/{url}.dodam")
	public String showList(@PathVariable String url) {
		System.out.println("페이지 전환!!!");
		return "/goods/" + url;
	}

	/////////////////////////////////// goodsShow.jsp부분
	// 재고현황 리스트 보이기
	@RequestMapping("/goodsShow.dodam")
	public ModelAndView goodslist(GoodsVO goodsVO) {
		System.out.println("재고현황탔다@@");
		List<GoodsVO> list = goodsDAO.goodslist();
		System.out.println(list);
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);
		mv.setViewName("/goods/goodsShow");
		return mv;
	}

	// 재고화면에서 검색해서 불러오는 부분
	@RequestMapping("/goodsSearch.dodam")
	@ResponseBody
	public List<GoodsVO> goodsSearch(String goodsSearch) {

		List<GoodsVO> list = goodsDAO.goodsSearchList(goodsSearch);
		System.out.println(list.get(0).getGoods_use());
		return list;
	}

	// 상품추가에서 품목명 검색하는 부분
	@RequestMapping("/goodsMediSearch.dodam")
	@ResponseBody
	public List<GoodsVO> goodsMediSearch(GoodsVO goodsVO) {
		List<GoodsVO> list = goodsDAO.goodsSearchmedi(goodsVO);
		return list;
	}

	// 상품등록하는 부분
	@RequestMapping("/goodsInsert.dodam")
	public String goodsInsert(GoodsVO goodsVO) {
		goodsDAO.goodsInsert(goodsVO);
		return "redirect:goodsShow.dodam";
	}

	///////////////////////// goodsShowHistory.jsp부분
	// 처음에 입고내역 리스트 보이기
	// @RequestMapping("/goodsHistory.dodam")
	// public ModelAndView historylist(GoodsVO goodsVO){
	// System.out.println("입출고탔다@@");
	// List<GoodsVO> list = goodsDAO.historylist();
	// ModelAndView mv = new ModelAndView();
	// mv.addObject("historylist",list);
	// mv.setViewName("/goods/goodsHistory");
	// System.out.println("보내졌니?");
	// return mv;
	// }

	// datepicker 값이 변경 되었을 때, 자동으로 검색해서 테이블에 뿌려
	@RequestMapping("/changeDate.dodam")
	@ResponseBody
	public List<Map<String, Object>> changeDateList(String from_to_date) { // 검색할
																			// 날짜
																			// 값을
																			// 받아옵니다.
		System.out.println("왔어?");
		List<Map<String, Object>> goodsServiceList; // 얘는 resultType을 hashmap으로
													// 받아서 다음과 같이 mapping을 해준다.

		String[] date = from_to_date.split("-");

		HashMap<String, Object> dateMap = new HashMap<String, Object>();
		dateMap.put("from_date", date[0]);
		dateMap.put("to_date", date[1]);
		System.out.println(date[0] + "aaaaaaa" + date[1]);
		goodsServiceList = goodsDAO.changeDateGoodsList(dateMap);
		System.out.println(">>>>>>>>>" + goodsServiceList);
		return goodsServiceList;
	}

	// 검색버튼 눌렀을 때 검색하는 부분
	@RequestMapping("/historySearch.dodam")
	@ResponseBody
	public List<GoodsVO> historySearch(GoodsVO goodsVO) {

		String[] date = goodsVO.getRangedate().split("-");
		goodsVO.setFrom_date(date[0]);
		goodsVO.setEnd_date(date[1]);

		List<GoodsVO> list = goodsDAO.historySearch(goodsVO);
		System.out.println(list);
		return list;
	}

}
