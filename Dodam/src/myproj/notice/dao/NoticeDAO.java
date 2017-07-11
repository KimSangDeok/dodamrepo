package myproj.notice.dao;

import java.util.List;

import myproj.notice.dto.NoticeVO;

// Interface!!
public interface NoticeDAO {
	

	// 게시물 목록 가져오기
	List<NoticeVO> list();

	// 해당 게시물 보여주기
	NoticeVO noticeView(NoticeVO vo);
		
	// 게시물 등록하기
	int boardInsert( NoticeVO vo);
	
	// 게시물 수정하기
	int boardEdit( NoticeVO vo);
	
	// 게시물 삭제하기
	int boardDelete( NoticeVO vo);
}
