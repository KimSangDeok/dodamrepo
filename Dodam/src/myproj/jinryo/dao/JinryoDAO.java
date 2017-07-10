package myproj.jinryo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import myproj.jinryo.dto.JinryoVO;
import myproj.jinryo.dto.JinryoVitalVO;


public interface JinryoDAO {

	public List<HashMap> selectByAnimalNum(String animalNum) ;
	
	public Map selectMonjin();

	public List<HashMap> selectSmMonjin(String bigMenu, String midMenu);

	public List<String> selectTxTrMenu(String txtrType);

	public List<HashMap> selectSmTx(String txLargeMenu);

	public List<HashMap> selectRxList();
	
	public List<HashMap> selectJindanList(String word);

	public int insertMonjin(Map monjinInertMap);

	public int insertJinryo(JinryoVO jinryoVO);

	public int insertVital(JinryoVitalVO jinryoVitalVO);

	public int insertImages(Map imgMap);
}
