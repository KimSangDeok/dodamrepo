package myproj.goods.dao;

import java.util.List;

import myproj.goods.dto.GoodsVO;

public interface GoodsDAO {

	
	/**
	 * 재고게시물 목록 가져오기
	 */
	List<GoodsVO> goodslist();

//	List<GoodsVO> historylist();
	List<GoodsVO> goodsSearchList(String goodsSearch);
	
	List<GoodsVO> goodsSearchmedi(String medisearchtxt);

	int goodsInsert(GoodsVO goodsVO);

	
	
}
