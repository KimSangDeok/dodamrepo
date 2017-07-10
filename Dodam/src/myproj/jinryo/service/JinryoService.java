package myproj.jinryo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import myproj.jinryo.dto.JinryoImageVO;
import myproj.jinryo.dto.JinryoVO;
import myproj.jinryo.dto.JinryoVitalVO;

public interface JinryoService {

	List<HashMap> selectByAnimalNum(String animalNum);
	
	Map selectMonjin();

	List<HashMap> selectSmMonjin(String bigMenu, String midMenu);
	
	List <String> selectTxTrMenu(String txtrType);

	List<HashMap> selectSmTx(String txLargeMenu);

	List<HashMap> selectRxList();
	
	List<HashMap> selectJindanList(String word);
	
	int insertJinryoChart(String monjinSaveMenus, JinryoVO jinryoVO, JinryoVitalVO jinryoVitalVO, JinryoImageVO jinryoImageVO, HttpSession session);
}
