package myproj.jinryo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface JinryoService {

	List<HashMap> selectByAnimalNum(String animalNum);
	
	Map selectMonjin();

	List<HashMap> selectSmMonjin(String bigMenu, String midMenu);
	
	List <String> selectTxTrMenu(String txtrType);

	List<HashMap> selectSmTx(String txLargeMenu);

	List<HashMap> selectRxList();
}
