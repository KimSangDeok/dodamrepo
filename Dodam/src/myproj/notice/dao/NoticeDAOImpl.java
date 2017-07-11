package myproj.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myproj.notice.dto.NoticeVO;


@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	SqlSessionTemplate notice;
	
	// 공지사항 목록 가져오기
	@Override
	public List<NoticeVO> list() {
		
		return notice.selectList("notice.list");
	}
	
	// 해당 공지사항 보여주기
	@Override
	public NoticeVO noticeView(NoticeVO vo) {
		// 조회수 증가
		notice.update("notice.hits",vo);
		
		return notice.selectOne("notice.view", vo);
	}
	
	// 공지사항 작성
	@Override
	public int boardInsert(NoticeVO vo) {
		
		return notice.insert("notice.insert", vo);
	}
	
	// 공지사항 수정
	@Override
	public int boardEdit(NoticeVO vo) {
		
		return notice.update("notice.edit",vo);
	}
	
	// 공지사항 삭제
	@Override
	public int boardDelete(NoticeVO vo) {
		
		return notice.delete("notice.delete", vo);
	}
}
