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
}
