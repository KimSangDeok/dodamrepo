package myproj.jinryo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JinryoDAOImpl implements JinryoDAO{

	@Autowired
	SqlSessionTemplate jinroySstp;

	String namespace="jrmapper.";
	
	@Override
	public List<HashMap> selectByAnimalNum(String animalNum) {
		
		return jinroySstp.selectList(namespace+"selectByAnimalNum",animalNum);
	}

	@Override
	public Map selectMonjin() {

		List<String> bigMenus = jinroySstp.selectList(namespace+"selectMonjinBig");
		List<List> midMenus = new ArrayList<List>();
		
		for(int i=0; i<bigMenus.size(); i++){
			
			midMenus.add( jinroySstp.selectList(namespace+"selectMonjinMid",bigMenus.get(i)));
		}
		
		Map menuMap = new HashMap();
		menuMap.put("bigMenus", bigMenus);
		menuMap.put("midMenus", midMenus);
		
		return menuMap;
	}
	
}
