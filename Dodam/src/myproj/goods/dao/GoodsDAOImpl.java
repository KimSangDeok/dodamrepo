package myproj.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.goods.dto.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO{
	
	@Autowired
	SqlSessionTemplate goods;

	//처음에 재고리스트 불러오는 부분
	@Override
	public List<GoodsVO> goodslist() {
		//goods_count_in이랑 goods_count_out이외 다른것들 불러오는 부분

		return goods.selectList("goods.goodslist");
	}
	
	//상품 검색했을때 불러오는 부분
	@Override
	public List<GoodsVO> goodsSearchList(String goodsSearch) {
		
		List<GoodsVO> result =  goods.selectList("goods.searchList",goodsSearch);
		return result;
		
	}
	
	//상품추가할 때 의약품 검색하는 부분
	@Override
	public List<GoodsVO> goodsSearchmedi(GoodsVO goodsVO) {
		System.out.println(goodsVO);
		List<GoodsVO> result =  goods.selectList("goods.searchmedi",goodsVO);
		return result;
	}
	
	//처음에 입고내역 불러오는 부분
//	@Override
//	public List<GoodsVO> historylist() {
//		
//		return goods.selectList("goods.historylist");
//	}
	
	//상품 추가하는 부분
	public void goodsInsert(GoodsVO goodsVO) {
		
		int exist = goods.selectOne("goods.goodsexist",goodsVO);
		System.out.println("존재:"+exist);
		int goodsresult = goods.insert("goods.goodsInsert",goodsVO);
		if(exist>0){
			int stockresult1 = goods.insert("goods.stockUpdate",goodsVO);
//			int stockresult2 = goods.insert("goods.stockUpdate2",goodsVO);
		}else if(exist<1){
			int stockresult = goods.insert("goods.stockInsert",goodsVO);
		}
	}

	//날짜 바뀔때 자동적으로 table이 바뀌는 부분
	@Override
	public List<Map<String, Object>> changeDateGoodsList(HashMap<String, Object> dateMap) {
		
		return goods.selectList("goods.changeDateList", dateMap);
	}

	@Override
	public List<GoodsVO> historySearch(GoodsVO goodsVO) {
		
		return goods.selectList("goods.historySearch",goodsVO);
	}
	
	
}
