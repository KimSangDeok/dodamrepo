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
	
	int insertJinryoChart(String monjinSaveMenus, JinryoVO jinryoVO, JinryoVitalVO jinryoVitalVO, JinryoImageVO jinryoImageVO, HttpSession session, String rsvnum);

	

	// 1. 진료테이블에 있는 내용을 모두 가져와라. 
	HashMap<String, Object> selectJinryoTable(String jryo_num);

	// 2. 문진기록 내용을 모두 가져와라.
	List<Map<String, Object>> selectMoonjin(String jryo_num);

	// 3. 차트검사이미지 모두 불러오기
	List<Map<String, Object>> selectChartImage(String jryo_num);

	// 4. 진단내역 모두 가져와라.(바이탈 테이블 내용 모두 가져오기)
	Map<String, Object> selectVital(String jryo_num);

	List<HashMap<String,Object>> selectMyReadyList(String per_id);

	HashMap selectAnimalInfoByAnimalNum(String animalNum);

}
