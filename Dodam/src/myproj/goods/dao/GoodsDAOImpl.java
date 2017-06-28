package myproj.goods.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		System.out.println(">>>>"+goodsSearch);
		
		List<GoodsVO> result =  goods.selectList("goods.searchList",goodsSearch);
//		System.out.println("result는느느느느는"+result.size());
		return result;
		
	}
	
//	@Override
//	public List<GoodsVO> historylist() {
//		
//		return goods.selectList("goods.historylist");
//	}


	
	
}
