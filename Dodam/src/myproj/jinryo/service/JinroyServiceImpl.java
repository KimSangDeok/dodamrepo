package myproj.jinryo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myproj.jinryo.dao.JinryoDAO;

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

}
