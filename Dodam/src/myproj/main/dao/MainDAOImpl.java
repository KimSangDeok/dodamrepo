package myproj.main.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import myproj.main.dto.MainVO;

@Repository
public class MainDAOImpl implements MainDAO {

	@Autowired
	SqlSessionTemplate main;

	@Override
	public MainVO memberLogin(MainVO vo) {
		MainVO mainVo = null;
		try{
			mainVo = main.selectOne("main.idCheck", vo);
		}catch( Exception ex )
		{
			System.out.println("MainDAOImpl / idCheck 실패 : " + ex.getMessage());
		}
		return mainVo;
	}
	
	@Override
	public MainVO idCheck(MainVO vo) {
		MainVO mainVo = null;
		try{
			mainVo = main.selectOne("main.idCheck",vo);
		}catch( Exception ex )
		{
			System.out.println("MainDAOImpl / idCheck 실패 : " + ex.getMessage());
		}
		return mainVo;
	}

	@Override
	public int memberInsert(MainVO vo) {
		int result = 0;
		try {
			result = main.insert("main.userInsert", vo);
		} catch (Exception e) {
			System.out.println("MainDAOImpl / memberInsert 실패 : " + e.getMessage());
		}
		return result;
	}

	@Override
	public List<MainVO> doctorSelect() {

		return main.selectList("main.doctorName");
	}
	
	

}
