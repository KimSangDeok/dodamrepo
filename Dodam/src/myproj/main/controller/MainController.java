package myproj.main.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myproj.main.dao.MainDAOImpl;
import myproj.main.dto.MainVO;

@Controller
@RequestMapping("/main")
public class MainController {

	@Autowired
	MainDAOImpl mainDao;

	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		System.out.println("main컨트롤");
		return "/main/"+url+".notile";
	}
	
	@RequestMapping("/main.dodam")
	public ModelAndView showNaverNews(){
		String resultNews = null;
		
		String clientId = "2bTpYTGz1Lq7aDI2wBK_";		//애플리케이션 클라이언트 아이디값";
		String clientSecret = "ZPjf6OFpfo";				//애플리케이션 클라이언트 시크릿값";
		
        try {
            String text = URLEncoder.encode("반려동물", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text+"&sort=sim"; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine+"\n");
            }
            br.close();
            System.out.println(response.toString());
            resultNews = response.toString();			// 스트링으로 변화해서 넘겨줍시다~~~
        } catch (Exception e) {
            System.out.println(e);
        }
 
        ModelAndView mv = new ModelAndView();
        mv.addObject("resultNews", resultNews);	
        mv.setViewName("/main/main.notile");			// main.jsp는 타일즈를 타면 안된다!!! ".notile"을 사용한다~
		return mv;
	}
	
	//로그인
	@RequestMapping("/login.dodam")
	public ModelAndView login(MainVO vo, HttpSession session){
		String message = "아이디 또는 비밀번호를 다시 확인하세요.";
		int result = 0;

		MainVO reVO = mainDao.memberLogin(vo);
		if( reVO != null ){
			result = 1;
			message = "로그인 성공";
			session.setAttribute("userName", reVO.getPer_name());
			session.setAttribute("userid", vo.getPer_id());
			//session.setAttribute("sessionTime", new Date().toString());
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("result", result);
		mv.setViewName("main/login_ok");

		return mv;
	}

}
