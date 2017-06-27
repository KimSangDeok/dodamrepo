package myproj.jinryo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myproj.jinryo.dao.JinryoDAO;

@Service
public class JinroyServiceImpl implements JinryoService{

	@Autowired
	JinryoDAO jdao;
	
	@Override
	public List<HashMap> selectByAnimalNum(String animalNum) {
		
		return jdao.selectByAnimalNum(animalNum);
	}

}
