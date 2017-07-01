package myproj.jinryo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface JinryoService {

	List<HashMap> selectByAnimalNum(String animalNum);
	
	Map selectMonjin();
}
