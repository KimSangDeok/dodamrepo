package myproj.jinryo.service;

import java.io.File;
import java.io.IOException;
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

	@Transactional
	@Override
	public int insertJinryoChart(String monjinSaveMenus, JinryoVO jinryoVO, JinryoVitalVO jinryoVitalVO,
			JinryoImageVO jinryoImageVO, HttpSession session) {
		
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
		
		
		
//		String path = JinroyServiceImpl.class.getResource("").getPath();
//		 System.out.println(System.getProperty("user.dir"));
		
		
		
		// 파일 업로드 부분. 따로 만들어서 호출해야하나 일단 여기에 작성 ㄱㄱ
//		File f = );
		
		try{
			for(int i=0; i<jinryoImageVO.getJrImgCnt();i++){
				
				jinryoImageVO.getJinryoImages()[i].transferTo(new File("C:\\Users\\kosta\\git\\dodamrepo\\Dodam\\WebContent\\imageupload\\chartImages\\"+jinryoImageVO.getJr_img_fake_name()[i]));
			}
		} catch (IllegalStateException e) {				
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return 1;
	}
}
