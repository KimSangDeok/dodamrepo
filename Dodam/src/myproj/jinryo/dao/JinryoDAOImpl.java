package myproj.jinryo.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.jinryo.dto.JinryoVO;
import myproj.jinryo.dto.JinryoVitalVO;

@Repository
public class JinryoDAOImpl implements JinryoDAO{

	@Autowired
	SqlSessionTemplate jinroySstp;

	String namespace="jrmapper.";
	
	/* 
	 * @see myproj.jinryo.service.JinryoService#selectByAnimalNum(java.lang.String)
	 * @param animalNum 동물의 번호
	 * @return List<HashMap> 주인 정보, 진료내역정보
	 */
	@Override
	public List<HashMap> selectByAnimalNum(String animalNum) {
		
		return jinroySstp.selectList(namespace+"selectByAnimalNum",animalNum);
	}

	/* 
	 * @see myproj.jinryo.dao.JinryoDAO#selectMonjin()
	 * @return Map (대메뉴리스트,중메뉴리스트)
	 */
	@Override
	public Map selectMonjin() {
		
		//대메뉴 리스트
		List<String> bigMenus = jinroySstp.selectList(namespace+"selectMonjinBig");
		
		//중메뉴 리스트 담을 List
		List<List> midMenus = new ArrayList<List>();
		//대메뉴값에 해당하는 중메뉴들
		for(int i=0; i<bigMenus.size(); i++){
			
			midMenus.add( jinroySstp.selectList(namespace+"selectMonjinMid",bigMenus.get(i)));
		}
		
		Map menuMap = new HashMap();
		menuMap.put("bigMenus", bigMenus);
		menuMap.put("midMenus", midMenus);
		
		return menuMap;
	}

	/* 
	 * @see myproj.jinryo.dao.JinryoDAO#selectSmMonjin(java.lang.String, java.lang.String)
	 * @param bigMenu 대메뉴값
	 * @param midMenu 중메뉴값
	 * @return List<HashMap> 소메뉴 질문리스트 
	 */
	@Override
	public List<HashMap> selectSmMonjin(String bigMenu, String midMenu) {

		Map map = new HashMap();
		map.put("bigMenu", bigMenu);
		map.put("midMenu", midMenu);
		
		return jinroySstp.selectList(namespace+"selectMonjinSm",map);
	}

	/* 
	 * @see myproj.jinryo.dao.JinryoDAO#selectTxTrMenu(java.lang.String)
	 * @param txtrType tx 혹은 tr
	 * @return tx 혹은 tr 리스트
	 */
	 
	@Override
	public List<String> selectTxTrMenu(String txtrType) {

		return jinroySstp.selectList(namespace+"selectTxTrList",txtrType);
	}

	@Override
	public List<HashMap> selectSmTx(String txLargeMenu) {

		return jinroySstp.selectList(namespace+"selectTxSmList", txLargeMenu);
	}

	@Override
	public List<HashMap> selectRxList() {

		return jinroySstp.selectList(namespace+"selectRxList");
	}

	@Override
	public List<HashMap> selectJindanList(String word) {
		
		return jinroySstp.selectList(namespace+"selectJindanList", word);
	}

	@Override
	public int insertMonjin(Map monjinInertMap) {
		
		jinroySstp.insert(namespace+"insertMonjin", monjinInertMap);
		return 0;
	}

	@Override
	public int insertJinryo(JinryoVO jinryoVO) {
		
		return jinroySstp.insert(namespace+"insertJinryo", jinryoVO);
	}

	@Override
	public int insertVital(JinryoVitalVO jinryoVitalVO) {
		
		return jinroySstp.insert(namespace+"insertVital",jinryoVitalVO);
	}

	@Override
	public int insertImages(Map imgMap) {
			
		return jinroySstp.insert(namespace+"insertImage",imgMap);
	}


	// 민정
	// 1. 진료테이블에 있는 내용을 모두 가져와라.
	@Override
	public HashMap<String, Object> selectJinryoTable(String jryo_num) {
		return jinroySstp.selectOne(namespace+"selectJinryoTable", jryo_num);
	}

	// 2. 문진기록 내용을 모두 가져와라.
	@Override
	public List<Map<String, Object>> selectMoonjin(String jryo_num) {
		return jinroySstp.selectList(namespace+"selectMoonjin", jryo_num);
	}

	// 3. 차트검사이미지 모두 불러오기
	@Override
	public List<Map<String, Object>> selectChartImage(String jryo_num) {
		return jinroySstp.selectList(namespace+"selectChartImage", jryo_num);
//		return null;
	}

	// 4. 진단내역 모두 가져와라.(바이탈 테이블 내용 모두 가져오기)
	@Override
	public Map<String, Object> selectVital(String jryo_num) {
		return jinroySstp.selectOne(namespace+"selectVital", jryo_num);
	}

	@Override
	public Map<String, Object> selectTxListByNum(String txNum) {
		
		return jinroySstp.selectOne(namespace+"selectTxListByNum", txNum);
	}

	@Override
	public List<HashMap<String, Object>> selectMyReadyList(Map map) {
		
		return jinroySstp.selectList(namespace+"selectselectMyReadyList",map);
	}

	@Override
	public HashMap selectAnimalInfoByAnimalNum(String animalNum) {
		
		return jinroySstp.selectOne(namespace+"selectAnimalInfoByAnimalNum", animalNum);
	}

	@Override
	public int updateReservationJrState(String rsvnum) {
		
		return jinroySstp.update(namespace+"updateReservationJrState", rsvnum);
	}

	@Override
	public void insertPay(String animal_num, String jroy_num, String jryo_price) {
		Map map = new HashMap();
		map.put("animal_num", animal_num);
		map.put("jroy_num", jroy_num);
		map.put("jryo_price", jryo_price);
		jinroySstp.insert(namespace+"insertPay",map);
		
	}
}

