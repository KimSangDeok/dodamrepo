package myproj.jinryo.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import myproj.jinryo.dto.JinryoImageVO;
import myproj.jinryo.dto.JinryoVO;
import myproj.jinryo.dto.JinryoVitalVO;
import myproj.jinryo.service.JinryoService;

@Controller
@RequestMapping({"/jinryo","/jinryo/treeMenu"})
public class JinryoController {
	
	@Autowired
	JinryoService jinryoService;

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/jinryo/"+url;
	}
	
	/**
	 * @return 대기중인 환자를 보는 페이지로 이동(jinryoView)
	 * 	chartForm.jsp 에서 진료작성을 하고 '차트생성' 버튼 클릭시 진료내용 insert
	 */
	@RequestMapping("/chartInsert.dodam")
	public String chartInsert(String monjinSaveMenus, JinryoVO jinryoVO, JinryoVitalVO jinryoVitalVO, JinryoImageVO jinryoImageVO,  HttpSession session){
		
//		System.out.println("monjinSaveMenus : "+monjinSaveMenus);
		
//		System.out.println("getJryo_diseases : "+jinryoVO.getJryo_diseases());
//		System.out.println("getSymptom : "+jinryoVO.getSymptom());
//		System.out.println("getJryo_tx : "+jinryoVO.getJryo_tx());
//		System.out.println("getJryo_rx : "+jinryoVO.getJryo_rx());
//		System.out.println("getJryo_memo : "+jinryoVO.getJryo_memo());
//		System.out.println("getJryo_price : "+jinryoVO.getJryo_price());
		
//		System.out.println("getVt_num"+jinryoVitalVO.getVt_num());
//		System.out.println("getJryo_num"+jinryoVitalVO.getJryo_num());
//		System.out.println("getVt_weight >"+jinryoVitalVO.getVt_weight());
//		System.out.println("getVt_temperature >"+jinryoVitalVO.getVt_temperature());
//		System.out.println("getVt_systolic_blood >"+jinryoVitalVO.getVt_systolic_blood());
//		System.out.println("getVt_diastolic_blood >"+jinryoVitalVO.getVt_diastolic_blood());
//		System.out.println("getVt_heart_rate >"+jinryoVitalVO.getVt_heart_rate());
//		System.out.println("getVt_breathing_rate >"+jinryoVitalVO.getVt_breathing_rate());

		
//		System.out.println("[0].getJr_img_num() >"+jinryoImageVO[0].getJr_img_num());
//		System.out.println("[0].getJryo_num() >"+jinryoImageVO[0].getJryo_num());
//		System.out.println("[0].getJr_img_name() >"+jinryoImageVO.getJr_img_name()[0]);
//		System.out.println("[0].getJr_img_fake_name() >"+jinryoImageVO.getJr_img_fake_name()[0]);
		
		
//		System.out.println("[1].getJr_img_num() >"+jinryoImageVO[1].getJr_img_num());
//		System.out.println("[1].getJryo_num() >"+jinryoImageVO[1].getJryo_num());
//		System.out.println("[1].getJr_img_name() >"+jinryoImageVO.getJr_img_name()[1]);
//		System.out.println("[1].getJr_img_fake_name() >"+jinryoImageVO.getJr_img_fake_name()[1]);
		
		int result = jinryoService.insertJinryoChart(monjinSaveMenus, jinryoVO, jinryoVitalVO, jinryoImageVO, session);
		return "/jinryo/jinryoView";
		
//		return "/jinryo/jinryoView";
	}
	
	/**
	 * @param type 차트생성의 팝업창 종류
	 * @return ModelAndView (사용될 메뉴들의 리스트)
	 * 차트생성의 TreeMenu가 사용되는 팝업창에서 사용
	 */
	@RequestMapping("/monjin.dodam")
	public ModelAndView selectTreeMenu(String type){
		
		Map monjinMap = jinryoService.selectMonjin();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jinryo/treeMenu/monjin.treeTile");
		mv.addObject("bigMenus", monjinMap.get("bigMenus"));
		mv.addObject("midMenus", monjinMap.get("midMenus"));
		
		return mv;
	}
	
	/**
	 * @param type tx or tr
	 * @return 메뉴리스트
	 * 차트생성에서 처치/처방 팝업에의 TreeMenu 목록
	 */
	@RequestMapping("/cccbPopup.dodam")
	public ModelAndView selectTxTrMenu(String type){
		
		ModelAndView mv = new ModelAndView();
		if(type.equals("Tx")){
			List <String> txtrList = jinryoService.selectTxTrMenu(type);
			mv.setViewName("/jinryo/treeMenu/txtr.treeTile");
			mv.addObject("txList", txtrList);
		}else if(type.equals("tr")){
			
		}
		
		return mv;
	}
	
	/**
	 * @param txLargeMenu Tx에서 선택한 카테고리명
	 * @return 해당하는 소메뉴명과 가격들
	 *  Tx팝업에 해당하는 리스트와 가격
	 */
	@RequestMapping("/smTx.dodam")
	@ResponseBody
	public List<HashMap> smTx(String txLargeMenu){
		
		List<HashMap> smData = jinryoService.selectSmTx(txLargeMenu);
		return smData;
	}
	
	/**
	 * @param bigMenu 대메뉴값
	 * @param midMenu 중메뉴값
	 * @return List<HashMap> 소메뉴의 질문들
	 * 대메뉴와 중메뉴에 해당하는 소메뉴 질문리스트
	 */
	@RequestMapping("/smMonjin.dodam")
	@ResponseBody
	public List<HashMap> smMonjin(String bigMenu, String midMenu){
		
		List<HashMap> smData = jinryoService.selectSmMonjin(bigMenu, midMenu);
		return smData;
	}
	
	/**
	 * @param animal_num 동물의 번호
	 * @return List<HashMap> 주인 정보, 진료내역정보
	 * 동물의 번호로 주인의 정보와 진료내역
	 */
	@RequestMapping("/selectByAnimalNum.dodam")
	@ResponseBody
	public List<HashMap> selectByAnimalNum(String animal_num){
		
		List<HashMap> selectHistoryList = jinryoService.selectByAnimalNum(animal_num);
		return selectHistoryList;
	}
	
	/**
	 * @param 
	 * @return 
	 * 
	 */
	@RequestMapping("/rxList.dodam")
	@ResponseBody
	public List<HashMap> rxList(){
		
		List<HashMap> rxList = jinryoService.selectRxList();
		return rxList;
	}
	
	
	@RequestMapping("/jindan.dodam")
	@ResponseBody
	public List<HashMap> selectJindanList(String word){
		
		List<HashMap> jindanList = jinryoService.selectJindanList(word);
		return jindanList;
	}
	
	@RequestMapping(value="/monjinSessionSave.dodam", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String monjinSessionSave(@RequestBody String menuNameAndData, HttpSession session){
		
		
		try {
			String temp = URLDecoder.decode(menuNameAndData, "UTF-8");
			menuNameAndData = temp.replace("=", "");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 스트링으로 넘어온 데이터를 jsonObj에 json형식으로 넣는거.
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject)jsonParser.parse(menuNameAndData);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 각 room에 대한 정보가 배열로 되어있움
		JSONArray data = (JSONArray)jsonObj.get("data");
		String categoryName = (String)jsonObj.get("categoryName");
//		for(int i=0; i<data.size();i++){
//			
//			System.out.println("data["+i+"] : "+data.get(i));
//		}
//		System.out.println("============================================================");
		session.setAttribute(categoryName, data);
		
		JSONArray saveList2 =(JSONArray) session.getAttribute(categoryName);
//		for(int i=0; i<saveList2.size();i++){
//			
//			System.out.println("saveList2["+i+"] : "+saveList2.get(i));
//		}
		return "임시저장 성공";
	}
	
	@RequestMapping(value="/monjinSessionLoad.dodam", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String monjinSessionLoad(@RequestBody String bigAndMid, HttpSession session){
		
		try {
			String temp = URLDecoder.decode(bigAndMid, "UTF-8");
			bigAndMid = temp.replace("=", "");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 스트링으로 넘어온 데이터를 jsonObj에 json형식으로 넣는거.
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject)jsonParser.parse(bigAndMid);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
//		System.out.println("jsonObj.get(bigAndMid) : "+jsonObj.get("bigAndMid"));
		
		JSONArray dataList =(JSONArray) session.getAttribute((String)jsonObj.get("bigAndMid"));
		
		if(dataList != null) {
			
//			for(int i=0; i<dataList.size();i++){
//				System.out.println("dataList["+i+"] : "+dataList.get(i));
//			}
		}
		
		if(dataList != null){
			return dataList.toJSONString();
		}else{
			return "isNull";
		}
	}
	
	

	// 진료num(String jryo_num)을 가지고 진료를 봤던 상세 기록 내용을 가져와야 한다
	@RequestMapping("/detail.dodam")
	public ModelAndView showJinryoDetailList(String jryo_num){
		
		// 1. 진료테이블에 있는 내용을 모두 가져와라. (가져갈 주요 정보 : 진료넘버, 의사, 진료날짜, 증상, 처치, 처방)
		HashMap<String, Object> jinryoTableDetail = jinryoService.selectJinryoTable(jryo_num);
		
		// 2. 문진기록 내용을 모두 가져와라.
		List<Map<String, Object>> moonjinHistory = jinryoService.selectMoonjin(jryo_num);
		
		// 3. 차트검사이미지 모두 불러오기
		List<Map<String, Object>> charImageHistory = jinryoService.selectChartImage(jryo_num);
		
		// 4. 진단내역 모두 가져와라.(바이탈 테이블 내용 모두 가져오기)
		List<Map<String, Object>> jindanHistory = jinryoService.selectVital(jryo_num);				
		

		
		
		System.out.println(jryo_num);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/jinryo/detail");
		mv.addObject("jinryo", jinryoTableDetail);
		mv.addObject("moonjinHistory", moonjinHistory);
		mv.addObject("charImageHistory", charImageHistory);
		mv.addObject("jindanHistory", jindanHistory);
		
		
		return mv;
		
	}
	
}
