package myproj.jinryo.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JinryoDAO {

	@Autowired
	SqlSessionTemplate jinroySstp;
	
	String namespace="jrmapper.";
	
	public List<HashMap> selectByAnimalNum(String animalNum){
		
		return jinroySstp.selectList(namespace+"selectByAnimalNum",animalNum);
	}
}
