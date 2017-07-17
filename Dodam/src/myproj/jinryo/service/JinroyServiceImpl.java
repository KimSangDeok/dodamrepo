package myproj.jinryo.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import myproj.jinryo.dao.JinryoDAO;
import myproj.jinryo.dto.JinryoImageVO;
import myproj.jinryo.dto.JinryoVO;
import myproj.jinryo.dto.JinryoVitalVO;

@Service
public class JinroyServiceImpl implements JinryoService{

	@Autowired
	JinryoDAO jdao;
	
	/* 
	 * @see myproj.jinryo.service.JinryoService#selectByAnimalNum(java.lang.String)
	 * @param animalNum 동물의 번호
	 * @return List<HashMap> 주인 정보, 진료내역정보
	 * 
	 */
	@Override
	public List<HashMap> selectByAnimalNum(String animalNum) {
		
		return jdao.selectByAnimalNum(animalNum);
	}

	/* 
	 * @see myproj.jinryo.service.JinryoService#selectMonjin()
	 * @return Map (대메뉴리스트, 중메뉴리스트)
	 * 
	 */
	@Override
	public Map selectMonjin() {

		return jdao.selectMonjin();
	}

	/* 
	 * @see myproj.jinryo.service.JinryoService#selectSmMonjin(java.lang.String, java.lang.String)
	 * @param bigMenu 대메뉴값
	 * @param midMenu 중메뉴값
	 * @return List<HashMap> 소메뉴 질문리스트
	 * 
	 */
	
	@Override
	public List<HashMap> selectSmMonjin(String bigMenu, String midMenu) {
		
		return jdao.selectSmMonjin(bigMenu, midMenu);
	}

	/* 
	 * @see myproj.jinryo.service.JinryoService#selectTxTrMenu(java.lang.String)
	 * @param txtrType tx 혹은 tr
	 * @return tx 혹은 tr 리스트
	 */
	@Override
	public List<String> selectTxTrMenu(String txtrType) {
		
		return jdao.selectTxTrMenu(txtrType);
	}

	/* 
	 * @see myproj.jinryo.service.JinryoService#selectSmTx(java.lang.String)
	 * @param txLargeMenu Tx에서 선택한 카테고리명
	 * @return 해당하는 소메뉴명과 가격들
	 */
	@Override
	public List<HashMap> selectSmTx(String txLargeMenu) {
		
		return jdao.selectSmTx(txLargeMenu);
	}
	
	@Override
	public List<HashMap> selectRxList() {

		return jdao.selectRxList();
	}
	
	
	@Override
	public List<HashMap> selectJindanList(String word) {

		return jdao.selectJindanList(word);
	}

	
	
	
	/* 
	 * @param monjinSaveMenus 저장한 문진내용
	 * @param jinryoVO 증상, 진단, 처치,처방, 추가진료예정 내용
	 * @param jinryoVitalVO 바이탈 내용
	 * @param jinryoImageVO 혈액검사, X-ray, CT, 심전도 검사 이미지 여러개 
	 * @param session 세션처리
	 * @param rsvnum 예약 번호
	 */
	@Transactional
	@Override
	public int insertJinryoChart(String monjinSaveMenus, JinryoVO jinryoVO, JinryoVitalVO jinryoVitalVO,
			JinryoImageVO jinryoImageVO, HttpSession session, String rsvnum) {
		
		// 진료 insert
		jdao.insertJinryo(jinryoVO);
		// vital insert
		jdao.insertVital(jinryoVitalVO);
		
		// begin 문진 insert
		// 세션의 키값으로 사용될 값들을 배열 저장
		String[] monjinSaveMenusSplit = monjinSaveMenus.split("//");
		
		for(int i =0; i<monjinSaveMenusSplit.length;i++){
			
			// 질문
			JSONArray monjinArrayTemp =(JSONArray)session.getAttribute(monjinSaveMenusSplit[i]);
			for(int j=0; j<monjinArrayTemp.size();j++){	// null 포함 다도는 갯수, 즉 j는 0~ 마지막 데이터까지
				
				if(monjinArrayTemp.get(j)!=null) {	//null 빼고
					
					Map monjinInertMap = new HashMap();
					monjinInertMap.put("num", j);
					monjinInertMap.put("value", monjinArrayTemp.get(j));
					
					jdao.insertMonjin(monjinInertMap);
				}
			}
		}
		// end 문진 insert
		
		// 이미지 insert
		for(int i=0; i<jinryoImageVO.getJrImgCnt();i++){
			
			Map imgMap = new HashMap();
			imgMap.put("name", jinryoImageVO.getJr_img_name()[i]);
			imgMap.put("fakeName", jinryoImageVO.getJr_img_fake_name()[i]);
			jdao.insertImages(imgMap);
		}
		
		
		//예약 테이블 jinryo state x -> o
		jdao.updateReservationJrState(rsvnum);
		
		
		//진료를 끝낸셈이니 세션 제거
		session.removeAttribute("cusname");
		session.removeAttribute("doctorname");
		session.removeAttribute("custel");
		session.removeAttribute("animalname");
		session.removeAttribute("animalbreed");
		session.removeAttribute("animalnum");
		
		jdao.insertPay(jinryoVO.getAnimal_num(), jinryoVO.getJroy_num(), jinryoVO.getJryo_price());
		
		try{
			for(int i=0; i<jinryoImageVO.getJrImgCnt();i++){
				
				jinryoImageVO.getJinryoImages()[i].transferTo(new File("C:\\Users\\user\\git\\dodamrepo\\Dodam\\WebContent\\imageupload\\chartImages\\"+jinryoImageVO.getJr_img_fake_name()[i]));
			}
		} catch (IllegalStateException e) {				
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return 1;
	}
	
	// Begin Detail-------------------------------------------------------------------------------------------
	// 1. 진료테이블에 있는 내용을 모두 불러옴
	@Override
	public HashMap<String, Object> selectJinryoTable(String jryo_num) {
		HashMap<String, Object> map = jdao.selectJinryoTable(jryo_num);
		
		if(map.get("JRYO_TX")!=null){
			
			String txList=(String)map.get("JRYO_TX");
			String[] txSplit=txList.split("/");
			if(txSplit!=null){
				List<String> temp = new ArrayList<String>();
				for(int i =0; i<txSplit.length;i++){
					
					temp.add((String) jdao.selectTxListByNum(txSplit[i]).get("TX_SMALL"));
				}
				map.put("txList", temp);
			}
		}
		return map;
	}

	// 2. 문진기록 내용을 모두 불러옴
	@Override
	public List<Map<String, Object>> selectMoonjin(String jryo_num) {
		return jdao.selectMoonjin(jryo_num);
	}

	// 3. 차트검사이미지 모두 불러옴
	@Override
	public List<Map<String, Object>> selectChartImage(String jryo_num) {
		return jdao.selectChartImage(jryo_num);
	}

	// 4. 진단내역 모두 불러옴.
	@Override
	public Map<String, Object> selectVital(String jryo_num) {
		return jdao.selectVital(jryo_num);
	}
	// End Detail-------------------------------------------------------------------------------------------

	
	/* 
	 * @param per_id 담당의사 Id
	 * @return List<HashMap<String, Object>>
	 *  오늘 예약된 나의(로그인시 저장된 의사 Id) 접수환자 리스트
	 */
	@Override
	public List<HashMap<String, Object>> selectMyReadyList(String per_id) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
		
		Map map = new HashMap();
		map.put("per_id", per_id);
		map.put("today", strToday);
		return jdao.selectMyReadyList(map);
	}

	/* 
	 * @param animalNum 동물 번호
	 * @return HashMap
	 * 동물 번호로 그 동물의 정보 불러옴
	 */
	@Override
	public HashMap selectAnimalInfoByAnimalNum(String animalNum) {
		
		return jdao.selectAnimalInfoByAnimalNum(animalNum);
	}

	
}
