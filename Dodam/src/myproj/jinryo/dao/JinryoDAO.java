package myproj.jinryo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface JinryoDAO {

	public List<HashMap> selectByAnimalNum(String animalNum) ;
	
	public Map selectMonjin();

	public List<HashMap> selectSmMonjin(String bigMenu, String midMenu);

	public List<String> selectTxTrMenu(String txtrType);

	public List<HashMap> selectSmTx(String txLargeMenu);

	public List<HashMap> selectRxList();
}
