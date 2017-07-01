package myproj.jinryo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface JinryoDAO {

	public List<HashMap> selectByAnimalNum(String animalNum) ;
	
	public Map selectMonjin();
}
