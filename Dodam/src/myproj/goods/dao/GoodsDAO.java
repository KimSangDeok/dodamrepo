package myproj.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import myproj.goods.dto.GoodsVO;

public interface GoodsDAO {

	
	/**
	 * 재고게시물 목록 가져오기
	 */
//	상품전체 불러오는 부분
	List<GoodsVO> goodslist();

	//입출고내역 검색하는 부분
	List<GoodsVO> historySearch(GoodsVO goodsVO);
	
	//재고 검색하는 부분
	List<GoodsVO> goodsSearchList(String goodsSearch);
//	
	//상품추가할 때 품목 검색하는 부분
	List<GoodsVO> goodsSearchmedi(GoodsVO goodsVO);

	//상품추가하는 부분
	void goodsInsert(GoodsVO goodsVO);
	
	//날짜 바뀔때 자동적으로 table이 바뀌는 부분
	List<Map<String, Object>> changeDateGoodsList(HashMap<String, Object> dateMap);

	
	
}
