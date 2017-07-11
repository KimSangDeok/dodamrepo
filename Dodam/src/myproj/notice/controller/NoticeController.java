package myproj.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import myproj.notice.dao.NoticeDAO;
import myproj.notice.dto.NoticeVO;



@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeDAO noticeDAO;
	
	@RequestMapping("/{url}.dodam")
	public String show(@PathVariable String url){
		return "/notice/"+url+".notile";
	}
	
	// 공지사항 리스트
	@RequestMapping("/noticeList.dodam")
	public ModelAndView list(){
		List<NoticeVO> result = noticeDAO.list();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("listModel", result);
		mv.setViewName("notice/noticeList");
		return mv;
	}
	
	// 해당글보기, 수정시 해당글 불러오기
	@RequestMapping(value={"/noticedetail.dodam", "/noticeedit.dodam"})
	public ModelAndView view(NoticeVO noticeVO){
		
		NoticeVO result = noticeDAO.noticeView(noticeVO);
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("model", result);
		
		return mv;
	}
	
	// 글쓰기
	@RequestMapping("/write_ok.dodam")
	public ModelAndView insert(NoticeVO noticeVO){
		String message = "작성실패";
		int result = noticeDAO.boardInsert(noticeVO);
		
		if( result > 0 ) message = "작성완료";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("result", result);
		mv.setViewName("notice/write_ok");
		
		return mv;
	}
	
	// 공지사항 수정
	@RequestMapping("/edit_ok.dodam")
	public ModelAndView edit(NoticeVO noticeVO){
		String message = "수정실패";
		String state = "no";
		int result = noticeDAO.boardEdit(noticeVO);
		
		if( result > 0 ){
			message = "수정완료";
			state = "yes";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("state", state);
		mv.addObject("notice_num", noticeVO.getNotice_num());
		mv.setViewName("notice/edit_ok");
		
		return mv;
	}
	
	// 공지사항 삭제
	@RequestMapping("/delete_ok.dodam")
	public ModelAndView delete(NoticeVO noticeVO){
		String message = "삭제실패";
		String state = "no";
		int result = noticeDAO.boardDelete(noticeVO);
		
		if( result > 0 ){
			message = "삭제완료";
			state = "yes";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("message", message);
		mv.addObject("state", state);
		mv.setViewName("notice/delete_ok");
		
		return mv;
	}
}
