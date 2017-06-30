package myproj.goods.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.customer.dto.CustomerVO;
import myproj.goods.dto.GoodsVO;

@Repository
public class GoodsDAOImpl implements GoodsDAO{
	
	@Autowired
	SqlSessionTemplate goods;

	@Override
	public List<GoodsVO> goodslist() {
		
		return goods.selectList("goods.goodslist");
	}

	@Override
	public List<GoodsVO> goodsSearchList(String goodsSearch) {
		
		List<GoodsVO> result =  goods.selectList("goods.searchList",goodsSearch);
		return result;
		
	}

	@Override
	public List<GoodsVO> goodsSearchmedi(String medisearchtxt) {
		System.out.println(medisearchtxt);
		List<GoodsVO> result =  goods.selectList("goods.searchmedi",medisearchtxt);
		return result;
	}
	
//	@Override
//	public List<GoodsVO> historylist() {
//		
//		return goods.selectList("goods.historylist");
//	}

	public int goodsInsert(GoodsVO goodsVO) {
				
		return goods.insert("goods.goodsInsert",goodsVO); 
	}
	
	
}
