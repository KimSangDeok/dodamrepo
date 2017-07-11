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

	// 1. 진료테이블에 있는 내용을 모두 가져와라.
	public HashMap<String, Object> selectJinryoTable(String jryo_num);

	// 2. 문진기록 내용을 모두 가져와라.
	public List<Map<String, Object>> selectMoonjin(String jryo_num);

	// 3. 차트검사이미지 모두 불러오기
	public List<Map<String, Object>> selectChartImage(String jryo_num);

	// 4. 진단내역 모두 가져와라.(바이탈 테이블 내용 모두 가져오기)
	public List<Map<String, Object>> selectVital(String jryo_num);

}
